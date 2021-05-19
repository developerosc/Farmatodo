//
//  TopTableViewCell.swift
//  SeriesFarmatodo
//
//  Created by Oscar Daza on 18/05/21.
//

import UIKit

class TopTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageSerie: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbEpi: UILabel!
    @IBOutlet weak var lbTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageSerie?.layer.cornerRadius = 20
        imageSerie?.clipsToBounds = true
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
