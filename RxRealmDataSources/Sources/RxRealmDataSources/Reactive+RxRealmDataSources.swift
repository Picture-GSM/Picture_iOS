//
//  Reactive+RxRealmDataSources.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/04/07.
//


import Foundation

import RealmSwift
import RxSwift
import RxCocoa
import RxRealm

// MARK: - iOS / UIKit
import UIKit

extension Reactive where Base: UICollectionView {

    public func realmChanges<E>(_ dataSource: RxCollectionViewRealmDataSource<E>)
        -> RealmBindObserver<E, AnyRealmCollection<E>, RxCollectionViewRealmDataSource<E>> {

            return RealmBindObserver(dataSource: dataSource) {ds, results, changes in
                if ds.collectionView == nil {
                    ds.collectionView = self.base
                }
                ds.collectionView?.dataSource = ds
                ds.applyChanges(items: AnyRealmCollection<E>(results), changes: changes)
            }
    }

    public func realmModelSelected<E>(_ modelType: E.Type) -> ControlEvent<E> where E: RealmSwift.Object {

        let source: Observable<E> = self.itemSelected.flatMap { [weak view = self.base as UICollectionView] indexPath -> Observable<E> in
            guard let view = view, let ds = view.dataSource as? RxCollectionViewRealmDataSource<E> else {
                return Observable.empty()
            }

            return Observable.just(ds.model(at: indexPath))
        }
        
        return ControlEvent(events: source)
    }
}
