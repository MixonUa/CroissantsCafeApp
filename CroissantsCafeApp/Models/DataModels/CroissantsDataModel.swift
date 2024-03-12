//
//  CroissantsDataModel.swift
//  CroissantsCafeApp
//
//  Created by Михаил Фролов on 12.03.2024.
//

import Foundation

struct CroissantsDataModel: Codable {
    let name: String
    let description: String
    let characteristics: Characteristics
}

struct Characteristics: Codable {
    let weight: Int
    let energy: Int
}
