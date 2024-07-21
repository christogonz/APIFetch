//
//  CountryModel.swift
//  ApiFetch
//
//  Created by Christopher Gonzalez on 2024-07-21.
//

import Foundation


struct CountryModel: Identifiable, Decodable {
    let id: Int
    let name: String
    let population: Int
    let density: Double
    let capital:  String
    let currency: String
    let flag: String
}
