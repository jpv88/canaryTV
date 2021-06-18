//
//  DefaultDetailRouterMock.swift
//  CanaryTVTests
//
//  Created by Jared Perez Vega on 18/6/21.
//

import XCTest
@testable import CanaryTV

class DefaultDetailRouterMock: DefaultDetailRouter {
    
    var isDefaultDetailRouterMock = false
    
    override func showTrailerScreen(with url: URL) {
        isDefaultDetailRouterMock = true
    }
}
