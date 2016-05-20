
import UIKit
import CoreData

class AddPet : UIViewController, UITextFieldDelegate, UITextViewDelegate {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var labelSpecie: UILabel!
    
    let tableIdentifier = "CellSpecie"
    
    var managedObjectContext : NSManagedObjectContext?
    
    var tableSource = ["Собака","Кошка","Птица","Грызун","Кролик","Хорьки","Паук","Змея","Рыба"]
    
  lazy var note: Note? = {
    if let context = self.managedObjectContext {
      return NSEntityDescription.insertNewObjectForEntityForName("Note", inManagedObjectContext: context) as? Note
    }
    return .None
    }()
  
    required init (coder aDecoder:(NSCoder!)){
        super.init(coder:aDecoder)!
    }
    
  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    
  }
  
     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableSource.count
    }
  
    func tableView(tableView: UITableView!,
                   cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!{
        
        let cell:UITableViewCell = UITableViewCell(style:UITableViewCellStyle.Default, reuseIdentifier:tableIdentifier)
        
        cell.textLabel?.text = tableSource[indexPath.row]
        
        return cell
    }
    
     func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let path = tableView.indexPathForSelectedRow
        let cell = tableView.cellForRowAtIndexPath(path!)
        
        labelSpecie.text = cell!.textLabel?.text
    }

  @IBAction func saveNote() {
      note?.title = nameField.text
      note?.body = labelSpecie.text
      
      if let managedObjectContext = managedObjectContext {
      do {
      try  managedObjectContext.save()
      }
      catch let error as NSError {
    print("Ошибка сохранения \(error)", terminator: "")
        }
      }
      performSegueWithIdentifier("unwindToNotesList", sender: self)
  }
  
  func textFieldShouldReturn(textField: UITextField) -> Bool {
        saveNote()
        textField.resignFirstResponder()
        return false
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
  }
}
