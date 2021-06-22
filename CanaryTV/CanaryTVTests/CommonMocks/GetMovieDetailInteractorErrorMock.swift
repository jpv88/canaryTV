//
//  GetMovieDetailInteractorErrorMock.swift
//  CanaryTVTests
//
//  Created by Jared Perez Vega on 18/6/21.
//

import XCTest
@testable import CanaryTV

class GetMovieDetailInteractorErrorMock: GetMovieDetailInteractor {
    
    override func execute(input: GetMovieDetailInteractor.Input) async throws -> GetMovieDetailInteractor.Output {
        throw MyCustomError.ApiError("Custom Error")
    }
    
}
