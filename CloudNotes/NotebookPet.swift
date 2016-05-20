
import UIKit
import CoreData
import CloudKit

class NotebookPet: UITableViewController, NSFetchedResultsControllerDelegate {
    
  let identifier = "PetCell"
    
  lazy var stack : CoreDataStack = {
    let options = [NSPersistentStoreUbiquitousContentNameKey: "CloudNotes",
                   NSMigratePersistentStoresAutomaticallyOption: true,
                   NSInferMappingModelAutomaticallyOption: true]
    
    return CoreDataStack(modelName: "CloudNotesDataModel", storeName: "CloudNotes", options: options)
  }()
  
  lazy var notes : NSFetchedResultsController = {
    let request = NSFetchRequest(entityName: "Note")
    request.sortDescriptors = [NSSortDescriptor(key: "dateCreated", ascending: false)]
    
    let notes = NSFetchedResultsController(fetchRequest: request, managedObjectContext: self.stack.context, sectionNameKeyPath: nil, cacheName: nil)
    notes.delegate = self
    return notes
    }()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.execCloudKit()
    }
    
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    do {
      try notes.performFetch()
    } catch let error as NSError {
      print("Error fetching data \(error)")
    }
    tableView.reloadData()
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    let objects = notes.fetchedObjects
    return objects?.count ?? 0
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    guard let note = notes.fetchedObjects?[indexPath.row] as? Note else { return UITableViewCell() }
    
    
    if let cell = tableView.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath) as? NotebookPetCell {
      cell.note = note
      return cell
    }
    return UITableViewCell()
  }
  
  
  func controllerWillChangeContent(controller: NSFetchedResultsController) {
  }
  
  func controller(controller: NSFetchedResultsController, didChangeObject anObject: AnyObject, atIndexPath indexPath: NSIndexPath?, forChangeType type: NSFetchedResultsChangeType, newIndexPath: NSIndexPath?) {
    let indexPathsFromOptionals: (NSIndexPath?) -> [NSIndexPath] = { indexPath in
      if let indexPath = indexPath {
        return [indexPath]
      }
      return []
    }
    
    switch type {
    case .Insert:
      tableView.insertRowsAtIndexPaths(indexPathsFromOptionals(newIndexPath), withRowAnimation: .Automatic)
    case .Delete:
      tableView.deleteRowsAtIndexPaths(indexPathsFromOptionals(indexPath), withRowAnimation: .Automatic)
    default:
      break
    }
  }
  
  func controllerDidChangeContent(controller: NSFetchedResultsController) {
  }
    
    func execCloudKit() {
        
        let defaultContainer = CKContainer.defaultContainer()
        
        let publicDatabase = defaultContainer.publicCloudDatabase
        
        let apple: CKRecord = CKRecord(recordType: "Note")
        apple.objectForKey("title")
        apple.objectForKey("body")
        
        publicDatabase.saveRecord(apple) { savedCompany, errCompany in
            
        }
    }
  
  @IBAction
  func unwindToNotesList(segue:UIStoryboardSegue) {
    NSLog("Unwinding to Notes List")
    
    if stack.context.hasChanges {
      do {
        try stack.context.save()
      } catch let error as NSError {
        print("Error saving context: \(error)")
      }
    }
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "addPet" {
      let context = NSManagedObjectContext(concurrencyType: .PrivateQueueConcurrencyType)
      context.parentContext = stack.context
      if let navController = segue.destinationViewController as? UINavigationController {
        if let nextViewController = navController.topViewController as? AddPet {
          nextViewController.managedObjectContext = context
        }
      }
    }
  }
}
