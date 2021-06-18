//
//  ListMoviesInteractorErrorMock.swift
//  CanaryTVTests
//
//  Created by Jared Perez Vega on 18/6/21.
//

import XCTest
@testable import CanaryTV

class ListMoviesInteractorErrorMock: ListMoviesInteractor {
    override func execute(completion: @escaping (ListMoviesInteractor.Output) -> Void, errorHandler: @escaping (Error) -> Void) {
        errorHandler(MyCustomError.ApiError("Custom Error"))
    }
    
}
