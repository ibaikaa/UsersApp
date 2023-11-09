//
//  SceneDelegate.swift
//  Breez_TestApp
//
//  Created by ibaikaa on 8/11/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        setRootVC(windowScene: windowScene)
        setLightTheme()
    }
    
    private func setRootVC(windowScene: UIWindowScene) {
        let window = UIWindow(windowScene: windowScene)
        
        let navController = UINavigationController(rootViewController: UsersBuilder.create())
        window.rootViewController = navController
        
        self.window = window
        window.makeKeyAndVisible()
    }
    
    private func setLightTheme() {
        window?.overrideUserInterfaceStyle = .light
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        
    }

    func sceneWillResignActive(_ scene: UIScene) {
        
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        
    }

}

