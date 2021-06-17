//
//  PlayerViewController.swift
//  CanaryTV
//
//  Created by Jared Perez Vega on 16/6/21.
//

import UIKit
import AVKit
import AVFoundation

class PlayerViewController: AVPlayerViewController {
    init() {
        super.init(nibName: nil, bundle: nil)
        view.accessibilityIdentifier = "PlayerView"
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
