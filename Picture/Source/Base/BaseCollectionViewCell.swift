//
//  BaseCollectionViewCell.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/18.
//

import UIKit
import Reusable
import RxSwift

class BaseCollectionViewCell : UICollectionViewCell,Reusable{
    var disposeBag = DisposeBag()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        addView()
        setUpLayout()
    }
    @available( *, unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
        addView()
        setUpLayout()
    }
    
    func configure() {}
    func addView(){}
    func setUpLayout(){}
    
    
    //MARK: - Reusable
    override func prepareForReuse() {
        super.prepareForReuse()
        disposeBag = DisposeBag()
    }
}
