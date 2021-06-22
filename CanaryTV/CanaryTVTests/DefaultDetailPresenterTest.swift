//
//  DefaultDetailPresenterTest.swift
//  CanaryTVTests
//
//  Created by Jared Perez Vega on 18/6/21.
//

import XCTest
@testable import CanaryTV

class DefaultDetailPresenterTest: XCTestCase {
    
    var presenter: DefaultDetailPresenter!
    var viewController: DefaultDetailViewControllerMock!
    var router: DefaultDetailRouterMock!
    var model: MovieDetailInfoModel!
    
    private let getMovieDetailInteractorMock = GetMovieDetailInteractorMock(
        webService: WebServiceMock()
     )
    
    override func setUpWithError() throws {
      try super.setUpWithError()
        let exp = expectation(description: "\(#function)\(#line)")
        async {
            let model = try await getMovieDetailInteractorMock.execute(input: "")
            self.model = model
            exp.fulfill()
        }
        waitForExpectations(timeout: 3, handler: nil)
        viewController = buildViewController()
        router = buildRouter(baseVC: viewController)
        presenter = buildPresenter()
    }

    override func tearDownWithError() throws {
        presenter = nil
        viewController = nil
        router = nil
      try super.tearDownWithError()
    }

    func testDetailPresenterViewDidLoad() throws {
        presenter.onViewDidLoad()
        XCTAssertTrue(viewController.isDefaultDetailViewControllerTestCalled)
    }

    func testDetailPresenterShowTrailer() throws {
        presenter.showTrailer()
        XCTAssertTrue(router.isDefaultDetailRouterMock)
    }
    
    private func buildRouter(baseVC: BaseViewController) -> DefaultDetailRouterMock {
        let injector = InitializeDependencyInjectionService.shared.injector
        return DefaultDetailRouterMock(resolver: injector, viewController: baseVC)
    }

    private func buildViewController() -> DefaultDetailViewControllerMock {
        return DefaultDetailViewControllerMock()
    }
    
    private func buildPresenter() -> DefaultDetailPresenter? {
        return DefaultDetailPresenter(
            view: viewController,
            router: router,
            dataModel: model,
            trailerMovieInteractor: GetMovieTrailerURLInteractorMock(
                webService: WebServiceMock()
            )
        )
    }

}
