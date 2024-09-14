//
//  SceneFactory.swift
//  MicrogreenDeliveryApp
//
//  Created by Vladislav on 12.09.2024.
//

import UIKit


struct SceneFactory {
    
    //MARK: - Main flow
    static func makeMainFlow(coordinator: AppCoordinator, finishDelegate: CoordinatorFinishDelegate) -> TabBarController {
        
        let menuNavigationController = UINavigationController()
        let menuCoordinator = MenuCoordinator(type: .menu, navigationController: menuNavigationController)
        menuNavigationController.tabBarItem = UITabBarItem(title: "Menu", image: UIImage.init(systemName: "figure.walk"), tag: 0)
        menuCoordinator.finishDelegate = finishDelegate
        menuCoordinator.start()
        
        let contactsNavigationController = UINavigationController()
        let contactsCoordinator = ContactsCoordinator(type: .contacts, navigationController: contactsNavigationController)
        contactsNavigationController.tabBarItem = UITabBarItem(title: "Contacts", image: UIImage.init(systemName: "figure.walk"), tag: 1)
        contactsCoordinator.finishDelegate = finishDelegate
        contactsCoordinator.start()
        
        let cartNavigationController = UINavigationController()
        let cartCoordinator = CartCoordinator(type: .cart, navigationController: cartNavigationController)
        cartNavigationController.tabBarItem = UITabBarItem(title: "Cart", image: UIImage.init(systemName: "figure.walk"), tag: 2)
        cartCoordinator.finishDelegate = finishDelegate
        cartCoordinator.start()
        
        let profileNavigationController = UINavigationController()
        let profileCoordinator = ProfileCoordinator(type: .profile, navigationController: profileNavigationController)
        profileNavigationController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage.init(systemName: "figure.walk"), tag: 3)
        profileCoordinator.finishDelegate = finishDelegate
        profileCoordinator.start()
        
        coordinator.addChildCoordinator(menuCoordinator)
        coordinator.addChildCoordinator(contactsCoordinator)
        coordinator.addChildCoordinator(cartCoordinator)
        coordinator.addChildCoordinator(profileCoordinator)
        
        let tabBarControllers = [menuNavigationController, contactsNavigationController, cartNavigationController, profileNavigationController]
        let tabBarController = TabBarController(tabBarControllers: tabBarControllers)
        
        return tabBarController
    }
}
