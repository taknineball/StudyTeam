//
//  ViewController.swift
//  Memo
//
//  Created by 박준영 on 2021/09/08.
//

import UIKit
import CoreData

class MainViewController: UIViewController {
    

    
    static let reuseIdentifier = "CategoryCell"
    @IBOutlet weak var collectionView : UICollectionView!
    @IBOutlet weak var addButton : UIButton!
    @IBOutlet weak var deleteButton : UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        delegate()
        addtapGesture()
        collectionView.allowsSelection
        
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
        let vc = AddCategoryViewController()
        present(vc, animated: true, completion: nil)
    }
    

}

extension MainViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainViewController.reuseIdentifier, for: indexPath) as! MainCollectionViewCell
//        cell.settings()
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 2
    }

}


extension MainViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var cellSize : CGSize
        let screenWidth = UIScreen.main.bounds.width
        if UIDevice.current.orientation.isLandscape == true {
            cellSize = CGSize(width: screenWidth/2, height: 200)
        }else {
            cellSize = CGSize(width: screenWidth/2, height: 200)
        }
        
        
        return cellSize
    }
    
}

