//
//  NetworkMonitor.swift
//  NoInternetConnection
//
//  Created by Sparkout on 08/05/23.
//

import Foundation
import Network
import UIKit

class NetworkMonitor {
    static let shared = NetworkMonitor()

    let monitor = NWPathMonitor()
    private var status: NWPath.Status = .requiresConnection
    var isReachable: Bool { status == .satisfied }
    var isReachableOnCellular: Bool = true

    func startMonitoring(destinationVc: UIViewController) {
        monitor.pathUpdateHandler = { [weak self] path in
            self?.status = path.status
            self?.isReachableOnCellular = path.isExpensive
            DispatchQueue.main.async {
                if path.status == .satisfied {
                    UIApplication.topViewController()?.dismiss(animated: false)
                } else {
                    if let topView = UIApplication.topViewController()
                        {
                        destinationVc.modalPresentationStyle = .overCurrentContext
                        topView.present(destinationVc, animated: true)
                    }
                }
            }
        }

        let queue = DispatchQueue(label: "NetworkMonitor")
        monitor.start(queue: queue)
    }

    func stopMonitoring() {
        monitor.cancel()
    }
    
    func showNoInternetView() {
        
    }
}
