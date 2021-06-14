//
//  Interactors.swift
//  CanaryTV
//
//  Created by Jared Perez Vega on 14/6/21.
//

import Foundation

class Interactor {
    
    init() {}
    
    func execute() throws { fatalError("Execute must be implemented!") }
}

class OutputInteractor<Output> {
    
    init() {}
    
    func execute() throws -> Output { fatalError("Execute must be implemented!") }
}

class InputInteractor<Input> {
    
    init() {}
    
    func execute(input: Input) throws { fatalError("Execute must be implemented!") }
}

class InOutInteractor<Input, Output> {
    
    init() {}
    
    func execute(input: Input) throws -> Output { fatalError("Execute must be implemented!") }
}
