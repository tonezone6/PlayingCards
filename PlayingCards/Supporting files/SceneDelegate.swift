//
//  SceneDelegate.swift
//  PCards
//
//  Created by Alex Stratu on 09.03.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let scene = (scene as? UIWindowScene) else { return }
        
        let vm = CardsViewModel()
        let vc = CardsViewController(viewModel: vm)
        vc.title = "Cards"
        let nav = UINavigationController(rootViewController: vc)
        
        window = UIWindow(windowScene: scene)
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
    }
}

