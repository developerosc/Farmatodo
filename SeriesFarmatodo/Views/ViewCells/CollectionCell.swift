//
//  CollectionCell.swift
//  SeriesFarmatodo
//
//  Created by Oscar Daza on 19/05/21.
//

import Foundation
import Gemini

class CollectionCell: GeminiCell {

    @IBOutlet weak var imgTopTop: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setCell(imageName:String){
        imgTopTop.image = UIImage(named: "search")
    }
    
    override var shadowView: UIView? {
        return imgTopTop
    }

}
