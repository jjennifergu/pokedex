//
//  ViewController.swift
//  Pokedex
//
//  Created by Jennifer Gu on 12/2/22.
//

import UIKit

class ViewController: UIViewController {
    
    var displayScreenView = UIImageView()
    let overlay = UIImageView(image: UIImage(named: "pokedexOverlay"))
    var pokemonCollectionView: UICollectionView!
    let pokemonCellReuseIdentifier = "pokemonCellReuseIdentifier"
    
    var pokemonData: [Pokemon] = []
    var pokemonImageUrls: [String] = []
    var selectedPokemonImageUrl: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Pokédex"
        getPokemons(completion: {
            self.getPokemonImages(pokemons: self.pokemonData, completion: {
                self.pokemonCollectionView.reloadData()
            })
        })
        setUpUIComponents()
        setUpConstraints()
    }
    
    func getPokemons(completion: @escaping () -> Void) {
        NetworkManager.getPokemons(completion: { response in
            self.pokemonData = response
            completion()
        })
    }
    
    func getPokemonImages(pokemons: [Pokemon], completion: @escaping () -> Void) {
        NetworkManager.getImagesByUrl(pokemons: pokemons, completion: { response in
            self.pokemonImageUrls = response
            completion()
        })
    }
    
    func setUpUIComponents() {
        view.backgroundColor = .white
        
        displayScreenView.translatesAutoresizingMaskIntoConstraints = false
        displayScreenView.backgroundColor = .black
        displayScreenView.contentMode = .scaleAspectFit
        view.addSubview(displayScreenView)
        
        overlay.translatesAutoresizingMaskIntoConstraints = false
        overlay.backgroundColor = .clear
        overlay.contentMode = .scaleAspectFit
        view.addSubview(overlay)
        
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
            displayScreenView.heightAnchor.constraint(equalToConstant: 250)
        ])
        
        NSLayoutConstraint.activate([
            overlay.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: -16),
            overlay.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            overlay.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            overlay.heightAnchor.constraint(equalToConstant: 300)
        ])
        
        NSLayoutConstraint.activate([
            pokemonCollectionView.topAnchor.constraint(equalTo: displayScreenView.bottomAnchor, constant: 16),
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
            self.displayScreenView.load(from: url)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = pokemonCollectionView.frame.width/3 - 8
        return CGSize(width: size, height: size)
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemonImageUrls.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = pokemonCollectionView.dequeueReusableCell(withReuseIdentifier: pokemonCellReuseIdentifier, for: indexPath) as! PokemonCollectionViewCell
        cell.configure(with: pokemonImageUrls[indexPath.item])
        return cell
    }
}
