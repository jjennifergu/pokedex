//
//  PokemonCollectionViewCell.swift
//  Pokedex
//
//  Created by Jennifer Gu on 12/4/22.
//

import Foundation
import UIKit

class PokemonCollectionViewCell: UICollectionViewCell {
    let pokemonImageView: UIImageView
    
    func configure(with str: String?) {
        if let urlstr = str, let url = URL(string: urlstr) {
            pokemonImageView.load(from: url)
            pokemonImageView.contentMode = .scaleAspectFit
        }
    }
    
    override init(frame: CGRect) {
        pokemonImageView = UIImageView(frame: frame)
        super.init(frame: frame)
        
        pokemonImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(pokemonImageView)
        
        NSLayoutConstraint.activate([
            pokemonImageView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
            pokemonImageView.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor),
            pokemonImageView.leftAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leftAnchor),
            pokemonImageView.rightAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.rightAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UIImageView {
   func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
      URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
   }
    
   func load(from url: URL) {
      getData(from: url) {
         data, response, error in
         guard let data = data, error == nil else {
            return
         }
         DispatchQueue.main.async() {
            self.image = UIImage(data: data)
         }
      }
   }
}
