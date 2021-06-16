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
    
    func showTrailerScreen(with player: PlayerViewController) {
        viewController.navigationController?.present(player, animated: true, completion: {
            player.player?.play()
        })
    }
        
}
