//
//  RegisterUtils.swift
//  CanaryTV
//
//  Created by Jared Perez Vega on 14/6/21.
//

import Foundation

internal extension InitializeDependencyInjectionService {
    
    func registerUtils() {
        registerWebService()
        registerListMoviesTableManager()
        registerPlayer()
        registerPlayerViewController()
    }
    
    private func registerWebService() {
        injector.register(WebService.self) { _ in
            WebService()
        }
    }
    
    private func registerListMoviesTableManager() {
        injector.register(ListMoviesTableManager.self) { _ in
            ListMoviesTableManager()
        }
    }
    
    private func registerPlayer() {
        injector.register(Player.self) { (r: ResolverInjection, url: URL) in
            Player(url: url)
        }
    }
    
    private func registerPlayerViewController() {
        injector.register(PlayerViewController.self) { (r: ResolverInjection, url: URL) in
            let playerViewController = PlayerViewController()
            let player = r.resolve(Player.self, argument: url)
            playerViewController.player = player
            return playerViewController
        }
    }
    
}
