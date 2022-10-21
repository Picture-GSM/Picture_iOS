//
//  BaseCollectionViewCell.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/29.
//

import UIKit
import Reusable
import RxSwift

class BaseCollectionViewCell<T> : UICollectionViewCell,Reusable{
    
    var disposeBag = DisposeBag()
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        addView()
        configureUI()
        setUpLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    //MARK: - Reusable
    override func prepareForReuse() {
        super.prepareForReuse()
        disposeBag = DisposeBag()
    }
    

    
    //MARK: - Bind
    var model: T? {
        didSet {
            if let model = model {
                bind(model)
            }
        }
    }
    func bind(_ model: T) {}
    
    //MARK: - Setting Method
    func addView() {}
    func configureUI() {}
    func setUpLayout() {}
}