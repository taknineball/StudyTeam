////
////  LaunchScreenViewController.swift
////  StudyMemo
////
////  Created by 탁제원 on 2021/11/05.
////
//
//import UIKit
//
//class LaunchScreenViewController: UIViewController{
//    
////    @IBOutlet weak var memobleLabel: UILabel!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        animation()
//    }
//    
//    func animation() {
//        
//        UIView.animate(
//            withDuration: 5.0,
//            delay: 0.0,
//            usingSpringWithDamping: 0.3,
//            initialSpringVelocity: 0.5,
//            options: .curveLinear,
//            animations: {
//                self.memobleLabel.transform = CGAffineTransform(scaleX: 10, y: 10)
//            },
//            completion: { done in
//                self.memobleLabel.transform = CGAffineTransform(rotationAngle: 10)
//            })
//    }
//    
//    
//}
