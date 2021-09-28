//
//  AlignmentSettingViewCell.swift
//  StudyMemo
//
//  Created by 탁제원 on 2021/09/28.
//

import UIKit

class AlignmentSettingViewCell: UITableViewCell {
    
    @IBOutlet weak var alignmentImageView: UIImageView!
    @IBOutlet weak var alignmentLabel: UILabel!
    
    let alignmentViewController = SetAlignmentViewController()
    let alignmentData = AlignmentData()
    
    func settingCell(order: Int){
        
        self.alignmentImageView.image = UIImage(systemName: alignmentData.alignmentImage[order])
        self.alignmentLabel.text = alignmentData.alignmentName[order]
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        accessoryType = selected ? AlignmentSettingViewCell.AccessoryType.checkmark : AlignmentSettingViewCell.AccessoryType.none
    }
}
