//
//  AppHomeViewController.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/11.
//

import RIBs
import RxSwift
import RxCocoa

import UIKit
import Then
import PinLayout

protocol AppHomePresentableListener: AnyObject {
    // TODO: Declare properties and methods that the view controller can invoke to perform
    // business logic, such as signIn(). This protocol is implemented by the corresponding
    // interactor class.
}

final class AppHomeViewController: BaseViewController<AppHomeReactor>, AppHomePresentable, AppHomeViewControllable {

    //MARK: - Properties
    weak var listener: AppHomePresentableListener?
    
    private let  images = [UIImage(systemName: "xmark"),UIImage(systemName: "xmark"),UIImage(systemName: "xmark")]
    private let imageViews = [UIImageView]()

    private let scrollView = UIScrollView().then{
        $0.bounces = false
        $0.isScrollEnabled = true
        $0.isPagingEnabled = true
        $0.showsVerticalScrollIndicator = false
        $0.showsHorizontalScrollIndicator = false
        $0.alwaysBounceVertical = false
    }
    private let pageControl = UIPageControl().then{
        $0.currentPage = 0
        $0.pageIndicatorTintColor = .lightGray
        $0.currentPageIndicatorTintColor = .black
    }
    
    //MARK: - Main
    override func configureUI() {
        for i in 0..<images.count {
            let imageView = UIImageView()
            let xPos = self.view.frame.width * CGFloat(i)
            imageView.frame = CGRect(x: xPos, y: 0, width: scrollView.bounds.width, height: scrollView.bounds.height)
            imageView.image = images[i]
            scrollView.addSubview(imageView)
            scrollView.contentSize.width = imageView.frame.width * CGFloat(i + 1)
        }
        
        scrollView.isPagingEnabled = true
        scrollView.contentSize = CGSize(width: scrollView.bounds.width * CGFloat(images.count), height: scrollView.bounds.height)
        
        pageControl.numberOfPages = images.count
    }
    
    override func addView() {
        view.addSubviews(scrollView,pageControl)
    }
    
    override func setLayout() {
        scrollView.pin.top().right().left().height(250)
        pageControl.pin.bottom().height(30).left().right()
    }
    
    //MARK: - Bind
    override func bindView(reactor: AppHomeReactor) {
        pageControl.rx.controlEvent(.valueChanged)
            .subscribe(onNext:{ [weak self] in
                guard let currentPage = self?.pageControl.currentPage else {
                    return
                }
                self?.scrollView.setCurrentPage(currentPage, animated: true)
            }).disposed(by: disposeBag)
        scrollView.rx.currentPage
            .bind(to: pageControl.rx.currentPage)
            .disposed(by: disposeBag)
    }
}
