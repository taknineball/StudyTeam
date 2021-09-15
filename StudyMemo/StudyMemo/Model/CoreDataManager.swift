//
//  CoreDataManager.swift
//  StudyMemo
//
//  Created by 탁제원 on 2021/09/15.
//

import UIKit
import CoreData


class CoreDataManager{
    
    static let shared: CoreDataManager = CoreDataManager()
    
    let appDelegate: AppDelegate? = UIApplication.shared.delegate as? AppDelegate
    lazy var context = appDelegate?.persistentContainer.viewContext
    
    let modelName: String = "Memo"
    
    func getMemo(ascending: Bool = false) -> [Memo] {
        var models: [Memo] = [Memo]()
        
        if let context = context {
            let memoSort: NSSortDescriptor = NSSortDescriptor(key: "memo", ascending: ascending)
            let fetchRequest: NSFetchRequest<NSManagedObject> = NSFetchRequest<NSManagedObject>(entityName: modelName)
            fetchRequest.sortDescriptors = [memoSort]
            
            do {
                if let fetchResult: [Memo] = try context.fetch(fetchRequest) as? [Memo] {
                    models = fetchResult
                }
            } catch let error as NSError {
                print("Could not fetch🥺: \(error), \(error.userInfo)")
            }
        }
        
        return models
    }
    
    func saveMemo(text: String, onSuccess: @escaping ((Bool) -> Void)){
        if let context = context,
           let entity:NSEntityDescription = NSEntityDescription.entity(forEntityName: modelName, in: context){
            
            if let memo: Memo = NSManagedObject(entity: entity, insertInto: context) as? Memo {
//                memo.devices = devices 
                memo.memo = text
                
                contextSave { success in
                    onSuccess(success)
                }
            }
        }
    }
    
    func deleteMemo(memo: String, onSuccess: @escaping ((Bool) -> Void)) {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = filteredRequest(memo: memo)
            
            do {
                if let results: [Memo] = try context?.fetch(fetchRequest) as? [Memo] {
                    if results.count != 0 {
                        context?.delete(results[0])
                    }
                }
            } catch let error as NSError {
                print("Could not fatch🥺: \(error), \(error.userInfo)")
                onSuccess(false)
            }
            
            contextSave { success in
                onSuccess(success)
            }
        }
    
}

extension CoreDataManager {
    
    fileprivate func filteredRequest(memo: String) -> NSFetchRequest<NSFetchRequestResult> {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest<NSFetchRequestResult>(entityName: modelName)
        fetchRequest.predicate = NSPredicate(format: "memo = %@", NSString(string: memo))
        return fetchRequest
    }
    
    
    fileprivate func contextSave(onSuccess: ((Bool) -> Void)) {
        do {
            try context?.save()
            onSuccess(true)
        } catch let error as NSError {
            print("Count not save, \(error)")
            onSuccess(false)
        }
    }
}
