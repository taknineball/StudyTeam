//
//  SetAlignmentViewController.swift
//  StudyMemo
//
//  Created by 탁제원 on 2021/09/28.
// Alignment view controller -> 나중에

//import UIKit
//
//class SetAlignmentViewController: UIViewController {
//
//    @IBOutlet weak var alignmentTableView: UITableView!
//
//    let cellIdentifier = "alignmentCell"
//    let segueIdentifier: String = "toMemoEditView"
//    let cellInformation = AlignmentCellData()
//
//    var alignment: NSTextAlignment!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
////        self.alignmentTableView.delegate = self
//        self.alignmentTableView.dataSource = self
//
//    }
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let nextViewController = segue.destination as! MemoEditViewController
//        let index = sender as! Int
//        nextViewController.settingTextAlignment = cellInformation.alignmentCellData[index].alignment
//    }
//}
//
//
//extension SetAlignmentViewController: UITableViewDelegate {
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 100.0
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        performSegue(withIdentifier: self.cellIdentifier, sender: indexPath.row)
//    }
//
//}
//
//extension SetAlignmentViewController: UITableViewDataSource {
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return cellInformation.alignmentCellData.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as? AlignmentSettingViewCell else { return UITableViewCell() }
//
//        cell.settingCell(order: indexPath.row)
//        cell.setSelected(true, animated: true)
//
//        return cell
//    }
//
//
//}
