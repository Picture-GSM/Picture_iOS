//
//  ScrollView + Ext.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/15.
//

import UIKit

 extension UIScrollView{
     func setCurrentPage(_ page : Int, animated: Bool){
         var rect = bounds
         rect.origin.x = rect.width * CGFloat(page)
         rect.origin.y = 0
         scrollRectToVisible(rect, animated: animated)
     }
}
