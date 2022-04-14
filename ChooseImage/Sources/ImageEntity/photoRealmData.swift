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

public class Photo : Object{
    @Persisted(primaryKey: true) public var id : ObjectId //Primary Key
    @Persisted public var date = Date()// 등록일
    
    convenience init(date : Date){
        self.init()
        self.date = date
    }
}
