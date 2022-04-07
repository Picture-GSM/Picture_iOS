//
//  BaseCollectionViewCell.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/29.
//

import UIKit
import Reusable
import RxSwift

class BaseCollectionViewCell : UICollectionViewCell,Reusable{
    
    var disposeBag = DisposeBag()
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        addView()
        configureUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addView()
        configureUI()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setUpLayout()
    }
    //MARK: - Reusable
    override func prepareForReuse() {
        super.prepareForReuse()
        disposeBag = DisposeBag()
    }
    

    
    //MARK: - Setting Method
    func addView() {}
    func configureUI() {}
    func setUpLayout() {}
}
