//
//  ListMoviesInteractorMock.swift
//  CanaryTVTests
//
//  Created by Jared Perez Vega on 17/6/21.
//

import XCTest
@testable import CanaryTV

class ListMoviesInteractorMock: ListMoviesInteractor {
    
    override func execute() async throws -> ListMoviesInteractor.Output {
        guard let file = readLocalFile(forName: "ListMoviesModelJSON") else { fatalError("No file") }
        guard let model = parse(jsonData: file) else { fatalError("No model") }
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
    
    private func parse(jsonData: Data) -> [ListMoviesModel]? {
        do {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .deferredToDate
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let decodedData = try decoder.decode(ListMoviesInteractor.Output.self,
                                                       from: jsonData)
            return decodedData
        } catch {
            return nil
        }
    }
}
