//
//  NoInternetViewController.swift
//  NoInternetConnection
//
//  Created by Sparkout on 08/05/23.
//

import UIKit

class NoInternetViewController: UIViewController {

    @IBOutlet weak var retryButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.3)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(dismissView), name: Notification.Name("NetworkMonitor"), object: nil)
    }

    @objc func dismissView(notification: Notification) {
        print(notification.userInfo)
        DispatchQueue.main.async {
            self.dismiss(animated: true)
        }
    }
}
