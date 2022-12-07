//
//  NetworkingManager.swift
//  Pokedex
//
//  Created by Jennifer Gu on 12/2/22.
//

import Foundation
import Alamofire

class NetworkManager {
    
    static let host = "https://pokeapi.co/api/v2/pokemon"
    
    static func getPokemons(completion: @escaping ([Pokemon]) -> Void) {

        let endpt = "\(host)?limit=1154/"
        
        AF.request(endpt, method: .get).validate().responseData { response in
            switch response.result {
                
            case .success(let data):
                let jd = JSONDecoder()
                if let response = try? jd.decode(PokemonResponse.self, from: data){
                    completion(response.results ?? [])
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func getImagesByUrl(pokemons: [Pokemon], completion: @escaping ([String]) -> Void) {
        var result: [String] = []
        for pokemon in pokemons {
            if let imageUrl = pokemon.url {
                AF.request(imageUrl, method: .get).validate().responseData { response in
                    switch response.result {
                        
                    case .success(let data):
                        let jd = JSONDecoder()
                        if let response = try? jd.decode(Json4Swift_Base.self, from: data) {
                            if let sprites = response.sprites, let imageUrl = sprites.front_default {
                                result.append(imageUrl)
                            }
                        }
                        completion(result)
                        
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
            }
        }
    }
}
