//
//  MemoListViewController.swift
//  StudyMemo
//
//  Created by Sunwoo on 2021/09/15.
//

import UIKit

class MemoListViewController: UIViewController {

    var categoryName : String = ""
    
    @IBOutlet weak var memoListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        memoListTableView.dataSource = self
        memoListTableView.delegate = self
        //준영님의 카테고리 데이터를 배열로 전달받고.
        //후에 그 배열에서 remove 해주는 식으로 스와이프삭제를 진행
        navigationItem.title = categoryName
        //받아온 배열로부터 아래의 타이틀을 생성
        //navigationItem.title = "title"
    }
    
}


//임의로 테스트를 하기 위해 만든 배열 추후에 category 리스트를 받아올거임.
var dataArray = ["1","2","3","4","5","6"]


extension MemoListViewController : UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
          if editingStyle == .delete {
              dataArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
          } else if editingStyle == .insert {
                
          }
      }
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "memoListCell", for: indexPath) as! MemoListTableViewCell
        
        cell.contentLabel.text = dataArray[indexPath.row]
        
        return cell
    }
    
    
    
    
    
}
