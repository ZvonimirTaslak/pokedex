//
//  Pokemon.swift
//  pokedex
//
//  Created by Zvonimir Taslak on 14/05/16.
//  Copyright © 2016 Zvonimir Taslak. All rights reserved.
//

import Foundation

class Pokemon {
    private var _name: String!
    private var _pokedexId: Int!
    private var _description: String!
    private var _type: String!
    private var _defense: String!
    private var _height: String!
    private var _weight: String!
    private var _attack: String!
    private var _nextEvolutionTxt: String!
    
    var name: String{
        return _name
    }
    
    var pokemonId: Int {
        return _pokedexId
    }
    
    init( name: String, pokedexId: Int){
        self._name = name
        self._pokedexId = pokedexId
    }
    
}