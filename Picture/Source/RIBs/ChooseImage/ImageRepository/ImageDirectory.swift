//
//  ImageSaveDocumentDirectory.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/04/07.
//

import RealmSwift
import UIKit

class ImageDirectory {
    static let shared : ImageDirectory = ImageDirectory()
    
    func saveImageToDocumentDirectory(imageName: String, image: UIImage) {
            guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {return}
            let imageURL = documentDirectory.appendingPathComponent(imageName)
            
            guard let data = image.pngData() else {
                print("압축이 실패했습니다.")
                return
            }
            if FileManager.default.fileExists(atPath: imageURL.path) {
                do {
                    try FileManager.default.removeItem(at: imageURL)
                    print("이미지 삭제 완료")
                } catch {
                    print("이미지를 삭제하지 못했습니다.")
                }
            }
            do {
                try data.write(to: imageURL)
                print("이미지 저장완료")
            } catch {
                print("이미지를 저장하지 못했습니다.")
            }
        }
    
    func loadImageFromDocumentDirecotry(imageName : String) -> UIImage?{
        // 1. 도큐먼트 폴더 경로가져오기
        let documentDirectory = FileManager.SearchPathDirectory.documentDirectory
        let userDomainMask = FileManager.SearchPathDomainMask.userDomainMask
        let path = NSSearchPathForDirectoriesInDomains(documentDirectory, userDomainMask, true)
        
        if let directoryPath = path.first {
        // 2. 이미지 URL 찾기
            let imageURL = URL(fileURLWithPath: directoryPath).appendingPathComponent(imageName)
            // 3. UIImage로 불러오기
            return UIImage(contentsOfFile: imageURL.path)
        }
        
        return nil
    }
}
