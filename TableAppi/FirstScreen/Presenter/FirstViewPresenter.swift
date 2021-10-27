//
//  MainViewPresenter.swift
//  TableAppi
//
//  Created by Шамиль Каммаев on 14.05.2021.
//


import Foundation


protocol FirstViewPresenterProtocol {
    init(view: FirstViewProtocol, router: RouterProtocol,networkService:FirstScreenService,dataProvider:FirstViewDataProviderInput)
    func getDatums()
    var datums: WelcomeElement? { get set}
    func tapOnTheComment(datum:Datum?)
}


class FirstViewPresenter: FirstViewPresenterProtocol {
   
    
    // MARK: - Properties
    
    weak var view: FirstViewProtocol?
    let router: RouterProtocol?
    private let networkService:FirstScreenService?
    private let dataProvider: FirstViewDataProviderInput
    var datums: WelcomeElement?

    
    // MARK: - Init

    required init(view: FirstViewProtocol, router: RouterProtocol,networkService:FirstScreenService,dataProvider:FirstViewDataProviderInput) {
        self.view = view
        self.router = router
        self.networkService = networkService
        self.dataProvider = dataProvider
    }
    
    func tapOnTheComment(datum: Datum?) {
        router?.showDetail(datum:datum)
    }
    
    
    // MARK: - Public funcs

    func getDatums() {
        networkService?.getComments { [weak self] result  in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let datum):
                    self.datums = datum
                    self.updateView()
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            }
        }
    }
    
    private func updateView() {
        guard let datumNew = self.datums?.data else { return }
        let viewModel = dataProvider.createViewModel(data: datumNew)
        view?.updateView(viewModel: viewModel)
}
}
