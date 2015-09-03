//
//  RepoCell.swift
//  GithubDemo
//
//  Created by Victor Zhang on 9/2/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

import UIKit

class RepoCell: UITableViewCell {

    @IBOutlet weak var starLabel: UILabel!
    
    @IBOutlet weak var repoLabel: UILabel!
    @IBOutlet weak var forkLabel: UILabel!
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    override func awakeFromNib() {
        descriptionLabel.preferredMaxLayoutWidth = descriptionLabel.frame.size.width

    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
