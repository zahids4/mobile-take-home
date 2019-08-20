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
    
    var character: Character!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        characterImage.setImage(from: character!.image)
    }
}
