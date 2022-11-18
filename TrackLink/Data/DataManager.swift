//
//  DataManager.swift
//  TrackLink
//
//  Created by Can Yoldaş on 18.11.2022.
//

import CoreData
import Foundation

final class DataManager: ObservableObject {
    
    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let storeURL = URL.storeURL(for: "group.tracklink", databaseName: "LinkItem")
        let storeDescription = NSPersistentStoreDescription(url: storeURL)
        let container = NSPersistentContainer(name: "LinkItem")
        container.persistentStoreDescriptions = [storeDescription]
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    func getStoredDataFromCoreData() {
            let managedContext = persistentContainer.viewContext
            
            let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "LinkItem")
            do {
                let result = try managedContext.fetch(fetchRequest)
                //Iterate between all the results saved into EntityName
                for data in result {
                    // Do something with the stored data
                }
            } catch let error as NSError {
                 // Replace this implementation with code to handle the error appropriately.
                 // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 let nserror = error as NSError
                 fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    
    func saveContext() {
           let context = persistentContainer.viewContext
           if context.hasChanges {
               do {
                   try context.save()
               } catch {
                   // Replace this implementation with code to handle the error appropriately.
                   // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                   let nserror = error as NSError
                   fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
               }
           }
       }
   }

   public extension URL {
       /// Returns a URL for the given app group and database pointing to the sqlite database.
       static func storeURL(for appGroup: String, databaseName: String) -> URL {
           guard let fileContainer = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: appGroup) else {
               fatalError("Shared file container could not be created.")
           }

           return fileContainer.appendingPathComponent("\(databaseName).sqlite")
       }
   }
