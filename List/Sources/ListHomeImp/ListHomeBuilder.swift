import RIBs
import ImageVerification
import ImageRepository
import ListHome
import ImageEntity

public protocol ListHomeDependency: Dependency {
    var imageVerificationBuildable : ImageVerificationBuildable {get}
    var imageRepository: ImageRepository{get}
}

final class ListHomeComponent: Component<ListHomeDependency>, ListHomeInteractorDependency{
    var imageVerificationBuildable : ImageVerificationBuildable {dependency.imageVerificationBuildable}
    var imageRepository: ImageRepository{dependency.imageRepository}
}

// MARK: - Builder
public final class ListHomeBuilder: Builder<ListHomeDependency>, ListHomeBuildable {

    public override init(dependency: ListHomeDependency) {
        super.init(dependency: dependency)
    }

    public func build(withListener listener: ListHomeListener) -> ViewableRouting {
        let component = ListHomeComponent(dependency: dependency)
        let viewController = ListHomeViewController() 
        let interactor = ListHomeInteractor(
            presenter: viewController,
            dependency: component
        )
        interactor.listener = listener
        return ListHomeRouter(interactor: interactor,
                              viewController: viewController,
                              imageVerifivationBuildable: component.imageVerificationBuildable)
    }
}
