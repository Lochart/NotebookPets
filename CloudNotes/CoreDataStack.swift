
import Foundation
import CoreData
import CloudKit

class CoreDataStack: CustomStringConvertible {
  var modelName : String
  var storeName : String
  var options : [String : AnyObject]?
  
  init(modelName:String, storeName:String, options: [String : AnyObject]? = nil) {
    self.modelName = modelName
    self.storeName = storeName
    self.options = options
  }
  
  var description : String {
    return "context: \(context)\n" +
      "modelName: \(modelName)" +
      "storeURL: \(storeURL)\n"
  }
  
  var modelURL : NSURL {
    return NSBundle.mainBundle().URLForResource(self.modelName, withExtension: "momd")!
  }
  
  var storeURL : NSURL {
    var storePaths = NSSearchPathForDirectoriesInDomains(.ApplicationSupportDirectory, .UserDomainMask, true) as [String]
    let storePath = String(storePaths[0]) as NSString
    let fileManager = NSFileManager.defaultManager()
    
    do {
      try fileManager.createDirectoryAtPath(storePath as String, withIntermediateDirectories: true, attributes: nil)
    } catch let error as NSError {
      print("Error creating storePath \(storePath): \(error)")
    }
    let sqliteFilePath = storePath.stringByAppendingPathComponent(storeName + ".sqlite")
    return NSURL(fileURLWithPath: sqliteFilePath)
  }
  
  lazy var model : NSManagedObjectModel = NSManagedObjectModel(contentsOfURL: self.modelURL)!
  
  var store : NSPersistentStore?
  
  lazy var coordinator : NSPersistentStoreCoordinator = {
    let coordinator = NSPersistentStoreCoordinator(managedObjectModel: self.model)
    do {
      self.store = try coordinator.addPersistentStoreWithType(
        NSSQLiteStoreType,
        configuration: nil,
        URL: self.storeURL,
        options: self.options)
    } catch var error as NSError {
      print("Store Error: \(error)")
      self.store = nil
    } catch {
      fatalError()
    }
    return coordinator
  }()
  
  lazy var context : NSManagedObjectContext = {
    let context = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
    context.persistentStoreCoordinator = self.coordinator
    return context
  }()
    
    var updateContextWithUbiquitousContentUpdates: Bool = false {
        willSet {
            ubiquitousChangesObserver = newValue ?
            NSNotificationCenter.defaultCenter() : nil
        }
    }
    
    private var ubiquitousChangesObserver: NSNotificationCenter? {
        didSet {
            oldValue?.removeObserver(self, name: NSPersistentStoreDidImportUbiquitousContentChangesNotification, object: coordinator)
            ubiquitousChangesObserver?.addObserver(self, selector: #selector(CoreDataStack.persistentStoreDidImportUbiquitousContentChanges(_:)), name: NSPersistentStoreDidImportUbiquitousContentChangesNotification, object: coordinator)
        }
    }
    
    @objc func persistentStoreDidImportUbiquitousContentChanges(notification: NSNotification) {
        NSLog("Merging ubiquitous content changes")
        context.performBlock {
            self.context.mergeChangesFromContextDidSaveNotification(notification)
        }
    }
    
}
