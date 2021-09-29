//
//  MemoListViewController.swift
//  StudyMemo
//
//  Created by Sunwoo on 2021/09/15.
//

import UIKit
import CoreData


class MemoListViewController: UIViewController {

    var categoryName : String = ""
    
    var memoList = [Memo]()
    
    @IBOutlet weak var memoListTableView: UITableView!
    
    var firstLoad = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        memoListTableView.dataSource = self
        memoListTableView.delegate = self
        
        if(firstLoad){
            firstLoad = false
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Memo")
            do {
                let results:NSArray = try context.fetch(request) as NSArray
                for result in results {
                    let memo = result as! Memo
                    memoList.append(memo)
                }
            } catch {
                print("Fetch Failed")
            }
        }
        
        //준영님의 카테고리 데이터를 배열로 전달받고.
        //후에 그 배열에서 remove 해주는 식으로 스와이프삭제를 진행
        navigationItem.title = categoryName
   
    }

//
//    override func viewDidAppear(_ animated: Bool) {
//        print("1111111111111111111111111111111111")
//        if(firstLoad){
//            firstLoad = false
//            let appDelegate = UIApplication.shared.delegate as! AppDelegate
//            let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
//            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Memo")
//            do {
//                let results:NSArray = try context.fetch(request) as NSArray
//                for result in results {
//                    let memo = result as! Memo
//                    memoList.append(memo)
//                }
//            } catch {
//                print("Fetch Failed")
//            }
//        }
//        self.memoListTableView.reloadData()
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("helloafldjqoiwejfqjd;fqwef")
        print(CoreDataManager().mainContext)
        self.memoListTableView.reloadData()
        
    }
    
    
    
}

extension MemoListViewController : UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memoList.count
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
          if editingStyle == .delete {
              memoList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
          } else if editingStyle == .insert {
                
          }
      }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let memoCell = tableView.dequeueReusableCell(withIdentifier: "memoListCell") as! MemoListTableViewCell
        
        let thisMemo: Memo!
        thisMemo = memoList[indexPath.row]
        
        memoCell.contentLabel.text = thisMemo.memo
        
        return memoCell
    }
    
    
    
    
    
}
