//
//  DefaultDetailRouter.swift
//  CanaryTV
//
//  Created by Jared Perez Vega on 16/6/21.
//

import Foundation
import AVKit
import AVFoundation

class DefaultDetailRouter: DetailRouter {
    
    var viewController: BaseViewController
    
    private let resolver: ResolverInjection!
    
    init(resolver: ResolverInjection, viewController: BaseViewController) {
        self.resolver = resolver
        self.viewController = viewController
    }
    
    func showTrailerScreen(with url: URL) {
        guard let playerViewController = resolver.resolve(PlayerViewController.self, argument: url) else { return }
        viewController.navigationController?.present(playerViewController, animated: true, completion: {
            playerViewController.player?.play()
        })
    }
        
}
