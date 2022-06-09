import Foundation
import RxSwift
import UIKit
import RealmSwift
import RxRealm
import ImageEntity

public protocol ImageRepository{
    func addImage(saveImage image : UIImage)
    func fetch() -> Observable<(AnyRealmCollection<Results<Photo>.ElementType>, RealmChangeset?)>
}

public final class ImageRepositoryImp: ImageRepository{
    
    public func addImage(saveImage image: UIImage) {
        let task = Photo(value: Date())
        try! realm.write{
            realm.add(task)
            ImageDirectory.shared.saveImageToDocumentDirectory(imageName: "\(task.id).png", image: image)
        }
    }
    
    public func fetch() -> Observable<(AnyRealmCollection<Results<Photo>.ElementType>, RealmChangeset?)>{
        return Observable.changeset(from: realm.objects(Photo.self)).share()
    }
    private let realm = try! Realm()
    
    public init(){
        
    }
}

