//
//  FirstViewControllerViewModel.swift
//  TableAppi
//
//  Created by Шамиль Каммаев on 20.05.2021.
//

import UIKit.UIView

struct FirstScreenViewModel {
    
    let rows: [Row]
    
    enum Row {
        
        case mainRow(configurator: TableCellConfiguratorProtocol)

        
        var configurator: TableCellConfiguratorProtocol {
            
            switch self {
            
            case let .mainRow(configurator):
                
                return configurator
            }
        }
        
        var reuseId: String {
            return type(of: configurator).reuseId
        }
    }
}
