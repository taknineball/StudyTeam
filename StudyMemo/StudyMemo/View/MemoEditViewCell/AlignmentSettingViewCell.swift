//
//  AlignmentSettingViewCell.swift
//  StudyMemo
//
//  Created by 탁제원 on 2021/09/28.
//

import UIKit

class AlignmentSettingViewCell: UITableViewCell {
    
    @IBOutlet weak var alignmentImageView: UIImageView!
    @IBOutlet weak var alignmentTextField: UITextField!
    
    let alignmentData = AlignmentData()
    
    func settingCell(order: Int){
        print(alignmentData.alignmentImage[order])
        
        self.alignmentImageView.image = UIImage(named: alignmentData.alignmentImage[order])
        self.alignmentTextField.text = alignmentData.alignmentName[order]
        
    }
    
}
