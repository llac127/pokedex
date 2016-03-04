//
//  PokemonDetailVC.swift
//  Pokedex
//
//  Created by Long Lac on 3/4/16.
//  Copyright © 2016 Long Lac. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {
    
    
    @IBOutlet weak var nameLbl: UILabel!
    var pokemon: Pokemon!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLbl.text = pokemon.name
    }
    

}
