//
//  DeleteCategoryViewController.swift
//  StudyMemo
//
//  Created by 박준영 on 2021/09/20.
//

import UIKit

class DeleteCategoryViewController: UIViewController{
    
    
    

    @IBOutlet weak var tableView : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(DeleteTableViewCell.self, forCellReuseIdentifier: DeleteTableViewCell.reuseIdentifier)
        editTable()
    }
    func editTable() {
        self.tableView.setEditing(true, animated: true)
    }
    
}

extension DeleteCategoryViewController : UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DeleteTableViewCell.reuseIdentifier , for: indexPath) as! DeleteTableViewCell
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {}
    }
    
    
}
