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
    let segueIdentifier: String = "toMemoEditView"
    let cellInformation = AlignmentData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.alignmentTableView.delegate = self
        self.alignmentTableView.dataSource = self
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == self.segueIdentifier {
//            let nextViewController = segue.destination as? MemoEditViewController
//            if let alignmentIndex = sender as? Int {
//                nextViewController?.textAlignment = self.cellInformation.alignment[alignmentIndex]
//            }
//        }
//    }
}


extension SetAlignmentViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: self.cellIdentifier, sender: indexPath.row)
    }

}

extension SetAlignmentViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellInformation.alignmentName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as? AlignmentSettingViewCell else { return UITableViewCell() }
        
        cell.settingCell(order: indexPath.row)
        cell.setSelected(true, animated: true)
        
        return cell
    }
    
    
}
