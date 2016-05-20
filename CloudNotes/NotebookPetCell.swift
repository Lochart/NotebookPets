
import UIKit

class NotebookPetCell: UITableViewCell {
  var note : Note? {
    didSet {
      updateNoteInfo()
    }
  }
  
    @IBOutlet weak var noteNamePet: UILabel!
    @IBOutlet weak var noteSpecie: UILabel!
  
  func updateNoteInfo() {
    if let note = note {
      noteNamePet.text = String(note.title)
      noteSpecie.text = String(note.body)
    }
  }
  
}
