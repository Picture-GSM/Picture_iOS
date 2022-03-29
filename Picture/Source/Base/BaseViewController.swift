//
//  BaseViewController.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/29.
//

import UIKit
import RxSwift

class BaseViewController : UIViewController {
    let bounds = UIScreen.main.bounds
    var disposeBag: DisposeBag = .init()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackgroundIfNotSet()
    }
    
    init(){
        super.init(nibName: nil, bundle: nil)
        //MARK: - setting
        addView()
        setLayout()
        configureUI()
        keyBoardLayout()
        
        //MARK: - data Bind
        bindView()
        bindAction()
        bindState()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupBackgroundIfNotSet(){
        if self.view.backgroundColor == nil{
            self.view.backgroundColor = .white
        }
    }
    
    //MARK: - Override Point
    func addView(){}
    func setLayout(){}
    func configureUI(){}
    func keyBoardLayout(){}

    
    //MARK: - Bind
    func bindView(){}
    func bindAction(){}
    func bindState(){}
}
