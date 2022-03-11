//
//  ViewExt.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/12.
//

import UIKit

extension UIView{
    func addSubviews(_ subviews : UIView...){
        subviews.forEach(self.addSubview)
    }
}
