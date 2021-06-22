//
//  GetMovieTrailerURLInteractorMock.swift
//  CanaryTVTests
//
//  Created by Jared Perez Vega on 18/6/21.
//

import XCTest
@testable import CanaryTV

class GetMovieTrailerURLInteractorMock: GetMovieTrailerURLInteractor {
    
    override func execute(input: GetMovieTrailerURLInteractor.Input) async throws -> GetMovieTrailerURLInteractor.Output {
        guard let url = URL(string: "https://www.google.es/") else { fatalError("No URL") }
        return url
    }

}
