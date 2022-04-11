//
//  File.swift
//  
//
//  Created by Ji-hoon Ahn on 2022/04/11.
//

import Foundation
import RIBs

public protocol ChooseImageListener: AnyObject {
    func transportHomeDidClose()
}

public protocol ChooseImageBuildable: Buildable {
    func build(withListener listener: ChooseImageListener) -> ViewableRouting
}
