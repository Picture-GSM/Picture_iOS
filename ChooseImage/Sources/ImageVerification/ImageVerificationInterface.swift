//
//  File.swift
//  
//
//  Created by Ji-hoon Ahn on 2022/04/11.
//

import Foundation
import RIBs
import UIKit

public protocol ImageVerificationBuildable: Buildable {
    func build(withListener listener: ImageVerificationListener, withImage image : UIImage, withState imageStateAlready : Bool) -> ViewableRouting
}

public protocol ImageVerificationListener: AnyObject {
    func didTapImageVerificationClose()
    func didTapImageVerificationSaveSuccess()
}
