//
//  EpisodeTableViewCell.swift
//  Assignment
//
//  Created by Saim Zahid on 2019-08-19.
//  Copyright © 2019 Saim Zahid. All rights reserved.
//

import UIKit

class EpisodeTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var airDateLabel: UILabel!
    @IBOutlet weak var seasonEpisodeLabel: UILabel!

    func configureWith(_ episode: Episode) {
        seasonEpisodeLabel.text = episode.episode
        nameLabel.text = episode.name
        airDateLabel.text = episode.airDate
    }
}
