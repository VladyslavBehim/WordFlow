//
//  CDWordCard+helper.swift
//  WordFlow
//
//  Created by Vladyslav Behim on 16.03.2025.
//

import Foundation
import CoreData

extension CDWordCard{
    public var id :  String{
        #if DEBUG
        id_ ?? UUID().uuidString
        #else
        get { id_ ?? UUID().uuidString }
        #endif
    }
    
    var word : String{
        get { word_ ?? "" }
        set { word_ = newValue }
        
    }
    
    var translation : String{
        get { translation_ ?? "" }
        set { translation_ = newValue }

    }
    
    convenience init(word: String , translation: String , context : NSManagedObjectContext){
        self.init(context: context)
        self.word = word
        self.translation = translation
    }
     
    public override func awakeFromInsert() {
        self.id_ = UUID().uuidString
    }
    
    static func delete(task: CDWordCard){
        guard let context = task.managedObjectContext else { return }
        context.delete(task)
    }
    
    static func fetch( _ predicate: NSPredicate = .all) -> NSFetchRequest<CDWordCard> {
        let request = CDWordCard.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(keyPath: \CDWordCard.id_, ascending: true)]
        return request
    }
    
    
    static var exampleCDWordCard : CDWordCard{
        let context = PersistenceController.preview.container.viewContext
        let task = CDWordCard(context: context)
        task.id_ = UUID().uuidString
        task.learned = false
        task.word_ = "Hello"
        task.translation_ = "Здравствуйте"
        return task
    }
}
