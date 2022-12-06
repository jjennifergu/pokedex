//
//  Pokemon.swift
//  Pokedex
//
//  Created by Jennifer Gu on 12/4/22.
//

import Foundation

struct Pokemon: Codable, Equatable {
    let name: String
    let url: String
}

struct PokemonResponse: Codable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [Pokemon]
}
