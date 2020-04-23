//
//  SongCell.swift
//  NewAPolithea
//
//  Created by Fabian Cooper on 4/15/20.
//  Copyright © 2020 Fabian Cooper. All rights reserved.
//

import UIKit

class SongCell: UITableViewCell {
    
    @IBOutlet weak var cellSongImage: UIImageView!
    @IBOutlet weak var cellSongName: UILabel!
    @IBOutlet weak var cellSongDuration: UILabel!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    

}
