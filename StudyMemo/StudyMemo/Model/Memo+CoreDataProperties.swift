//
//  Memo+CoreDataProperties.swift
//  StudyMemo
//
//  Created by 탁제원 on 2021/09/15.
//
//

import Foundation
import CoreData


extension Memo {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Memo> {
        return NSFetchRequest<Memo>(entityName: "Memo")
    }

    @NSManaged public var devices: [String]?
    @NSManaged public var memo: String?

}

extension Memo : Identifiable {

}
