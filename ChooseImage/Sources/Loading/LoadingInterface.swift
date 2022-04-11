//
//  File.swift
//  
//
//  Created by Ji-hoon Ahn on 2022/04/11.
//

import UIKit
import RIBs

public protocol LoadingModalListener: AnyObject {
    func didClearTrainingMachine(image : UIImage)
}

public protocol LoadingModalBuildable: Buildable {
    func build(withListener listener: LoadingModalListener, originerImage: UIImage, pieceImage: UIImage) -> ViewableRouting
}
