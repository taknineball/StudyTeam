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
    var firstLoad = true
    let memoData = CoreDataManager()
    
    let newSegueIdentifier = "newMemoSegue"
    let editSegueIdentifier = "editMemoSegue"
    let memoCellIdetifier = "memoListCell"
    
    @IBOutlet weak var memoListTableView: UITableView!
    
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
            if editingStyle == UITableViewCell.EditingStyle.delete {
                let context = CoreDataManager.shared.context //관리 시작
                do {
                    try context.delete(memoList[indexPath.row]) // context가 관리자같은데..? 메소드로 delete메소드가 존재하는데?
                    CoreDataManager.shared.saveContext()
                    memoList.remove(at: indexPath.row) //띠용?? 위에도 delete가 있는데..? 뭐지..
                    tableView.deleteRows(at: [indexPath], with: .automatic) //와 테이블뷰에 열을 삭제하는게 존재하네
                } catch {
                    print("error")
                }
            }
        }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let memoCell = tableView.dequeueReusableCell(withIdentifier: self.memoCellIdetifier) as? MemoListTableViewCell else {
            return UITableViewCell()
        }
        
        memoCell.contentLabel.text = memoList[indexPath.row].memo
        
        return memoCell
    }
    
    //메모를 수정할때 segue
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: editSegueIdentifier, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == editSegueIdentifier){
            let indexPath = memoListTableView.indexPathForSelectedRow!
            
            let memoDetail = segue.destination as? MemoEditViewController
            print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
            let selectedMemo : Memo!
            selectedMemo = memoList[indexPath.row]
            memoDetail!.selectedMemo = selectedMemo
            
            memoListTableView.deselectRow(at: indexPath, animated: true)
            
        }
    }
    
    
    
}


