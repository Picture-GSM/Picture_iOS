//
//  AppRootViewController.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/10.
//

import RIBs
import RxSwift
import UIKit
import PinLayout
import Then

protocol AppRootPresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class AppRootViewController: BaseViewController, AppRootPresentable, AppRootViewControllable {

    weak var listener: AppRootPresentableListener?
    
    private let scrollView = UIScrollView().then{
        $0.bounces = false
        $0.isScrollEnabled = true
        $0.isPagingEnabled = true
        $0.showsVerticalScrollIndicator = false
        $0.showsHorizontalScrollIndicator = false
        $0.alwaysBounceVertical = false
        $0.backgroundColor = .red
    }
    private let pageControl = UIPageControl().then{
        $0.currentPage = 0
        $0.pageIndicatorTintColor = .lightGray
        $0.currentPageIndicatorTintColor = .black
    }
    
    //MARK: - ConfigureUI
    override func configureUI() {
        
    }
    //MARK: - AddView
    override func addView() {
        view.addSubviews(scrollView)
        scrollView.addSubviews(pageControl)
    }
    //MARK: - layout
    override func setLayout() {
        scrollView.pin.top().right().left().height(bounds.height/3)
//        pageControl.pin.
    }

    
}
