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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getAllCharcters() { charactersMap in
            print(charactersMap)
        }
    }
    
    fileprivate func getAllCharcters(closure: @escaping ([String: [Character]])-> ()) {
        let group = DispatchGroup()
        var aliveCharacters = [Character]()
        var deadCharacters = [Character]()
        for characterUrl in self.characterUrls! {
             group.enter()
            Communicator.shared.fetchCharacterData(url: URL(string: characterUrl)!) { (result: Result<Character, Communicator.APIServiceError>) in
                switch result {
                case .success(let characterResponse):
                    if(characterResponse.status == "Alive") {
                        aliveCharacters.append(characterResponse)
                    } else {
                        deadCharacters.append(characterResponse)
                    }
                    group.leave()
                case .failure(let error):
                    group.leave()
                    print(error.localizedDescription)
                }
            }
        }
        
        group.notify(queue: .main) {
            aliveCharacters.sort(by: { $0.created.compare($1.created) == .orderedDescending })
            deadCharacters.sort(by: { $0.created.compare($1.created) == .orderedDescending })
            return closure(["alive_characters": aliveCharacters, "dead_characters": deadCharacters])
        }
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
