//
//  ViewController.swift
//  Messenger
//
//  Created by Dan Nguyen on 19/08/2022.
//

import UIKit

class ConversationsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .red;
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let isLogged = UserDefaults.standard.bool(forKey: "logged_in")
        if !isLogged{
            let vc = LoginViewController()
            let nav = UINavigationController(rootViewController:  vc)
            nav.modalPresentationStyle = .fullScreen;
            present(nav, animated: true)
        } else {
            view.background;
        }
    }
}

