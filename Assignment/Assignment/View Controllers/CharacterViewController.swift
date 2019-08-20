//
//  CharacterViewController.swift
//  Assignment
//
//  Created by Saim Zahid on 2019-08-19.
//  Copyright © 2019 Saim Zahid. All rights reserved.
//

import UIKit

class CharacterViewController: UIViewController {
    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var speciesLabel: UILabel!
    
    var character: Character!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    fileprivate func configureView() {
        //These label creations should go into a View Model but for sake for consistency I will keep it like this.
        characterImage.setImage(from: character!.image)
        nameLabel.text = "Name: \(character.name)"
        genderLabel.text = "Gender: \(character.gender)"
        speciesLabel.text = "Species: \(character.species)"
    }
}
