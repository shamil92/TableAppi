//
//  UITableView.swift
//  TableAppi
//
//  Created by Шамиль Каммаев on 26.05.2021.
//

import UIKit

extension UITableView {
    
    func register(cellTypes: [UITableViewCell.Type]) {
        
        cellTypes.forEach {
            let reuseIdentifier = $0.className
            register($0, forCellReuseIdentifier: reuseIdentifier)
        }
    }
}
