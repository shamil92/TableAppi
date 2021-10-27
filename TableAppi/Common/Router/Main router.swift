//
//  Main router.swift
//  TableAppi
//
//  Created by Шамиль Каммаев on 11.05.2021.
//

import UIKit

protocol RouterMain {
    var navigationController: UINavigationController? { get set }
    var assemblyBuilder: AssemblyBuilderProtocol? { get set }
}

protocol RouterProtocol: RouterMain {
    
    func dismiss()
    func initialViewController()
    func showDetail(datum:Datum?)
}

final class Router: RouterProtocol {
    
    
    
    var navigationController: UINavigationController?
    var assemblyBuilder: AssemblyBuilderProtocol?
    
    init(navigationController: UINavigationController, assemblyBuilder: AssemblyBuilderProtocol) {
        self.navigationController = navigationController
        self.assemblyBuilder = assemblyBuilder
    }
    
    // MARK: - Dismiss
    
    func dismiss() {
        if let navigationController = navigationController {
            navigationController.popToRootViewController(animated: true)

        }
    }
        
    // MARK: - OpenMainScreen
    
    func initialViewController() {
        if let navigationController = self.navigationController {
            guard let mainVC = assemblyBuilder?.createMainModule(router: self) else { return }
            navigationController.navigationBar.isHidden = true
            navigationController.viewControllers = [mainVC]
        }
    }
  
    // MARK: - OpenSecondScreen

    func showDetail(datum:Datum?) {
        if let navigationController = self.navigationController {
            guard let detailViewController = assemblyBuilder?.createDetailModule(datum: datum, router: self) else { return }
            navigationController.navigationBar.isHidden = true
            navigationController.pushViewController(detailViewController, animated: true)
            
    }
  
}
}




