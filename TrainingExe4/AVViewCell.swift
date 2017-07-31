//
//  AVViewCell.swift
//  TrainingExe4
//
//  Created by ios developer on 7/28/17.
//  Copyright © 2017 leeboy. All rights reserved.
//

import UIKit

class AVViewCell: UITableViewCell {

    @IBOutlet weak var avImage: UIImageView!
    @IBOutlet weak var captureDate: UILabel!
    @IBOutlet weak var avValue: UILabel!
    @IBOutlet weak var loviValue: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func commonInit(imageName: String, captureString: String, avString: String, loviString: String) {
        avImage.image = UIImage(named: imageName)
        captureDate.text = captureString
        avValue.text = avString
        loviValue.text = loviString
    }
}
