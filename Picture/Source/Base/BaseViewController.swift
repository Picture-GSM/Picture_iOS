//
//  BaseViewController.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/11.
//

import UIKit
import RxSwift

class BaseViewController : UIViewController{
    let bounds = UIScreen.main.bounds
    let disposeBag : DisposeBag = .init()
    //MARK: - Initalizer
    init(){
        super.init(nibName: nil, bundle: nil)
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
}
