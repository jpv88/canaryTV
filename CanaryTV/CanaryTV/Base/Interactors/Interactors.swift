//
//  Interactors.swift
//  CanaryTV
//
//  Created by Jared Perez Vega on 14/6/21.
//

import Foundation

class Interactor {
    
    init() {}
    
    func execute() { fatalError("Execute must be implemented!") }
}

class OutputInteractor<Output> {
    
    init() {}
    
    func execute(completion: @escaping (Output) -> Void, errorHandler: @escaping (Error) -> Void) { fatalError("Execute must be implemented!") }
}

class InputInteractor<Input> {
    
    init() {}
    
    func execute(input: Input) { fatalError("Execute must be implemented!") }
}

class InOutInteractor<Input, Output> {
    
    init() {}
    
    func execute(input: Input, completion: @escaping (Output) -> Void, errorHandler: @escaping (Error) -> Void) { fatalError("Execute must be implemented!") }
}
