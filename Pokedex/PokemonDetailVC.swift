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
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var defenseLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var pokeidLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var baseAttkLbl: UILabel!
    @IBOutlet weak var evoLbl: UILabel!
    @IBOutlet weak var nextEvoLbl: UIImageView!
    @IBOutlet weak var currentEvoImg: UIImageView!
    
    
    var pokemon: Pokemon!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let img = UIImage(named: "\(pokemon.pokedexId)")
        mainImg.image = img
        currentEvoImg.image = img
        
        nameLbl.text = pokemon.name.capitalizedString
        
        pokemon.downloadPokemonDetails { () -> () in
            //This will be called after downloading is done
            
        self.updateUI()
            
        }
    }
    
    func updateUI()
    {
        descriptionLbl.text = pokemon.description
        typeLbl.text = pokemon.type
        defenseLbl.text = pokemon.defense
        heightLbl.text = pokemon.height
        pokeidLbl.text = "\(pokemon.pokedexId)"
        weightLbl.text = pokemon.weight
        baseAttkLbl.text = pokemon.attack
        
        if pokemon.nextEvolutionId == ""
        {
            evoLbl.text = "No Evolutions"
            nextEvoLbl.hidden = true
        }
        else
        {
            nextEvoLbl.hidden = false
            nextEvoLbl.image = UIImage(named: pokemon.nextEvolutionId)
            //print("Next evo Name: \(pokemon.nextEvolutionTxt)")
            var str = "Next Evolution: \(pokemon.nextEvolutionTxt)"
            
            if pokemon.nextEvolutionId != ""
            {
                str += " - LVL \(pokemon.nextEvolutionLvl)"
                evoLbl.text = str
                print("Updating Evo Character: \(pokemon.nextEvolutionTxt)")
            }
        }
        print("Next evo level Image: \(pokemon.nextEvolutionLvl)")
        nextEvoLbl.image = UIImage(named: pokemon.nextEvolutionId)
        
    }
    @IBAction func backBtnPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

}
