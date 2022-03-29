//
//  BaseCollectionViewCell.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/29.
//

import UIKit
import Reusable
import RxSwift

class BaseTableViewCell : UITableViewCell,Reusable{
    
    var disposeBag = DisposeBag()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        selectionStyle = .none
    }
    
    //MARK: - Reusable
    override func prepareForReuse() {
        super.prepareForReuse()
        disposeBag = DisposeBag()
    }
    
}
