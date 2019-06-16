//
//  oinoriTemplete.swift
//  oinori
//
//  Created by yodaaa on 2019/06/17.
//  Copyright © 2019 yodaaa. All rights reserved.
//

import Foundation
import RealmSwift

class OinoriTemplete: Object {
    dynamic var id: Int = 0
    dynamic var title: String = ""
    dynamic var message: String = ""
    
    // 新しいIDを採番します。
    private func createNewId() -> Int {
        let realm = try! Realm()
        return (realm.objects(type(of: self).self).sorted(byKeyPath: "id", ascending: false).first?.id ?? 0) + 1
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
