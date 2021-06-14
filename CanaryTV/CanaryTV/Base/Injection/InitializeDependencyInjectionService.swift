//
//  InitializeDependencyInjectionService.swift
//  CanaryTV
//
//  Created by Jared Perez Vega on 14/6/21.
//

import Foundation
import Swinject

class InitializeDependencyInjectionService {
    
    static let shared = InitializeDependencyInjectionService()
    internal let injector = Container()
    
    private init() {}
    
    func register() {
        registerUtilities()
        registerInteractors()
        registerModules()
    }
    
    private func registerUtilities() {
        registerUtils()
    }
    
    private func registerInteractors() {}
    
    private func registerModules() {
        registerHomeModule()
    }
}
