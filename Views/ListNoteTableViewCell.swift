//
//  ListNotesTableViewCell.swift
//  NotesApp
//
//  Created by Rajeev on 01/08/23.
//

import UIKit

class ListNoteTableViewCell: UITableViewCell {
    
    
    
    static let identifier = "ListNoteTableViewCell"
    
    @IBOutlet weak private var titleLbl: UILabel!
    @IBOutlet weak private var descriptionLbl: UILabel!
    
    func setup(note: Note) {
        titleLbl.text = note.title
        descriptionLbl.text = note.desc
    }
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
}
