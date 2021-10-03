//
//  MemoEditViewController.swift
//  StudyMemo
//
//  Created by 탁제원 on 2021/09/07.
//

import UIKit
import CoreData

class MemoEditViewController: UIViewController {
    
//    넣고 싶은 기능
//
//    1) 글씨체
//
//    1-1) 첫 두 줄은 제목 형식 (폰트 크기, 굵기 등 다름)
//
//    1-2) 글씨체 변경 (사용자가 원하는 글씨체로..?)
//
//    2) 정렬 상태 변경 (왼쪽, 중앙, 오른쪽) -> 바 버튼으로 pop up 보류
//
//    3) 사진 넣기 (이것은 좀 더 고민해보기)
//
//    4) memo save with CoreData =>  ** 성공?! maybe.. **
//
//    5) 힌트 제공 => ** 이것도 성공?! **

    //메인 text view (for multiLine content)
    @IBOutlet weak var memoEditTextView: UITextView!
    @IBOutlet weak var textEditToolBar: UIToolbar!
    @IBOutlet weak var alingmentSettingBarItem: UIBarItem!
    
    //navigation bar item으로 바꿔야함
    @IBOutlet weak var memoSaveButton: UIBarItem!
    
    let segueIdentifier = "toSettingAlignment"
//    let alignmentData = AlignmentCellData()
    let savedMemo = CoreDataManager()
    var settingTextAlignment = NSTextAlignment.left
    let memos = [Memo]()
    
    //앞의 view 의 선택된 셀의 메모
    var selectedMemo : Memo? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //view basic settings
        settings()
        
        memoEditTextView.delegate = self
//        textViewDidBeginEditing(self.memoEditTextView)
        
        //set place holder
        setPlaceHolder()
        
        
        //추가 뷰 == 수정 뷰! 클릭에 따라 달라지게..
//        if text != nil {
            // 추가 뷰로 가기
//        }else {
            // 수정 뷰로 가기
//        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        memoEditTextView.textAlignment = settingTextAlignment
    }
    
    //view basic settings
    private func settings() {
        memoEditTextView.allowsEditingTextAttributes = true
    }
    
    //저장 버튼 누르면 작동함, navigation bar item
    @IBAction func pushMemoSavedButton() {
        if let memoContent = memoEditTextView.text {
            let memo = Memo(context: CoreDataManager.shared.context)
            memo.memo = memoContent
            
            CoreDataManager.shared.saveContext()
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func pushAlignmentItem() {
        performSegue(withIdentifier: self.segueIdentifier, sender: memoEditTextView.textAlignment)
    }
}

//delegate extension
extension MemoEditViewController: UITextViewDelegate{
    
    //엔터 키에 따라 글씨 크기 달라지게 함 - 보류
    
//MARK :- placeholder
    // 처음에 힌트 제공
    private func setPlaceHolder(){
        memoEditTextView.text = "메모를 작성해주세요"
        memoEditTextView.textColor = .lightGray
    }
    
    // 텍스트 작성 시작 시, 사라짐 & 사라진 후에 작성된 text 넘겨지는 것 확인 완료
    func textViewDidBeginEditing(_ textView: UITextView) {
        memoEditTextView.text = ""
        memoEditTextView.textColor = .black // 또는 사용자 원하는 색상으로..!
    }
    
    // 텍스트가 다 사라지면 다시 힌트 생성 -> 다른 행동과 이어지는지 확인!
    func textViewDidEndEditing(_ textView: UITextView) {
            memoEditTextView.text = "메모를 작성해주세요"
            memoEditTextView.textColor = .lightGray
    }

}


