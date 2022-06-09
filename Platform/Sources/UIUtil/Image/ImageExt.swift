import UIKit

public extension UIImage{
    func conbineWith(image: UIImage) -> UIImage{
        let size = CGSize(width: 512 + image.size.width , height: self.size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        
        self.draw(in: CGRect(x: 0, y: 0, width: 512, height: size.height))
        image.draw(in: CGRect(x: 512, y: 0, width: image.size.width, height: size.height))
        
        let newImage : UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return newImage
    }
}
