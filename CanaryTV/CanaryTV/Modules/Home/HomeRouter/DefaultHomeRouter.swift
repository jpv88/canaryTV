//
//  DefaultHomeRouter.swift
//  CanaryTV
//
//  Created by Jared Perez Vega on 14/6/21.
//

import Foundation
import Swinject

class DefaultHomeRouter: HomeRouter {
    
    private let resolver: Resolver!
    
    init(resolver: Resolver) {
        self.resolver = resolver
    }
    
    func showDetailView() {
        
    }
        
}
