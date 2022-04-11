//
//  AppHomeCollectionViewCell.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/18.
//

import UIKit
import Then
import Reusable
import UIUtil
import Base
final class AppHomeCollectionViewCell : BaseCollectionViewCell{
    //MARK: - Properties
    private let bgView = UIView().then{
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 20
        $0.layer.applySketchShadow(color: .gray, alpha: 0.4, x: 0, y: 10, blur: 14, spread: 0)
    }
    
    let imageView = UIImageView(image: UIImage(systemName: "plus", withConfiguration: UIImage.SymbolConfiguration(pointSize: 15, weight: .regular))).then{
        $0.layer.cornerRadius = 10
        $0.backgroundColor = .red
        $0.clipsToBounds = true
    }
    let label = UILabel().then{
        $0.textAlignment = .center
        $0.font = UIFont.systemFont(ofSize: 10)
    }
    //MARK: - initalizer
    override func addView() {
        contentView.addSubviews(bgView)
        bgView.addSubviews(imageView,label)
    }
    override func setUpLayout() {
        bgView.pin.all()
        
        imageView.pin.top(10).hCenter().size(contentView.frame.width/1.5)
        label.pin.bottom(5).width(contentView.frame.width).height(10)
    }
}
