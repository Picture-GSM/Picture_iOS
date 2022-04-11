//
//  ImageVerificationInteractorTests.swift
//  Picture
//
//  Created by Ji-hoon Ahn on 2022/04/11.
//

@testable import ImageVerificationImp
import XCTest

final class ImageVerificationInteractorTests: XCTestCase {

    private var sut: ImageVerificationInteractor!
    private var presenter : ImageVerificationPresentableMock!
    
    // TODO: declare other objects and mocks you need as private vars

    override func setUp() {
        super.setUp()

        sut = ImageVerificationInteractor(
            presenter: self.presenter,
            withImage: ,
            imageStateAlready: ,
            dependency:
        )
    }

    // MARK: - Tests

    func test_exampleObservable_callsRouterOrListener_exampleProtocol() {
        // This is an example of an interactor test case.
        // Test your interactor binds observables and sends messages to router or listener.
    }
}
