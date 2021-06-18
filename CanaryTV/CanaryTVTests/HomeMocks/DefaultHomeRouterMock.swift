//
//  DefaultHomeRouterMock.swift
//  CanaryTVTests
//
//  Created by Jared Perez Vega on 18/6/21.
//

import XCTest
@testable import CanaryTV

class DefaultHomeRouterMock: DefaultHomeRouter {
    
    var isDefaultHomeRouterMock = false
    
    override func showDetailView(movieDetail: MovieDetailInfoModel) {
        isDefaultHomeRouterMock = true
    }
}
