//
//  ListMoviesInteractorMock.swift
//  CanaryTVTests
//
//  Created by Jared Perez Vega on 17/6/21.
//

import XCTest
@testable import CanaryTV

class ListMoviesInteractorMock: ListMoviesInteractor {
    override func execute(completion: @escaping (ListMoviesInteractor.Output) -> Void, errorHandler: @escaping (Error) -> Void) {
        guard let file = readLocalFile(forName: "ListMoviesModelJSON") else { return }
        guard let model = parse(jsonData: file) else { return }
        completion(model)
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
            let decodedData = try JSONDecoder().decode(ListMoviesInteractor.Output.self,
                                                       from: jsonData)
            return decodedData
        } catch {
            return nil
        }
    }
}
