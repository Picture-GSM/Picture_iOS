//
//  PhotoCell.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/04/03.
//

import Foundation
import UIKit
import Reusable
import PinLayout

class PhotoCell : UICollectionViewCell,Reusable{
    
    let imageView = UIImageView()
    var representedAssetIdentifier: String!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setlayout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setlayout()
    }
    
    private func setlayout(){
        addSubviews(imageView)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.pin.all()

    }
    
    override func prepareForReuse() {
      super.prepareForReuse()
      imageView.image = nil
        
    }

    func flash() {
      imageView.alpha = 0
      setNeedsDisplay()
      UIView.animate(withDuration: 0.5, animations: { [weak self] in
        self?.imageView.alpha = 1
      })
    }
}
