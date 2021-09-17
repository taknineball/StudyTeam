//
//  MemoListViewController.swift
//  StudyMemo
//
//  Created by Sunwoo on 2021/09/15.
//

import UIKit

class MemoListViewController: UIViewController {

    
    @IBOutlet weak var memoListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        memoListTableView.dataSource = self
        memoListTableView.delegate = self
        
        //navigationItem.title = ??
    }
    


}

extension MemoListViewController : UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "memoListCell", for: indexPath) as! MemoListTableViewCell
        
        cell.contentLabel.text = "HI"
        
        return cell
    }
}
