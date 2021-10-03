//
//  CoreDataManager.swift
//  StudyMemo
//
//  Created by 탁제원 on 2021/09/15.
//

import UIKit
import CoreData

class CoreDataManager {
    
    static let shared: CoreDataManager = CoreDataManager()
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "Memo")
        container.loadPersistentStores(completionHandler: { (storeDesciption, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    lazy var context = persistentContainer.viewContext
    
    //데이터 저장
    // text 매개변수 : memo 내용, 저장됨
    // category, deleted date 추가하면 좋을 듯!
    func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unsolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    

    
    func fetchMemo() -> [Memo] {
        
        var memoList = [Memo]()
       
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: Memo.description())

        do{
            memoList = try context.fetch(fetchRequest) as! [Memo]
        }catch {
            print("fetch error")
        }
        
        return memoList
    }
    

    //데이터 삭제하기 바꿔야해요!!!
    func deleteMemo(_ memo: Memo?) {
        if let memo = memo {
            context.delete(memo)
//            saveContext(text: memo)
        }
    }

}
