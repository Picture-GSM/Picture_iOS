//
//  ListCollectionViewCell.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/18.
//

import UIKit
import PinLayout
import UIUtil

class ListCollectionViewCell : BaseCollectionViewCell<Any>{
    
    private let iv  = UIImageView().then{
        $0.contentMode = .scaleAspectFill
        $0.backgroundColor = .gray // 나중에 지워야함
    }
    private let data = UILabel().then{
        $0.text = "2022년 03월 18일" //지워야함
        $0.font = UIFont.systemFont(ofSize: 13)
        $0.textColor = .black
        $0.numberOfLines = 2
    }
    
    //MARK: - Method
    override func configureUI() {
        contentView.backgroundColor = .gray
    }
    //MARK: - AddView
    override func addView() {
        addSubviews(iv, data)
    }
    //MARK: - SetupLayout
    override func setUpLayout() {
        iv.pin.top().left().right().bottom(20)
        data.pin.bottom().right().left().height(20)
    }
}
