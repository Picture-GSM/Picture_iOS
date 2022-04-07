//
//  AppHomeCollectionViewSection.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/18.
//

import RxDataSources
import UIKit

enum AppHomeCollectionViewSection{
    typealias Model = SectionModel<Int,Item>
    
    enum Item{
        case main
    }
}
extension AppHomeCollectionViewSection.Item : Equatable{}
