//
//  AssemblyModuleBuilder.swift
//  TableAppi
//
//  Created by Шамиль Каммаев on 11.05.2021.
//

import UIKit

protocol AssemblyBuilderProtocol {
  

    func createMainModule(router:RouterProtocol) -> UIViewController
    func createDetailModule(datum: Datum?, router: RouterProtocol) -> UIViewController
}

final class AssemblyModuleBuilder: AssemblyBuilderProtocol {
    
    
    func createDetailModule(datum: Datum?, router: RouterProtocol) -> UIViewController {
        let mainView = SecondScreenViewController()
        let networkService = FirstScreenServiceImp(networkService: NetworkService<FirstScreenEndpoint>())
        let presenter = DetailPresenter(view: mainView, router: router,datum:datum, networkService:networkService)
        
        mainView.presenter = presenter
        
        return mainView
    }

      func createMainModule(router:RouterProtocol) -> UIViewController {
    let mainView = FirstScreenViewController()
    let mainViewService = FirstScreenServiceImp(networkService: NetworkService<FirstScreenEndpoint>())
        let presenter = FirstViewPresenter(view: mainView, router: router, networkService: mainViewService, dataProvider: FirstViewDataProvider())
    mainView.presenter = presenter
    return mainView
  }

    

}
