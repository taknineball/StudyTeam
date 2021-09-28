//
//  SetAlignmentViewController.swift
//  StudyMemo
//
//  Created by 탁제원 on 2021/09/28.
//

import UIKit

class SetAlignmentViewController: UIViewController {
    
    @IBOutlet weak var alignmentTableView: UITableView!
    
    let cellIdentifier = "alignmentCell"
    let cellInformation = AlignmentData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.alignmentTableView.delegate = self
        self.alignmentTableView.dataSource = self
        
    }
}


extension SetAlignmentViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }

}

extension SetAlignmentViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellInformation.alignmentName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as? AlignmentSettingViewCell else { return UITableViewCell() }
        
        cell.settingCell(order: indexPath.row)
        
        return cell
    }
    
    
}
