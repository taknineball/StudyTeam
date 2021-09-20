//
//  AddCategoryViewController.swift
//  Memo
//
//  Created by 박준영 on 2021/09/15.
//

import UIKit

class AddCategoryViewController: UIViewController, UITextFieldDelegate {


    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var confirmButton: UIButton!
    
    
    var inputOrNot : Bool = false
    
    //UIViewController에 있는 메소드, 뷰컨트롤러에 터치 시 발생하는 메소드
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.textField.resignFirstResponder()
    }
    //
    override func viewWillAppear(_ animated: Bool) {
        textField.becomeFirstResponder()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        
        confirmButton.isEnabled = false
        
        textField.addTarget(self, action: #selector(didTextFieldChanged), for: .editingChanged)
        // Do any additional setup after loading the view.
    }
    @objc func didTextFieldChanged(_ sender :Any){
        willCheckInputText()
        confirmButtonSetting()
    }
    func willCheckInputText()  {
        if self.textField.text == "" {
            inputOrNot = false
        }else {
            inputOrNot = true
            
        }
    }
    func confirmButtonSetting() {
        if inputOrNot == true {
            self.confirmButton.isEnabled = true
        }else{
            self.confirmButton.isEnabled = false
        }
    }
    
    @IBAction func detailOfcacnelButton(){
        if(self.inputOrNot == true) {
            didTapCancelButton()            
        }else{
            dismissModal()
        }
    }
    //취소 버튼 > 알람띄우기
    func didTapCancelButton(){
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let alert1 = UIAlertAction(title: "변경사항폐기", style: .destructive, handler: { action in
            self.dismissModal()
        })
        let alert2 = UIAlertAction(title: "취소", style: .default,handler: { action in
            print("hi2")
        })
        alert.addAction(alert1)
        alert.addAction(alert2)
        present(alert, animated: true, completion: nil)
        
        
    }
    //모달 창 내리기
    func dismissModal() {
            self.dismiss(animated: true, completion: nil)
    }
    
    
}
