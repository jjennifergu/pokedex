//
//  ViewController.swift
//  Pokedex
//
//  Created by Jennifer Gu on 12/2/22.
//

import UIKit

class ViewController: UIViewController {
    
    var displayScreenView = UIImageView()
    var pokemonCollectionView: UICollectionView!
    let pokemonCellReuseIdentifier = "pokemonCellReuseIdentifier"
    
    var pokemonData: [Pokemon] = []
    var pokemonImageUrls: [String] = []
    var selectedPokemonImageUrl: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        getPokemons(limit: 1, offset: 0)
        setUpUIComponents()
        setUpConstraints()
    }
    
    func getPokemons(limit: Int, offset: Int) {
        NetworkManager.getPokemons(limit: limit, offset: offset, completion: { pokemon in
            self.pokemonData = pokemon
            for p in pokemon {
                self.getPokemonImage(pokemon: p)
            }
            print(self.pokemonData)
            self.pokemonCollectionView.reloadData()
        })
    }
    
    func getPokemonImage(pokemon: Pokemon) {
        NetworkManager.getSpriteByUrl(url: pokemon.url, completion: { url in
            self.pokemonImageUrls.append(url)
        })
    }
    
    func setUpUIComponents() {
        view.backgroundColor = .white
        
        displayScreenView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(displayScreenView)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        pokemonCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        pokemonCollectionView.backgroundColor = .clear
        pokemonCollectionView.translatesAutoresizingMaskIntoConstraints = false
        pokemonCollectionView.showsVerticalScrollIndicator = false
        pokemonCollectionView.alwaysBounceVertical = true
        pokemonCollectionView.delegate = self
        pokemonCollectionView.dataSource = self
        pokemonCollectionView.register(PokemonCollectionViewCell.self, forCellWithReuseIdentifier: pokemonCellReuseIdentifier)
        view.addSubview(pokemonCollectionView)
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            displayScreenView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            displayScreenView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            displayScreenView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            displayScreenView.heightAnchor.constraint(equalToConstant: 300)
        ])
        
        NSLayoutConstraint.activate([
            pokemonCollectionView.topAnchor.constraint(equalTo: displayScreenView.bottomAnchor),
            pokemonCollectionView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            pokemonCollectionView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            pokemonCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectedPokemonImageUrl = pokemonImageUrls[indexPath.item]
        if let str = self.selectedPokemonImageUrl, let url = URL(string: str) {
            self.displayScreenView.load(url: url)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = pokemonCollectionView.frame.width/3
        return CGSize(width: size, height: size)
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemonImageUrls.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = pokemonCollectionView.dequeueReusableCell(withReuseIdentifier: pokemonCellReuseIdentifier, for: indexPath) as! PokemonCollectionViewCell
        cell.configure(pokemonImageUrls[indexPath.item])
        return cell
    }
}
