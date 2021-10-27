//
//  SecondViewPresenter.swift
//  TableAppi
//
//  Created by Шамиль Каммаев on 14.05.2021.
//

import Foundation



protocol DetailViewProtocol:class {
    func setDatum(datum: Datum?)

}

protocol DetailViewPresenterProtocol:class {
    init(view: DetailViewProtocol, router: RouterProtocol,datum:Datum?, networkService:FirstScreenService)
    func setDatum()
    func dismissSecondView()
}


class DetailPresenter:DetailViewPresenterProtocol {
    
    
    
    weak var view: DetailViewProtocol?
    let router: RouterProtocol?
    let networkService:FirstScreenService!
    var datum: Datum?
    
    required init(view: DetailViewProtocol, router: RouterProtocol,datum:Datum?, networkService:FirstScreenService) {
        self.view = view
        self.router = router
        self.datum = datum
        self.networkService = networkService
    }
    
    public func setDatum() {
        self.view?.setDatum(datum: datum)
    }
    
    
    func dismissSecondView() {
        router?.dismiss()
    }
    
    
    }

