//
//  omedetoTemplete.swift
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
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
