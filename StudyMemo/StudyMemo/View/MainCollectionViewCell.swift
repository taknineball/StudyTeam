//
//  CategoryCollectionViewCell.swift
//  Memo
//
//  Created by 박준영 on 2021/09/08.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell{

    static let reuseIdentifier = "MainCell"
    
    let data = CategoryData()
    
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var reminderLabel: UILabel!
    
    func settingCell(order : Int){
        reminderLabel.text = data.categoryName[order]
        numberLabel.text = "\(data.contentsNumber[order])"
    }
    
    
}

