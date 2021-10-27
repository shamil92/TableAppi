//
//  TableCellConfigurator.swift
//  TableAppi
//
//  Created by Шамиль Каммаев on 24.05.2021.
//


import UIKit

struct TableCellConfigurator<CellType: Configurable, Model>: TableCellConfiguratorProtocol where CellType.DataType == Model, CellType: UITableViewCell {

    // MARK: - Properties
    
    static var reuseId: String { return String(describing: CellType.self) }
    
    let item: Model?
    var cellHeight: CGFloat
    var headerHeight: CGFloat
    
    
    // MARK: - Init

    init(item: Model?,
         cellHeight: CGFloat = UITableView.automaticDimension,
         headerHeight: CGFloat = UITableView.automaticDimension) {
    
        self.item = item
        self.cellHeight = cellHeight
        self.headerHeight = headerHeight
    }
    
    
    // MARK: - Public methods
    
    func configure(cell: UIView) {
        guard let item = item else { return }
        (cell as? CellType)?.configure(with: item)
    }
    
    func associatedValue<T>() -> T? {
        return item as? T
    }
}
