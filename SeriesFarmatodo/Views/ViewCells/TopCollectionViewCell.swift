//
//  TopCollectionViewCell.swift
//  SeriesFarmatodo
//
//  Created by Oscar Daza on 18/05/21.
//
import Gemini
import UIKit

class TopCollectionViewCell: GeminiCell {

    @IBOutlet weak var topImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        topImage?.layer.cornerRadius = 35
        topImage?.clipsToBounds = true
    }
    
    func setCell(imageName:String){
        topImage.image = UIImage(named: "search")
    }
    

}
