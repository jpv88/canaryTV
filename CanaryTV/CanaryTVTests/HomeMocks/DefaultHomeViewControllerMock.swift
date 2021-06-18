//
//  DefaultHomeViewControllerMock.swift
//  CanaryTVTests
//
//  Created by Jared Perez Vega on 18/6/21.
//

import XCTest
@testable import CanaryTV

class DefaultHomeViewControllerMock: DefaultHomeViewController {
    
    var isDefaultHomeViewControllerTestCalled = false
    var isShowErrorCalled = false
    
    override func showLoadedInfo(input: [ListMoviesModel]) {
        isDefaultHomeViewControllerTestCalled = true
    }
    
    override func showThisError(error: Error) {
        isShowErrorCalled = true
    }
}
