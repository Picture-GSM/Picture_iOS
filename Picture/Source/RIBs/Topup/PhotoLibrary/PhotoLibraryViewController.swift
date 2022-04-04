//
//  PhotoLibraryViewController.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/31.
//

import UIKit
import RxSwift
import Photos
import RIBs
import Reusable
import RIBsUtil
import PinLayout

protocol PhotoLibraryPresentableListener: AnyObject {
    func didTapClose()
}

final class PhotoLibraryViewController: UIViewController, PhotoLibraryPresentable, PhotoLibraryViewControllable {
    //MARK: - Listener
    weak var listener: PhotoLibraryPresentableListener?
    
    
    //MARK: - Properties
    let bounds = UIScreen.main.bounds
    private var disposeBag : DisposeBag = .init()
    
    private let selectedPhotoSubject = PublishSubject<UIImage>()
    var selectedPhoto : Observable<UIImage>{
        return selectedPhotoSubject.asObserver()
    }
    
    private var images = [PHAsset]()
    
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init()).then{
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        $0.register(PhotoCell.self, forCellWithReuseIdentifier: "photoLibrary")
        $0.collectionViewLayout = layout
    }
    
    
    //MARK: - init
    init(closeButtonType : DismissButtonType){
        super.init(nibName: nil, bundle: nil)
        setupNavigationItem(with: closeButtonType, target: self, action: #selector(didTapClose))
        configureUI()
        addView()
        delegate()
    }
    
    @available( * , unavailable)
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupNavigationItem(with: .close, target: self, action: #selector(didTapClose))
        configureUI()
        addView()
        delegate()
    }
    //MARK: - layout
    override func viewDidLayoutSubviews() {
        collectionView.pin.all()
    }
    
    //MARK: - setup
    private func configureUI(){
        view.backgroundColor = .white
        title = "Album"
        populatePhotos()
    }
    
    private func addView(){
        view.addSubviews(collectionView)
    }
    
    private func delegate(){
        collectionView.rx.setDataSource(self)
            .disposed(by: disposeBag)
        collectionView.rx.setDelegate(self)
            .disposed(by: disposeBag)
    }
    
    
    //MARK: - navigationButton Action
    @objc
    private func didTapClose(){
        listener?.didTapClose()
    }
    
    //MARK: - Photo
    private func populatePhotos(){
        PHPhotoLibrary.requestAuthorization { [weak self] status in
            if status == .authorized{
                let assets = PHAsset.fetchAssets(with: PHAssetMediaType.image, options: nil)
                assets.enumerateObjects { object, count, stop in
                    self?.images.append(object)
                }
                
                self?.images.reverse()
                
                DispatchQueue.main.async {
                    self?.collectionView.reloadData()
                }
            }
        }
    }
}
//MARK: - collectionView
extension PhotoLibraryViewController : UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoLibrary", for: indexPath) as? PhotoCell else{
            return UICollectionViewCell()
        }
        
        let asset = self.images[indexPath.row]
        let manager = PHImageManager.default()
        
        manager.requestImage(for: asset, targetSize: CGSize(width: 100, height:100), contentMode: .aspectFit, options: nil) { image, _ in
            DispatchQueue.main.async {
                cell.imageView.image = image
            }
        }
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: bounds.width/3 - 1, height: bounds.width/3)
    }
}
