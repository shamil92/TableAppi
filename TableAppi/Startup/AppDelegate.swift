//
//  AppDelegate.swift
//  TableAppi
//
//  Created by Шамиль Каммаев on 06.05.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    // MARK: - SET UIWindow
    
    setupWindow()
   
    return true
  }
  
  private func setupWindow() {
    window = UIWindow(frame: UIScreen.main.bounds)
    
    let navigationController = UINavigationController()
    let assemblyBuilder = AssemblyModuleBuilder()
    let router = Router(navigationController: navigationController, assemblyBuilder: assemblyBuilder)
    router.initialViewController()
    window?.rootViewController = navigationController
    window?.makeKeyAndVisible()
  }
}
