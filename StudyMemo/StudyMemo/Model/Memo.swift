//
//  Memo.swift
//  StudyMemo
//
//  Created by 탁제원 on 2021/09/23.
//

import CoreData

@objc(Memo)
class Memo: NSManagedObject {
    // memo 내용을 저장하는 enitity
    @NSManaged var memo: String!
    
    // memo의 카테고리 저장하는 entitiy
    @NSManaged var category: String!
    
    // memo의 삭제날짜를 저장하는 entitiy (필요할까? 일단 집어 넣음) -> 생성날짜?
    @NSManaged var writtenDate: Date?
    
    //참고 영상 : https://www.youtube.com/watch?v=35mKM4IkHS8
}
