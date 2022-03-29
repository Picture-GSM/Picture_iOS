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
    
    func addView() {}
    func configureUI() {}
    func setUpLayout() {}
}
