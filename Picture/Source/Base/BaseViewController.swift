//
//  BaseViewController.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/11.
//

import UIKit
import RxSwift
import ReactorKit

class BaseViewController<T : Reactor> : UIViewController{
    let bounds = UIScreen.main.bounds
    var disposeBag : DisposeBag = .init()
    //MARK: - Initalizer
    init(reactor: T){
        super.init(nibName: nil, bundle: nil)
        self.reactor = reactor
        setupBackgroundIfNotSet()
        addView()
        setLayout()
        configureUI()
    }
    @available(* , unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupBackgroundIfNotSet()
        addView()
        setLayout()
        configureUI()
    }
    
    //MARK: - Method
    private func setupBackgroundIfNotSet(){
        if self.view.backgroundColor == nil{
            self.view.backgroundColor = .white
        }
    }
    
    func addView(){}
    func setLayout(){}
    func configureUI(){}
    //MARK: - Bind
    func bindView(reactor: T){}
    func bindAction(reactor: T){}
    func bindState(reactor: T){}
}
extension BaseViewController: View{
    func bind(reactor: T) {
        bindView(reactor: reactor)
        bindAction(reactor: reactor)
        bindState(reactor: reactor)
    }
}
