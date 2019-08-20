//
//  CharactersTableViewController.swift
//  Assignment
//
//  Created by Saim Zahid on 2019-08-19.
//  Copyright © 2019 Saim Zahid. All rights reserved.
//

import UIKit

class CharactersTableViewController: UITableViewController {
    var characterUrls: [String]!
    var selectedCharacter: Character!
    var aliveCharacters = [Character]()
    var deadCharacters = [Character]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getAllCharacters() { charactersMap in
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    fileprivate func getAllCharacters(closure: @escaping ([String: [Character]])-> ()) {
        let group = DispatchGroup()
        
        for characterUrl in self.characterUrls! {
             group.enter()
            Communicator.shared.fetchCharacterData(url: URL(string: characterUrl)!) { (result: Result<Character, Communicator.APIServiceError>) in
                switch result {
                case .success(let characterResponse):
                    if(characterResponse.status == "Alive") {
                        self.aliveCharacters.append(characterResponse)
                    } else {
                        self.deadCharacters.append(characterResponse)
                    }
                    group.leave()
                case .failure(let error):
                    group.leave()
                    print(error.localizedDescription)
                }
            }
        }
        
        group.notify(queue: .main) {
            self.aliveCharacters.sort(by: { $0.created.compare($1.created) == .orderedDescending })
            self.deadCharacters.sort(by: { $0.created.compare($1.created) == .orderedDescending })
            closure(["alive_characters": self.aliveCharacters, "dead_characters": self.deadCharacters])
        }
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "Alive" : "Dead/Unknown"
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return aliveCharacters.count
        }
        
        return deadCharacters.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "characterCell", for: indexPath)
        if(indexPath.section == 0) {
            cell.textLabel?.text = aliveCharacters[indexPath.row].name
            cell.detailTextLabel?.text = aliveCharacters[indexPath.row].created
        } else {
            cell.textLabel?.text = deadCharacters[indexPath.row].name
            cell.detailTextLabel?.text = deadCharacters[indexPath.row].created
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            self.selectedCharacter = self.aliveCharacters[indexPath.row]
        } else {
            self.selectedCharacter = self.deadCharacters[indexPath.row]
        }
        
        DispatchQueue.main.async {
            tableView.deselectRow(at: indexPath, animated: true)
            self.performSegue(withIdentifier: "showCharacterDetails", sender: self)
        }
    }

    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showCharacterDetails" {
            let vc = segue.destination as! CharacterViewController
            vc.character = selectedCharacter
        }
    }
}
