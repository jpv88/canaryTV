//
//  BaseViewController.swift
//  CanaryTV
//
//  Created by Jared Perez Vega on 14/6/21.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildComponents()
        setUpLayout()
    }
    
    func buildComponents() {
        view.backgroundColor = Colors.main
    }

    func setUpLayout() {}
}
