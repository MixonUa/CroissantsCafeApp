//
//  MenuCellViewModel.swift
//  CroissantsCafeApp
//
//  Created by Михаил Фролов on 13.03.2024.
//

import Foundation

struct MenuCellViewModel {
    let croissant: CroissantsDataModel
    var collapsed: Bool
    let pressHandler: (CroissantsDataModel) -> Void
}
