//
//  FirstScrenService.swift
//  TableAppi
//
//  Created by Шамиль Каммаев on 31.05.2021.
//

import Foundation

protocol FirstScreenService {
    func getComments(completion: @escaping(Result<WelcomeElement>) -> Void)
}

final class FirstScreenServiceImp: FirstScreenService {
    
    let networkService: NetworkService<FirstScreenEndpoint>
    
    init(networkService: NetworkService<FirstScreenEndpoint>) {
        self.networkService = networkService
    }
    
    
    func getComments(completion: @escaping (Result<WelcomeElement>) -> Void) {
        let endpoint = FirstScreenEndpoint.getComments
        networkService.request(endpoint: endpoint, completion: completion)
    }
    

}
