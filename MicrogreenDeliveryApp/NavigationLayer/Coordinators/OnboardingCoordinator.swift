//
//  OnboardingCoordinator.swift
//  MicrogreenDeliveryApp
//
//  Created by Vladislav on 15.02.2024.
//

import UIKit

// MARK: - OnboardingCoordinator
class OnboardingCoordinator: Coordinator {
    
    
    // MARK: - Properties
    private let factory = SceneFactory.self
    
    // MARK: - Methods
    override func start() {
       let vc = ViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    override func finish() {
        print("AppCoordinator finish")
    }
}
 

