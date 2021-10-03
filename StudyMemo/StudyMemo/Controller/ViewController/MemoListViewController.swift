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
    let newSegueIdentifier = "newMemoSegue"
    let editSegueIdentifier = "editMemoSegue"
    let memoCellIdetifier = "memoListCell"
    
    @IBOutlet weak var memoListTableView: UITableView!
    
    var firstLoad = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        memoListTableView.dataSource = self
        memoListTableView.delegate = self
        
        //준영님의 카테고리 데이터를 배열로 전달받고.
        //후에 그 배열에서 remove 해주는 식으로 스와이프삭제를 진행
        navigationItem.title = categoryName
   
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        memoList = CoreDataManager.shared.fetchMemo()
        memoListTableView.reloadData()
    }
    
}

extension MemoListViewController : UITableViewDataSource, UITableViewDelegate {
    
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
        guard let memoCell = tableView.dequeueReusableCell(withIdentifier: self.memoCellIdetifier) as? MemoListTableViewCell else {
            return UITableViewCell()
        }
        
        
        memoCell.contentLabel.text = memoList[indexPath.row].memo
        
        return memoCell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        self.performSegue(withIdentifier: self.editSegueIdentifier, sender: self)
//    }
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if (segue.identifier == self.editSegueIdentifier){
//            let indexPath = memoListTableView.indexPathForSelectedRow!
//            let memoEdit = segue.destination as? MemoEditViewController
//
//            let nowSelectedMemo : Memo!
//            nowSelectedMemo = memoList[indexPath.row]
//            memoEdit!.selectedMemo = nowSelectedMemo
//
//            memoListTableView.deselectRow(at: indexPath, animated: true)
//        }
//    }
//
//
//
    
}


