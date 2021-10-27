//
//  Alert Action.swift
//  TableAppi
//
//  Created by Шамиль Каммаев on 11.05.2021.
//


import UIKit

struct AlertAction {
    let title: String
    let style: UIAlertAction.Style
    let action: (() -> Void)?
}
