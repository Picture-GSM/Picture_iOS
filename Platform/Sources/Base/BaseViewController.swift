//
//  File.swift
//  
//
//  Created by Ji-hoon Ahn on 2022/04/11.
//

import UIKit
import RxSwift

open class BaseViewController : UIViewController {
    public let bounds = UIScreen.main.bounds
    open var disposeBag: DisposeBag = .init()
    
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupBackgroundIfNotSet()
    }
    
    public init(){
        super.init(nibName: nil, bundle: nil)
        //MARK: - setting
        addView()
        setLayout()
        configureUI()
        keyBoardLayout()
        delegate()
        
        //MARK: - data Bind
        bindView()
        bindAction()
        bindState()
    }
    
    @available(*, unavailable)
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        //MARK: - setting
        addView()
        configureUI()
        keyBoardLayout()
        delegate()
        
        //MARK: - data Bind
        bindView()
        bindAction()
        bindState()
    }
    //MARK: - Layout
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setLayout()
    }
    
    
    private func setupBackgroundIfNotSet(){
        if self.view.backgroundColor == nil{
            self.view.backgroundColor = .white
        }
    }
    

    //MARK: - Override Point
    open func addView(){}
    open func setLayout(){}
    open func configureUI(){}
    open func keyBoardLayout(){}
    open func delegate() {}

    
    //MARK: - Bind
    open func bindView(){}
    open func bindAction(){}
    open func bindState(){}
}
