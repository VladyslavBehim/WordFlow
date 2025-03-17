//
//  CDFolder+helper.swift
//  WordFlow
//
//  Created by Vladyslav Behim on 16.03.2025.
//

import Foundation
import CoreData

extension CDFolder{
    public var id :  String{
        #if DEBUG
        id_ ?? UUID().uuidString
        #else
        get { id_ ?? UUID().uuidString }
        #endif
    }
    
    var creationDate : Date{
        get { creationDate_ ?? Date() }
    }
    
    var imageOfFolder : String{
        get { imageOfFolder_ ?? "📂" }
        set { imageOfFolder_ = newValue}
    }
    
    var nameOfFolder : String{
        get { nameOfFolder_ ?? "Unknown" }
        set { nameOfFolder_ = newValue }
    }
    
    
    var words: Set<CDWordCard>{
        get { words_ as? Set<CDWordCard> ?? [] }
        set { words_ = newValue as NSSet}
    }
    
    
    convenience init(imageOfFolder: String,nameOfFolder : String , context : NSManagedObjectContext){
        self.init(context: context)
        self.nameOfFolder = nameOfFolder
        self.imageOfFolder = imageOfFolder
    }
    
    
    public override func awakeFromInsert() {
        self.id_ = UUID().uuidString
    }
    
    static func delete(folder : CDFolder){
        guard let context = folder.managedObjectContext else { return }
        
        context.delete(folder)
        PersistenceController.shared.save()
    }
    
    static func fetch(_ predicate: NSPredicate = .all) -> NSFetchRequest<CDFolder> {
        let request = CDFolder.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(keyPath: \CDFolder.id_, ascending: true)]
        return request
    }
    
//    static var example : CDFolder{
//        let context = PersistenceController.preview.container.viewContext
//        let task = CDFolder(imageOfFolder: String, nameOfFolder: "test 1", context: context)
//        task.imageOfFolder = "test image"
//        return task
//    }
}
