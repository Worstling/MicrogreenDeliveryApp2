//
//  AppCoordinator.swift
//  MicrogreenDeliveryApp
//
//  Created by Vladislav on 15.02.2024.
//

import UIKit

class AppCoordinator: Coordinator  {
    
    private let factory = SceneFactory.self
    
    override func start() {
        showMainFlow()
    }
   
    override func finish() {
        print("AppCoordinator finish")
    }
}
 
// MARK: - Navigation methods
private extension AppCoordinator {
    func showMainFlow() {
        guard let navigationController = navigationController else { return }
        let tabBarController = factory.makeMainFlow(coordinator:self,  finishDelegate: self)
        navigationController.pushViewController(tabBarController, animated: true)
    }
}

extension AppCoordinator: CoordinatorFinishDelegate {
    func coordinatorDidFinish(childCoordinatro: CoordinatorProtocol) {
        removeChildCoordinator(childCoordinatro)
        
        switch childCoordinatro.type {
        case .app:
              return
        default:
            navigationController?.popToRootViewController(animated: false)
        }
    }
}

