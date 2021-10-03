//
//  DeleteCellTableViewCell.swift
//  StudyMemo
//
//  Created by 박준영 on 2021/09/20.
//

import UIKit

class DeleteTableViewCell: UITableViewCell {
    
    static var reuseIdentifier = "DeleteCell"

    var titleLabel : UILabel = {
        let titleLabel = UILabel()
        titleLabel.backgroundColor = .systemBlue
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "temp"
        
        return titleLabel
    }()
    
    var doneButton : UITabBarItem = {
        let doneButton = UITabBarItem()
        return doneButton
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(titleLabel)
        
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            titleLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
                        
        ])
        
        
    }
    //삭제 이벤트
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
