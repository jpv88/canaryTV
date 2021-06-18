//
//  DefaultDetailViewControllerMock.swift
//  CanaryTVTests
//
//  Created by Jared Perez Vega on 18/6/21.
//

import XCTest
@testable import CanaryTV

class DefaultDetailViewControllerMock: DefaultDetailViewController {
    
    var isDefaultDetailViewControllerTestCalled = false
    
    override func showThisInfo(image: URL, title: String, description: String, rating: String, year: String, duration: String) {
        isDefaultDetailViewControllerTestCalled = true
    }
    
}
