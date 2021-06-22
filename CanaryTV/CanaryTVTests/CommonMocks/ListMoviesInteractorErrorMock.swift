//
//  ListMoviesInteractorErrorMock.swift
//  CanaryTVTests
//
//  Created by Jared Perez Vega on 18/6/21.
//

import XCTest
@testable import CanaryTV

class ListMoviesInteractorErrorMock: ListMoviesInteractor {
    
    override func execute() async throws -> ListMoviesInteractor.Output {
        throw MyCustomError.ApiError("Custom Error")
    }
    
}
