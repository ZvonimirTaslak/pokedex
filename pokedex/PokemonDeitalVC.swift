//
//  PokemonDeitalVC.swift
//  pokedex
//
//  Created by Zvonimir Taslak on 15/05/16.
//  Copyright © 2016 Zvonimir Taslak. All rights reserved.
//

import UIKit

class PokemonDeitalVC: UIViewController {
    
    // MARK: Proporties
    var pokemon: Pokemon
    let segmentedControl = UISegmentedControl(items: ["BIO", "MOVES"])
    let mainStackView = UIStackView()

    /*
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var defenseLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var pokedexIdLbl: UILabel!
    @IBOutlet weak var baseAttackLbl: UILabel!
    @IBOutlet weak var currentEviImg: UIImageView!
    @IBOutlet weak var nextEvoImg: UIImageView!
    @IBOutlet weak var evoLbl: UILabel!
    
    
    
    @IBAction func backButtonPressed(sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }*/
    
    // MARK: View methods
    
    init(pokemon: Pokemon){
        self.pokemon = pokemon
        super.init(nibName: nil, bundle: nil)
        addViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Views
extension PokemonDeitalVC {
    private func addViews() {
        view.backgroundColor = .white
        self.title = pokemon.name.capitalized
        addBioAndMovesSegmentedControl()
        addMainVerticalStackView()
        addDetailsStackView()
    }
    
    private func addBioAndMovesSegmentedControl() {
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.layer.cornerRadius = 5.0
        segmentedControl.layer.borderColor = UIColor.red.cgColor
        segmentedControl.layer.borderWidth = 0.5
        segmentedControl.tintColor = .red
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        // Add target action method
        //segmentedControl(self, action: "changeColor:", forControlEvents: .ValueChanged)
        self.view.addSubview(segmentedControl)
        
        segmentedControl.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor, constant: 16).isActive = true
        segmentedControl.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16).isActive = true
        segmentedControl.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16).isActive = true
        segmentedControl.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    private func addMainVerticalStackView() {
        mainStackView.axis = .vertical
        mainStackView.alignment = .fill
        mainStackView.distribution = .fillProportionally
        mainStackView.spacing = 10
        //mainStackView.autoresizesSubviews = true
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(mainStackView)
        mainStackView.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 10).isActive = true
        mainStackView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: segmentedControl.trailingAnchor).isActive = true
        //mainStackView.bottomAnchor.constraint(equalTo: self.view.layoutMarginsGuide.bottomAnchor, constant: -16).isActive = true
    }
    
    private func addDetailsStackView(){
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        stackView.spacing = 10
        //stackView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        mainStackView.addArrangedSubview(stackView)
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "\(pokemon.pokemonId)")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(imageView)
        
        
       // imageView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        //imageView.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        let details = UILabel()
        details.font = UIFont.systemFont(ofSize: 15)
        details.numberOfLines = 12
        details.sizeToFit()
        details.text = "Bonnie is a Pokémon trainer-to-be and Clemont's 7-year-old sister. She is more mature than Clemont and always tries to stop his bizarre behavior. Due to being underage, her Pokémon nominally belong to Clemont for now. She, along with her brother, continues Brock's running gag, only she asks pretty girls."
        stackView.addArrangedSubview(details)
    }
}
