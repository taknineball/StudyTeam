//
//  ViewController.swift
//  Memo
//
//  Created by 박준영 on 2021/09/08.

import UIKit
import CoreData

class MainCategoryViewController: UIViewController {
    
    let data = CategoryData()
    let categoryTemp : String = ""
    
    @IBOutlet weak var collectionView : UICollectionView!
    @IBOutlet weak var addButton : UIButton!
    @IBOutlet weak var deleteButton : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: "CategoryCell")
        delegate()
        addtapGesture()
    }
    
    private func delegate(){
        collectionView.dataSource = self
        collectionView.delegate = self
    }
  
    private func addtapGesture(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapAddButton))
        self.addButton.addGestureRecognizer(tap)
    }
    
    @objc func didTapAddButton(){
        let vc = self.storyboard?.instantiateViewController(identifier: "newCategory") as! AddCategoryViewController
        self.present(vc, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ListCell" {
            let nextViewController = segue.destination as! MemoListViewController
            let index = sender as! Int
            nextViewController.categoryName = data.categoryName[index]
        }
    }
}

extension MainCategoryViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.reuseIdentifier, for: indexPath) as! CategoryCollectionViewCell
        cell.settingCell(order: indexPath.item)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return data.categoryName.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "List", sender: indexPath.item )
        
        
        
    }
}

extension MainCategoryViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var cellSize : CGSize
        let screenWidth = UIScreen.main.bounds.width
//        가로 else 세로
        //width : screenWidth/2 - insets.left 값의 1.5배
        if UIDevice.current.orientation.isLandscape == true {
            cellSize = CGSize(width: screenWidth/2, height: screenWidth/2)
        }else{
            cellSize = CGSize(width: screenWidth/2 - 30, height: screenWidth/2 - 30)
        }
        
        return cellSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        var insets = UIEdgeInsets()
        insets.top = 18
        insets.left = 20
        insets.right = 20
        return insets
    }
    
    //row 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 18
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 3
//    }
//
    
}

