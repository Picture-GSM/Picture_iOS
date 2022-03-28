//
//  BaseViewController.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/11.
//

import UIKit
import RxSwift
import ReactorKit

class BaseViewController : UIViewController{
    let bounds = UIScreen.main.bounds
    var disposeBag : DisposeBag = .init()
    //MARK: - Initalizer
    init(){
        super.init(nibName: nil, bundle: nil)
        setupBackgroundIfNotSet()
        addView()
        setLayout()
        configureUI()
        delegate()
        
        bindView()
        bindAction()
        bindState()
    }
    @available(* , unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupBackgroundIfNotSet()
        addView()
        setLayout()
        configureUI()
        delegate()
        
        bindView()
        bindAction()
        bindState()
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
    func delegate(){}
    
    //MARK: - Bind
    func bindView(){}
    func bindAction(){}
    func bindState(){}
}

