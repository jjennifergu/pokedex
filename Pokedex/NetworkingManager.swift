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
    
    static func getPokemons(limit: Int, offset: Int, completion: @escaping ([Pokemon]) -> Void) {
        let endpt = "\(host)?limit=\(String(limit))&offset=\(String(offset))/"
        
        AF.request(endpt, method: .get).validate().responseData { response in
            switch response.result {
                
            case .success(let data):
                let jd = JSONDecoder()
                if let response = try? jd.decode(PokemonResponse.self, from: data) {
                    completion(response.results)
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func getSpriteByUrl(url: String, completion: @escaping (String) -> Void) {
        AF.request(url, method: .get).validate().responseData { response in
            switch response.result {
                
            case .success(let data):
                let jd = JSONDecoder()
                if let response = try? jd.decode(Json4Swift_Base.self, from: data) {
                    if let sprites = response.sprites, let imageUrl = sprites.front_default {
                        completion(imageUrl)
                    }
                }
                else {
                    print("failed to decode")
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
