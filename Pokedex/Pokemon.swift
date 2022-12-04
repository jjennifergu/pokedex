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

struct PokemonDetails: Codable {
    let id: Int
    let name: String
    let base_experience: Int
    let height: Int
    let is_default: Bool
    let order: Int
    let weight: Int
    let abilities: [Ability]
    let forms: [Form]
    let game_indices: [GameIndices]
    let held_items: [Item]
    let location_area_encounters: String
    let moves: [Move]
    let past_types: [PastType]
    let sprites: Sprites
    let species: Species
    let stats: [Stat]
    let types: [PokeType]
}

struct AbilityResponse: Codable {
    let name: String
    let url: String
}

struct Ability: Codable {
    let is_hidden: Bool
    let slot: Int
    let ability: [Ability]
}

struct Form: Codable {
    let name: String
    let url: String
}

struct GameIndices: Codable {
    let game_index: Int
    let version: Version
}

struct Version: Codable {
    let name: String
    let url: String
}

struct Item: Codable {
    let name: String
    let url: String
}

struct MoveResponse: Codable {
    let name: String
    let url: String
}

struct Move: Codable {
    let move: [MoveResponse]
    let version_group_details: [VersionGroupDetails]
}

struct VersionGroup: Codable {
    let name: String
    let url: String
}

struct MoveLearnedMethod: Codable {
    let name: String
    let url: String
}

struct VersionGroupDetails: Codable {
    let level_learned_at: Int
    let version_group: VersionGroup
    let move_learn_method: MoveLearnedMethod
}

struct PokeType: Codable {
    let slot: Int
    let type: TypeResponse
}

struct TypeResponse: Codable {
    let name: String
    let url: String
}

struct Generation: Codable {
    let name: String
    let url: String
}

struct PastType: Codable {
    let generation: Generation
    let types: [PokeType]
}

struct Species: Codable {
    let name: String
    let url: String
}

struct StatResponse: Codable {
    let name: String
    let url: String
}

struct Stat: Codable {
    let base_stat: Int
    let effort: Int
    let stat: StatResponse
}

struct Sprites: Codable {
    let back_default: String
    let back_female: String?
    let back_shiny: String?
    let back_shiny_female: String?
    let front_default: String
    let front_female: String?
    let front_shiny: String?
    let front_shiny_female: String?
    let other: Other
    let versions: Versions
}

struct Other: Codable {
    let dream_world: DreamWorld
    let home: Home
    let artwork: Artwork
    
    enum CodingKeys: String, CodingKey {
        case dream_world
        case home
        case artwork = "official-artwork"
    }
    
}

struct DreamWorld: Codable {
    let front_default: String
    let front_female: String?
}

struct Home: Codable {
    let front_default: String
    let front_female: String?
    let front_shiny: String?
    let front_shiny_female: String?
}

struct Artwork: Codable {
    let front_default: String
}

struct Versions: Codable {
    let gi: GI
    let gii: GII
    let giii: GIII
    let giv: GIV
    let gv: GV
    let gvi: GVI
    let gvii: GVII
    let gviii: GVIII
    
    enum CodingKeys: String, CodingKey {
        case gi = "generation-i"
        case gii = "generation-ii"
        case giii = "generation-iii"
        case giv = "generation-iv"
        case gv = "generation-v"
        case gvi = "generation-vi"
        case gvii = "generation-vii"
        case gviii = "generation-viii"
    }
}

struct C1: Codable {
    let back_default: String
    let back_gray: String
    let front_default: String
    let front_gray: String
}

struct GI: Codable {
    let redblue: C1
    let yellow: C1
    
    enum CodingKeys: String, CodingKey {
        case redblue = "red-blue"
        case yellow
    }
}

struct C2: Codable {
    let back_default: String
    let back_shiny: String
    let front_default: String
    let front_shiny: String
}

struct GII: Codable {
    let crystal: C2
    let gold: C2
    let silver: C2
}

struct C3: Codable {
    let front_default: String
    let front_shiny: String
}

struct GIII: Codable {
    let emerald: C3
    let firered: C2
    let ruby: C2
    
    enum CodingKeys: String, CodingKey {
        case emerald
        case firered = "firered-leafgreen"
        case ruby = "ruby-sapphire"
    }
}

struct C4: Codable {
    let back_default: String
    let back_female: String?
    let back_shiny: String?
    let back_shiny_female: String?
    let front_default: String
    let front_female: String?
    let front_shiny: String?
    let front_shiny_female: String?
}

struct GIV: Codable {
    let diamond: C4
    let gold: C4
    let platnium: C4
    
    enum CodingKeys: String, CodingKey {
        case diamond = "diamond-peral"
        case gold = "heartgold-soulsilver"
        case platnium
    }
}

struct BW: Codable {
    let animated: C4
    let back_default: String
    let back_female: String?
    let back_shiny: String?
    let back_shiny_female: String?
    let front_default: String
    let front_female: String?
    let front_shiny: String?
    let front_shiny_female: String?
}

struct GV: Codable {
    let bw: BW
    
    enum CodingKeys: String, CodingKey {
        case bw = "black-white"
    }
}

struct C6: Codable {
    let front_default: String
    let front_female: String?
    let front_shiny: String?
    let front_shiny_female: String?
}

struct GVI: Codable {
    let omega: C6
    let xy: C6
    
    enum CodingKeys: String, CodingKey {
        case omega = "omegaruby-alphasapphire"
        case xy = "x-y"
    }
}

struct C7: Codable {
    let front_default: String
    let front_female: String?
}

struct GVII: Codable {
    let icons: C7
    let ultra: C6
    
    enum CodingKeys: String, CodingKey {
        case icons
        case ultra = "ultra-sun-ultra-moon"
    }
}

struct GVIII: Codable {
    let icons: C7
}
