//
//  Sample.swift
//  SwiftUIProject
//
//  Created by wjc on 2022/10/13.
//

import Foundation

#if DEBUG

extension Pokemon {
    static func sample(id: Int) -> Pokemon {
        return FileHelpers.loadBundledJSON(file: "pokemon-\(id)")
    }
}

extension PokemonSpecies {
    static func sample(url: URL) -> PokemonSpecies {
        return FileHelpers.loadBundledJSON(file: "pokemon-species-\(url.extractedID!)")
    }
}

extension Ability {
    static func sample(url: URL) -> Ability {
        sample(id: url.extractedID!)
    }
    
    static func sample(id: Int) -> Ability {
        return FileHelpers.loadBundledJSON(file: "ability-\(id)")
    }
}

extension PokemonViewModel {
    static var all: [PokemonViewModel] = {
        (1...30).map { (id) -> PokemonViewModel in
            let pokemon = Pokemon.sample(id: id)
            let species = PokemonSpecies.sample(url: pokemon.species.url)
            return PokemonViewModel(pokemon: pokemon, species: species)
        }
    }()
    
    static let samples: [PokemonViewModel] = [
        sample(id: 1),
        sample(id: 2),
        sample(id: 3)
    ]
    
    static func sample(id: Int) -> PokemonViewModel {
        let pokemon = Pokemon.sample(id: id)
        let species = PokemonSpecies.sample(url: pokemon.species.url)
        return PokemonViewModel(pokemon: pokemon, species: species)
    }
}

extension AbilityViewModel {
    static func sample(pokemonID: Int) -> [AbilityViewModel] {
        Pokemon.sample(id: pokemonID).abilities.map { (ability) -> AbilityViewModel in
            AbilityViewModel(ability: Ability.sample(url: ability.ability.url))
        }
    }
}
#endif
