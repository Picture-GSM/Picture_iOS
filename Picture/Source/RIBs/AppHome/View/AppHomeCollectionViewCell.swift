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

final class AppHomeCollectionViewCell : BaseCollectionViewCell{
    //MARK: - Properties
    private let imageView = UIImageView(image: UIImage(systemName: "plus", withConfiguration: UIImage.SymbolConfiguration(pointSize: 15, weight: .regular))).then{
        $0.backgroundColor = .red
        $0.clipsToBounds = true
    }
    private let label = UILabel().then{
        $0.text = "2022-03-18"
        $0.font = UIFont.systemFont(ofSize: 15)
        $0.backgroundColor = .black
    }
    //MARK: - initalizer
    override func configureUI() {
        backgroundColor = .yellow
    }
    override func addView() {
        addSubviews(imageView,label)
    }
    override func setUpLayout() {
        imageView.pin.top().left().right().bottom(10)
        label.pin.bottom().left().right().height(10)
    }
}
