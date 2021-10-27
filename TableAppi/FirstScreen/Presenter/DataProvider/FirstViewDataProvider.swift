//
//  FirstViewDataProvider.swift
//  TableAppi
//
//  Created by Шамиль Каммаев on 24.05.2021.
//


import Foundation

protocol FirstViewDataProviderInput {
    func createViewModel(data: [Datum]) -> FirstScreenViewModel
}

final class FirstViewDataProvider: FirstViewDataProviderInput {
    
    // MARK: - Typealiases
    
    typealias mainRowCellConfigurator = TableCellConfigurator<UserCell, UserCell.DataType>
    
    
    // MARK: - PartnerCardDataProviderInput
    
    func createViewModel(data: [Datum]) -> FirstScreenViewModel {
        
        var rows: [FirstScreenViewModel.Row] = []
        
        data.forEach { (Datum) in
            rows.append(.mainRow(configurator: mainRowCellConfigurator(item: UserCell.DataType(datums: Datum))))
        }
        
        
        return FirstScreenViewModel(rows: rows)
    }
}
