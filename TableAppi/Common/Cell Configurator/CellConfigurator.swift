//
//  CellConfigurator.swift
//  TableAppi
//
//  Created by Шамиль Каммаев on 21.05.2021.
//
import UIKit


protocol ViewConfigurator {
    
    static var reuseId: String { get }
    
    func configure(cell: UIView)
    func associatedValue<T>() -> T?
}


protocol TableCellConfiguratorProtocol: ViewConfigurator {
    var cellHeight: CGFloat { get }
    var headerHeight: CGFloat { get }
}

protocol CollectionCellConfiguratorProtocol: ViewConfigurator {
    var size: CGSize { get }
}

