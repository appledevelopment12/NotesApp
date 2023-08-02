//
//  CoreDataManager.swift
//  NotesApp
//
//  Created by Rajeev on 02/08/23.
//
//let persistentContainer = NSPersistentContainer(name: "modelFileName")

import Foundation
import CoreData

class CoreDataManager
{
    static let shared = CoreDataManager(modelName:"NotesApp")
    
    let persistentContainer:NSPersistentContainer
    //let persistenetContainer = NSPersistentContainer(name: "Note")
   // var persistentContainer = NSPersistentContainer(name: "Note")
    var viewContext:NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    init(modelName:String)
    {
        persistentContainer = NSPersistentContainer(name: modelName)
    }
    func load(completion: (() -> Void)? = nil ) {
        persistentContainer.loadPersistentStores{(description,error) in
            guard error  ==  nil else {
                fatalError(error!.localizedDescription)
            }
            completion?()
        }
    }

    func save()
    {
        if viewContext.hasChanges {
            do
            {
              try  viewContext.save()
            }
            catch
            {
                print("An error ocurred while saving:\(error.localizedDescription)")
            }
        }
    }
    
}

extension CoreDataManager
{
    func createNote() -> Note {
        let note = Note(context: viewContext)
        note.id = UUID()
        note.text = ""
        note.lastUpdated = Date()
        save()
        return note
    }
    
    func fetchNotes() -> [Note]
    {
        let request:NSFetchRequest<Note> = Note.fetchRequest()
        let shortDescriptor = NSSortDescriptor(keyPath: \Note.lastUpdated, ascending: false)
        //request.sortDescriptors = [SortDescriptor]
        return  (try? viewContext.fetch(request)) ?? []
    }
    
    //DELETE rOW
    func deleteNote(_ note:Note)
    {
        viewContext.delete(note)
        save()
    }
}
