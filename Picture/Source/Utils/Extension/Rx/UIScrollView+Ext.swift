//
//  UIScrollView+Ext.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/15.
//

import RxSwift
import RxCocoa
import UIKit

fileprivate extension Reactive where Base: UIScrollView{
    public var currentPage : Observable<Int>{
        return didEndDecelerating.map({
            let pageWidth = self.base.frame.width
            let page = floor((self.base.contentOffset.x - pageWidth / 2) / pageWidth)
            return Int(page)
        })
    }
}
