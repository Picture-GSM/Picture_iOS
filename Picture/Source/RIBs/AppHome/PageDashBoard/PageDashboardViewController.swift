//
//  PageDashboardViewController.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/30.
//

import RIBs
import RxSwift
import UIKit
import Then

protocol PageDashboardPresentableListener: AnyObject {

}

final class PageDashboardViewController: BaseViewController, PageDashboardPresentable, PageDashboardViewControllable {

    weak var listener: PageDashboardPresentableListener?
    
    private let  images = [UIImage(named: "PageImage1"),UIImage(named: "PageImage2"),UIImage(named: "PageImage3"),UIImage(named: "PageImage4")]
    
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
        pageImageSetting()
    }
    override func addView() {
        view.addSubviews(scrollView, pageControl)
    }
    override func setLayout() {
        scrollView.pin.top(self.view.pin.safeArea.top).right().left().height(bounds.height/2)
        pageControl.pin.below(of: scrollView).height(20).left().right()
    }
    
    private func pageImageSetting(){
        for i in 0..<images.count {
            let imageView = UIImageView().then{
                $0.contentMode = .scaleAspectFill
                $0.clipsToBounds = true
            }
            let xPos = self.view.frame.width * CGFloat(i)
            imageView.frame = CGRect(x: xPos, y: 0, width: scrollView.bounds.width, height: scrollView.bounds.height)
            imageView.image = images[i]
            scrollView.addSubview(imageView)
            scrollView.contentSize.width = imageView.frame.width * CGFloat(i + 1)
        }
        
        scrollView.contentSize = CGSize(width: scrollView.bounds.width * CGFloat(images.count), height: scrollView.bounds.height)
        pageControl.numberOfPages = images.count
    }
    
    //MARK: - Bind
    override func bindView() {
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
