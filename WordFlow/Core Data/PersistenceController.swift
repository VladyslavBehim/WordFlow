//
//  PersistenceController.swift
//  WordFlow
//
//  Created by Vladyslav Behim on 16.03.2025.
//

import Foundation
import CoreData

struct PersistenceController{
    static let shared = PersistenceController()
    
    let container : NSPersistentContainer
    
    init (inMemory: Bool = false){
        self.container = NSPersistentContainer(name: "WordFlow")
        
        if inMemory {
            //not save
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }
       
        container.loadPersistentStores { description, error in
            if let error = error as NSError? {
                fatalError("Error loading container \(error), \(error.userInfo)")
            }else{
                print("good")
            }
        }
    }
    
    func save(){
        let context = container.viewContext
        
        guard context.hasChanges else {return}
        do {
            try context.save()
        } catch{
            print("error savings context: \(error)")
        }
    }
    
    static var preview: PersistenceController = {
            let result = PersistenceController(inMemory: true)
            let viewContext = result.container.viewContext
            
            // Добавляем тестовые данные
        let testFolder = CDFolder(imageOfFolder: "🥹", nameOfFolder: "Test Folder", context: viewContext)
            testFolder.imageOfFolder = "Test Image"

            do {
                try viewContext.save()
            } catch {
                fatalError("Ошибка сохранения данных в preview: \(error)")
            }

            return result
        }()
    
    
    
    
    
   
    
}
