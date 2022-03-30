//
//  AlbumCollectionViewCell.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/30.
//

import UIKit

class AlbumCollectionViewCell : BaseCollectionViewCell<UIImage>{
    
    let iv  = UIImageView().then{
        $0.contentMode = .scaleAspectFill
        $0.backgroundColor = .gray // 나중에 지워야함
    }
    
    //MARK: - Method
    override func configureUI() {
        contentView.backgroundColor = .blue
    }
    //MARK: - AddView
    override func addView() {
        contentView.addSubviews(iv)
    }
    //MARK: - SetupLayout
    override func setUpLayout() {
        iv.pin.all()
    }
    override func bind(_ model: UIImage) {
        iv.image = model
    }
    
}
