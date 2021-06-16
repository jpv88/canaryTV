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
        navigationController?.navigationBar.prefersLargeTitles = false

         let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = Colors.tertiary
        appearance.titleTextAttributes = [.foregroundColor: Colors.secondary]
         appearance.largeTitleTextAttributes = [.foregroundColor: Colors.secondary]

         navigationController?.navigationBar.tintColor = .white
         navigationController?.navigationBar.standardAppearance = appearance
         navigationController?.navigationBar.compactAppearance = appearance
         navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }

    func setUpLayout() {}
}
