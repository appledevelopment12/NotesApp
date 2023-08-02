//
//  Note+CoreDataClass.swift
//  NotesApp
//
//  Created by Rajeev on 02/08/23.
//
//

import Foundation
import CoreData

@objc(Note)
public class Note: NSManagedObject {
    
    var title: String {
        return text.trimmingCharacters(in: .whitespacesAndNewlines).components(separatedBy: .newlines).first ?? "" // returns the first line of the text
    }
    
    var desc: String {
        var lines = text.trimmingCharacters(in: .whitespacesAndNewlines).components(separatedBy: .newlines)
        lines.removeFirst()
        return "\(lastUpdated.format()) \(lines.first ?? "")" // return second line
    }
    
    
    
}



//
//  Note.swift
//  NotesApp
//
//  Created by Rajeev on 01/08/23.
//
//
//import Foundation
//
//class Note {
//    let id = UUID()
//    var text: String = ""
//    var lastUpdated: Date = Date()
//
//    var title: String {
//        return text.trimmingCharacters(in: .whitespacesAndNewlines).components(separatedBy: .newlines).first ?? "" // returns the first line of the text
//    }
//
//    var desc: String {
//        var lines = text.trimmingCharacters(in: .whitespacesAndNewlines).components(separatedBy: .newlines)
//        lines.removeFirst()
//        return "\(lastUpdated.format()) \(lines.first ?? "")" // return second line
//    }
//}
