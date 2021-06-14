//
//  DefaultHomeRouter.swift
//  CanaryTV
//
//  Created by Jared Perez Vega on 14/6/21.
//

import Foundation

class DefaultHomeRouter: HomeRouter {
    
    private let resolver: ResolverInjection!
    
    init(resolver: ResolverInjection) {
        self.resolver = resolver
    }
    
    func showDetailView() {
        
    }
        
}
