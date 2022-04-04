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
import Photos

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

 
    func setImage(_ asset : PHAsset){
        self.imageView.image = asset.getAssetThumbnail(size: CGSize(width: self.frame.width * 3, height: self.frame.height * 3))
    }
    func setImage(_ image : UIImage){
        self.imageView.image = image
    }
}
