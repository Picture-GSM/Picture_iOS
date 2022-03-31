//
//  TopupBuilder.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/03/31.
//

import RIBs

protocol TopupDependency: Dependency {
    var topupViewController: TopupViewControllable { get }

}

final class TopupComponent: Component<TopupDependency> {

    // TODO: Make sure to convert the variable into lower-camelcase.
    fileprivate var topupViewController: TopupViewControllable {
        return dependency.topupViewController
    }

    // TODO: Declare 'fileprivate' dependencies that are only used by this RIB.
}

// MARK: - Builder

protocol TopupBuildable: Buildable {
    func build(withListener listener: TopupListener) -> TopupRouting
}

final class TopupBuilder: Builder<TopupDependency>, TopupBuildable {

    override init(dependency: TopupDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: TopupListener) -> TopupRouting {
        let component = TopupComponent(dependency: dependency)
        let interactor = TopupInteractor()
        interactor.listener = listener
        return TopupRouter(interactor: interactor, viewController: component.topupViewController)
    }
}
