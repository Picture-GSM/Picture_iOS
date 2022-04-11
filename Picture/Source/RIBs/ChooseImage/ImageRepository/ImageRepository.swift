//
//  ImageRepository.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/04/09.
//

import Foundation
import RxSwift
import UIKit
import RealmSwift
import RxRealm

protocol ImageRepository{
    func addImage(saveImage image : UIImage)
    func fetch() -> Observable<(AnyRealmCollection<Results<Photo>.ElementType>, RealmChangeset?)>
}

final class ImageRepositoryImp: ImageRepository{
    
    func addImage(saveImage image: UIImage) {
        let task = Photo(date: Date())
        try! realm.write{
            realm.add(task)
            ImageDirectory.shared.saveImageToDocumentDirectory(imageName: "\(task.id).png", image: image)
        }
    }
    
    func fetch() -> Observable<(AnyRealmCollection<Results<Photo>.ElementType>, RealmChangeset?)>{
        return Observable.changeset(from: realm.objects(Photo.self)).share()
    }
    private let realm = try! Realm()
    
    init(){
        
    }
}

