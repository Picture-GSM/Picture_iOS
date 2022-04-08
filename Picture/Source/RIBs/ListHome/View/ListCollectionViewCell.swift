//
//  ListCollectionViewCell.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/18.
//

import UIKit
import PinLayout
import UIUtil
import FoundationUtil


class ListCollectionViewCell : BaseCollectionViewCell{
    
    let iv  = UIImageView().then{
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.backgroundColor = .gray // 나중에 지워야함
    }
    let date = UILabel().then{
        $0.font = UIFont.systemFont(ofSize: 13)
        $0.textColor = .black
        $0.textAlignment = .center
        $0.numberOfLines = 2
    }

    
    //MARK: - Method
    override func configureUI() {
        contentView.backgroundColor = .white
    }
    //MARK: - AddView
    override func addView() {
        contentView.addSubviews(iv,date)
    }
    //MARK: - SetupLayout
    override func setUpLayout() {
        contentView.layer.applySketchShadow(color: .gray, alpha: 0.25, x: 0, y: 10, blur: 10, spread: 0)
        
        iv.pin.top().left().right().bottom(30)
        date.pin.bottom().hCenter().width(contentView.frame.width).height(30)
    }
}
