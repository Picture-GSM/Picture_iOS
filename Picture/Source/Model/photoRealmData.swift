//
//  photoRealmData.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/18.
//

import RxRealm
import RealmSwift
import Foundation
import UIKit

class Photo : Object{
    @Persisted(primaryKey: true) var id : ObjectId //Primary Key
    @Persisted var date = Date()// 등록일
    
    convenience init(date : Date){
        self.init()
        self.date = date
    }
}
