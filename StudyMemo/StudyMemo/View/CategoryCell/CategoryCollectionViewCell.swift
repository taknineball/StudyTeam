//
//  CategoryCollectionViewCell.swift
//  StudyMemo
//
//  Created by 박준영 on 2021/09/19.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    let data = CategoryData()
    
    static let reuseIdentifier = "CategoryCell"
    
    var titleLabel : UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "오늘"
        titleLabel.textColor = .black
//        titleLabel.backgroundColor = .systemBlue
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.systemFont(ofSize: 30.0)
        return titleLabel
        
    }()
    var numberLabel : UILabel = {
        let numberLabel = UILabel()
        numberLabel.text = "3"
        numberLabel.textColor = .systemBlue
//        numberLabel.backgroundColor = .systemBlue
        numberLabel.translatesAutoresizingMaskIntoConstraints = false
        numberLabel.font = UIFont.systemFont(ofSize: 30.0) //무슨 폰트 크기 바꾸는게 이렇게 어려워 ㅠ
        
        return numberLabel
        
    }()
    
    var cellImage: UIImageView = {
        let cellImage = UIImageView()
        cellImage.backgroundColor = .systemBlue
        return cellImage
    }()
    
    func settingCell(order : Int){
        titleLabel.text = data.categoryName[order]
        numberLabel.text = "\(data.contentsNumber[order])"
        cellImage.image = UIImage(named: "bigBubble")
    }
//    var numberLabel = UILabel(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 10, height: 10)))
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        contentView.layer.cornerRadius = 14
        contentView.sizeToFit()
        
        self.backgroundColor = UIColor(red: 244, green: 242, blue: 247, alpha: 0.0)
        self.contentView.backgroundColor = .white
        
        self.addSubview(cellImage)
        self.addSubview(titleLabel)
        self.addSubview(numberLabel)
        
        NSLayoutConstraint.activate([
            numberLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            numberLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 30),
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: self.numberLabel.bottomAnchor, constant: 20)
        ])
        
    
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override var isSelected: Bool {
        didSet {
            if isSelected {
                self.contentView.backgroundColor = .systemGray
            }else {
                self.contentView.backgroundColor = .white
            }
        }
    }
    
    override func layoutSubviews() {
        //cell rounded : cell 크기를 가로세로 같게(컨트롤러에 있음) 한 다음에 라운드 정의
        self.layer.cornerRadius = 70
//        self.layer.borderWidth = 5.0
//        self.layer.borderColor = UIColor.red
        self.layer.masksToBounds = true
        
    }
    
    
}
