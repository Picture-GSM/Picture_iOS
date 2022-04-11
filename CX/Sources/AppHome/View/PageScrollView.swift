//
//  PageScrollView.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/04/08.
//

import UIKit
import Then
import PinLayout
import RxSwift

class PageScrollView : UIView{
    //MARK: - Properties
    var disposeBag: DisposeBag = .init()
    
    private let images : [UIImage?]
    
    private let scrollView = UIScrollView().then{
        $0.backgroundColor = .blue
        $0.bounces = false
        $0.isScrollEnabled = true
        $0.isPagingEnabled = true
        $0.showsVerticalScrollIndicator = false
        $0.showsHorizontalScrollIndicator = false
        $0.alwaysBounceVertical = false
    }
    private let pageControl = UIPageControl().then{
        $0.currentPage = 0
        $0.pageIndicatorTintColor = .black
        $0.currentPageIndicatorTintColor = .white
    }
    
    //MARK: - Initalizer
    init(
        images : [UIImage?]
    ) {
        self.images = images
        super.init(frame: .zero)
        configureUI()
    }
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        self.images = [UIImage()]
        super.init(coder: coder)
        configureUI()
    }
    //MARK: - Layout
    override func layoutSubviews() {
        super.layoutSubviews()
        setlayout()
    }
    
    
    //MARK: - Helper
    private func configureUI(){
        addView()
        bind()
    }
    private func addView(){
        addSubviews(scrollView,pageControl)
    }
    private func setlayout(){
        scrollView.pin.top(self.pin.safeArea.top).right().left().height(frame.height)
        pageControl.pin.bottomCenter(to: scrollView.anchor.bottomCenter).height(20).width(frame.width)
        pageImageSetting()
    }
    //MARK: - Bind
    private func bind(){
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

//MARK: - Page Setting
extension PageScrollView{
    private func pageImageSetting(){
        for i in 0..<images.count {
            let imageView = UIImageView().then{
                $0.contentMode = .scaleAspectFill
                $0.clipsToBounds = true
            }
            let xPos = frame.width * CGFloat(i)
            imageView.frame = CGRect(x: xPos, y: 0, width: scrollView.bounds.width, height: scrollView.bounds.height)
            imageView.image = images[i]
            scrollView.addSubview(imageView)
            scrollView.contentSize.width = imageView.frame.width * CGFloat(i + 1)
        }
        
        scrollView.contentSize = CGSize(width: scrollView.bounds.width * CGFloat(images.count), height: scrollView.bounds.height)
        pageControl.numberOfPages = images.count
    }
}
