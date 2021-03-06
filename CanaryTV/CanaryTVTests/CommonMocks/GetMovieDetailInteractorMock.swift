//
//  GetMovieDetailInteractorMock.swift
//  CanaryTVTests
//
//  Created by Jared Perez Vega on 17/6/21.
//

import XCTest
@testable import CanaryTV

class GetMovieDetailInteractorMock: GetMovieDetailInteractor {
    
    override func execute(input: GetMovieDetailInteractor.Input) async throws -> GetMovieDetailInteractor.Output {
        guard let file = readLocalFile(forName: "MovieDetailInfoModelJSON") else { fatalError("No File") }
        guard let model = parse(jsonData: file) else { fatalError("No Model") }
        return model
    }
    
    private func readLocalFile(forName name: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name,
                                                 ofType: "json") {
                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8)
                return jsonData
            }
        } catch {
            print(error)
        }
        
        return nil
    }
    
    private func parse(jsonData: Data) -> MovieDetailInfoModel? {
        do {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .deferredToDate
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let decodedData = try decoder.decode(MovieDetailInfoModel.self,
                                                       from: jsonData)
            return decodedData
        } catch {
            return nil
        }
    }
}
