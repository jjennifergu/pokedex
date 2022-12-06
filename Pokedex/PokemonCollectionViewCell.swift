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
    
    func configure(_ str: String?) {
        if let urlstr = str, let url = URL(string: urlstr) {
            pokemonImageView.load(url: url)
            pokemonImageView.contentMode = .scaleAspectFit
        }
    }
    
    override init(frame: CGRect) {
        pokemonImageView = UIImageView(frame: CGRect(origin: frame.origin, size: frame.size))
        super.init(frame: frame)
        
        pokemonImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(pokemonImageView)
        
        NSLayoutConstraint.activate([
            pokemonImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            pokemonImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            pokemonImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            pokemonImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
