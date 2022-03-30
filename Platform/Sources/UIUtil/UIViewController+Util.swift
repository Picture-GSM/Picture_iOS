//
//  File.swift
//  
//
//  Created by Ji-hoon Ahn on 2022/03/29.
//

import UIKit
import RIBsUtil

public extension UIViewController{
    func setupNavigationItem(with buttonType : DismissButtonType,target : Any?, action : Selector?){
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: buttonType.iconSystemName,
                           withConfiguration: UIImage.SymbolConfiguration(pointSize: 18, weight: .semibold)),
            style: .plain,
            target: target,
            action: action
        )
    }
}
