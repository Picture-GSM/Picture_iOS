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
    
    func saveImageToDocumentDirectory(imageName : String, image : UIImage){
        guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {return}
        let imageURL = documentDirectory.appendingPathExtension(imageName)
        guard let data = image.pngData() else{
            print("압축 실패하였습니다.")
            return
        }
        // 이미지 경로 여부 확인
        if FileManager.default.fileExists(atPath: imageURL.path){
            do{
                try FileManager.default.removeItem(at: imageURL)
                print("이미지 삭제 성공")
            }catch{
                print("이미지 삭제 못했습니다.")
            }
        }
        do{
            try data.write(to: imageURL)
            print("이미지 저장 완료")
        }catch{
            print("이미지를 저장하지 못했습니다.")
        }
    }
    
    func loadImageFromDocumentDirecotry(imageName : String) -> UIImage?{
        let documentDirectory  = FileManager.SearchPathDirectory.documentDirectory
        let userDomainMask = FileManager.SearchPathDomainMask.userDomainMask
        let path = NSSearchPathForDirectoriesInDomains(documentDirectory, userDomainMask, true)
        
        if let directoryPath = path.first{
            let imageURL = URL(fileURLWithPath: directoryPath).appendingPathComponent(imageName)
            return UIImage(contentsOfFile: imageURL.path)
        }
        return nil
    }
}
