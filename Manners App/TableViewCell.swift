//
//  TableViewCell.swift
//  Manners App
//
//  Created by Daniel Corona on 4/14/16.
//  Copyright © 2016 Danny Corona. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var cellCheckImage: UIImageView!
    @IBOutlet weak var cellLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func initCell(manner : Manners)
    {
        self.cellLabel.text = manner.mannerName
        self.cellCheckImage.image = UIImage(named: "checkMark")
    }
    
    func intImg()
    {
        self.cellCheckImage.image = UIImage(named: "checkMark")
    }
}
