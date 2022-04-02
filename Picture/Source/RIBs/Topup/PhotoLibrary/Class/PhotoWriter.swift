//
//  PhotoWriter.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/04/03.
//

import Foundation
import UIKit

import RxSwift

class PhotoWriter: NSObject {
  typealias Callback = (NSError?)->Void

  private var callback: Callback
  private init(callback: @escaping Callback) {
    self.callback = callback
  }

    @objc func image(_ image: UIImage, didFinishSavingWithError error: NSError?, contextInfo: UnsafeRawPointer) {
    callback(error)
  }

  static func save(_ image: UIImage) -> Observable<Void> {
    return Observable.create({ observer in
      let writer = PhotoWriter(callback: { error in
        if let error = error {
          observer.onError(error)
        } else {
          observer.onCompleted()
        }
      })
      UIImageWriteToSavedPhotosAlbum(image, writer,
                                     #selector(PhotoWriter.image(_:didFinishSavingWithError:contextInfo:)),
                                     nil)
      return Disposables.create()
    })
  }
}
