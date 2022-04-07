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

class photoRealmData : Object{
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var image = UIImage()
    @objc dynamic var date = DateFormatter().defaultDate!
}
