//
//  DefaultHomePresenterTest.swift
//  CanaryTVTests
//
//  Created by Jared Perez Vega on 17/6/21.
//

import XCTest
@testable import CanaryTV

class DefaultHomePresenterTest: XCTestCase {
    
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

    func testHomePresenterViewDidLoad() throws {
        presenter.onViewDidLoad()
        Thread.sleep(forTimeInterval: 1)
        XCTAssertTrue(viewController.isDefaultHomeViewControllerTestCalled)
    }
    
    func testHomePresenterSomeViewPressed() throws {
        presenter.someMoviePressed(movieID: "riddick")
        Thread.sleep(forTimeInterval: 1)
        XCTAssertTrue(router.isDefaultHomeRouterMock)
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
                             listMoviesInteractor: ListMoviesInteractorMock(
                                webService: WebServiceMock()
                             ),
                             getMovieDetailInfoInteractor: GetMovieDetailInteractorMock(
                                webService: WebServiceMock()
                             )
        )
    }

}
