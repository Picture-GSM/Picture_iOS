//
//  File.swift
//  
//
//  Created by Ji-hoon Ahn on 2022/04/11.
//

import UIKit
import Reusable
import RxSwift

open class BaseCollectionViewCell : UICollectionViewCell,Reusable{
    
    open var disposeBag = DisposeBag()
    
    
    public override init(frame: CGRect) {
        super.init(frame: .zero)
        addView()
        configureUI()
    }
    
    @available(*, unavailable)
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        addView()
        configureUI()
    }

    open override func layoutSubviews() {
        super.layoutSubviews()
        setUpLayout()
    }
    //MARK: - Reusable
    open override func prepareForReuse() {
        super.prepareForReuse()
        disposeBag = DisposeBag()
    }
    

    
    //MARK: - Setting Method
    open func addView() {}
    open func configureUI() {}
    open func setUpLayout() {}
}

