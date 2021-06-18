//
//  DefaultHomePresenterErrorTest.swift
//  CanaryTVTests
//
//  Created by Jared Perez Vega on 18/6/21.
//

import XCTest
@testable import CanaryTV

class DefaultHomePresenterErrorTest: XCTestCase {
    
    var presenter: DefaultHomePresenter!
    var viewController: DefaultHomeViewControllerMock!
    var router: DefaultHomeRouterMock!

    override func setUpWithError() throws {
      try super.setUpWithError()
        viewController = buildViewController()
        router = buildRouter(baseVC: viewController)
        presenter = buildPresenter()
    }

    override func tearDownWithError() throws {
        presenter = nil
        viewController = nil
      try super.tearDownWithError()
    }

    func testHomePresenterViewDidLoadError() throws {
        presenter.onViewDidLoad()
        XCTAssertTrue(viewController.isShowErrorCalled)
    }
    
    func testHomePresenterSomeViewPressedError() throws {
        presenter.someMoviePressed(movieID: "riddick")
        XCTAssertTrue(viewController.isShowErrorCalled)
    }
    
    private func buildRouter(baseVC: BaseViewController) -> DefaultHomeRouterMock {
        let injector = InitializeDependencyInjectionService.shared.injector
        return DefaultHomeRouterMock(resolver: injector, viewController: baseVC)
    }

    private func buildViewController() -> DefaultHomeViewControllerMock {
        return DefaultHomeViewControllerMock()
    }
    
    private func buildPresenter() -> DefaultHomePresenter? {
        return DefaultHomePresenter(view: viewController,
                             router: router,
                             listMoviesInteractor: ListMoviesInteractorErrorMock(
                                webService: WebServiceMock()
                             ),
                             getMovieDetailInfoInteractor: GetMovieDetailInteractorErrorMock(
                                webService: WebServiceMock()
                             )
        )
    }

}
