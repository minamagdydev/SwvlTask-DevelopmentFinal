//
//  MovieCell.swift
//  SwvlTask
//
//  Created by minamagdy  on 6/2/19.
//  Copyright © 2019 minamagdy. All rights reserved.
//

import UIKit
import Cosmos
class MovieCell: UITableViewCell {
    @IBOutlet weak var cosmosView: CosmosView!
    @IBOutlet weak var year: UILabel!
    
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var movieTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
