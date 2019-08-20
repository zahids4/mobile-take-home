//
//  EpisodesTableViewController.swift
//  Assignment
//
//  Created by Saim Zahid on 2019-08-19.
//  Copyright © 2019 Saim Zahid. All rights reserved.
//

import UIKit

class EpisodesTableViewController: UITableViewController {
    var characterUrls: [String]!
    var episodes = [Episode]() {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchAndSetEpisodes()
    }
    
    fileprivate func fetchAndSetEpisodes() {
        Communicator.shared.fetchEpisodes() { (result: Result<EpisodesResponse, Communicator.APIServiceError>) in
            switch result {
            case .success(let episodesResponse):
                self.episodes = episodesResponse.results
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "episodeCell", for: indexPath) as! EpisodeTableViewCell

        cell.configureWith(episodes[indexPath.row])

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        DispatchQueue.main.async {
            self.characterUrls = self.episodes[indexPath.row].characters
            tableView.deselectRow(at: indexPath, animated: true)
            self.performSegue(withIdentifier: "showCharactersList", sender: self)
        }  
    }

    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showCharactersList" {
            let vc = segue.destination as! CharactersTableViewController
            vc.characterUrls = characterUrls
        }
    }
}
