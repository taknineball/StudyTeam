//
//  AlignmentSettingViewCell.swift
//  StudyMemo
//
//  Created by 탁제원 on 2021/09/28.
// Alignment methods -> 다른거 성공하면 작성하자!
//
//import UIKit
//
//class AlignmentSettingViewCell: UITableViewCell {
//
//    @IBOutlet weak var alignmentImageView: UIImageView!
//    @IBOutlet weak var alignmentLabel: UILabel!
//
//    let alignmentViewController = SetAlignmentViewController()
//    let alignmentData = AlignmentCellData().alignmentCellData
//
//    func settingCell(order: Int){
//
//        self.alignmentImageView.image = UIImage(systemName: alignmentData[order].alignmentImageName)
//        self.alignmentLabel.text = alignmentData[order].alignmentName
//
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//        accessoryType = selected ? AlignmentSettingViewCell.AccessoryType.checkmark : AlignmentSettingViewCell.AccessoryType.none
//    }
//
//    func defaultCellConfiguration(order: Int) -> Int {
//        for order in 0...alignmentData.count {
//            if alignmentViewController.alignment == alignmentData[order].alignment {
//                break
//                }
//            }
//        print("000000000000000rder is = \(order)")
//        return order
//    }
//
//}

