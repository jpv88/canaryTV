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
    
    var viewController: BaseViewController?
    
    private let resolver: ResolverInjection!
    
    init(resolver: ResolverInjection) {
        self.resolver = resolver
    }
    
    func showTrailerScreen(with player: PlayerViewController) {
        guard let from = viewController else { return }
        from.navigationController?.present(player, animated: true, completion: {
            player.player?.play()
        })
    }
        
}
