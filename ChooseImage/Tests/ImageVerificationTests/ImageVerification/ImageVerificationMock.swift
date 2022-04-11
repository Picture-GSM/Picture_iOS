import Foundation
import ImageRepository
@testable import ImageVerificationImp
import UIKit

final class ImageVerificationPresentableMock : ImageVerificationPresentable{
    
    var listener: ImageVerificationPresentableListener?
    
    
    var updateCallCount = 0
    var updateImage : UIImage
    func update(image: UIImage) {
        updateCallCount += 1
        updateImage = image
    }
    
    init(){
        
    }
}

final class ImageVerificationDependencyMock : ImageVerificationDependency{
    var imageRepository: ImageRepository
}
