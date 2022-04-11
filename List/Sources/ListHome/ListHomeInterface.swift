import Foundation
import RIBs

public protocol ListHomeListener: AnyObject {
    // TODO: Declare methods the interactor can invoke to communicate with other RIBs.
}

public protocol ListHomeBuildable: Buildable {
    func build(withListener listener: ListHomeListener) -> ViewableRouting
}
