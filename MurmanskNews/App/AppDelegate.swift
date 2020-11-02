//
//  AppDelegate.swift
//  MurmanskNews
//
//  Created by Viktor on 02.11.2020.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        startGUI()
        return true
    }
}

extension AppDelegate {
    private func startGUI() {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let navigationController = UINavigationController()
        let mainView = MainTableViewController()
        navigationController.viewControllers = [mainView]
        self.window!.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
    }
}
