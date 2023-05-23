//
//  Digimon.swift
//  DigimonList
//
//  Created by Humberto Rodrigues on 22/05/23.
//

import Foundation

struct Digimon: Codable {
    let id: Int
    let name: String
    let xAntibody: Bool
    let images: Image
    let levels: [Level]
    let types: [Types]
}

struct Image: Codable {
    let href: String
    let transparent: Bool
    
}

struct Level: Codable {
    let id: Int
    let level: String
}

struct Types: Codable {
    let id: Int
    let type: String
}
