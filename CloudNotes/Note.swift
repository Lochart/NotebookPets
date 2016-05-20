
import Foundation
import CoreData
import UIKit

class Note : NSManagedObject {
  @NSManaged var title : NSString!
  @NSManaged var body : NSString!
  @NSManaged var dateCreated: NSDate!
  
  override func awakeFromInsert() {
    super.awakeFromInsert()
    dateCreated = NSDate()
  }
  
  

}