//
//  Detail.swift
//  SeriesFarmatodo
//
//  Created by Oscar Daza on 19/05/21.
//

import Foundation

import UIKit

class Detail: UIViewController {
    
    @IBOutlet weak var imgDetail: UIImageView!
    @IBOutlet weak var lbTitleDetail: UILabel!
    @IBOutlet weak var lbActionDetail: UILabel!
    @IBOutlet weak var lbEpiDetail: UILabel!
    @IBOutlet weak var lbSynopDetail: UITextView!
    
    var dataDetailTop:SingleAnimeObject?
    var dataDetailSesion:SingleLastObject?
    var urlGo = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let topDetailData = dataDetailTop {
            self.lbTitleDetail.text = topDetailData.title
            let url = URL(string: topDetailData.image_url)
            let data = try? Data(contentsOf: url!) //make sure your
            self.imgDetail.image = UIImage(data: data!)
            self.lbActionDetail.text = topDetailData.type
            self.lbEpiDetail.text = topDetailData.start_date
            self.urlGo = topDetailData.url
        }
        
        if let sesionDetailData = dataDetailSesion {
            self.lbTitleDetail.text = sesionDetailData.title
            let url = URL(string: sesionDetailData.image_url)
            let data = try? Data(contentsOf: url!) //make sure your
            self.imgDetail.image = UIImage(data: data!)
            self.lbActionDetail.text = sesionDetailData.type
            self.lbEpiDetail.text = sesionDetailData.start_date
            self.lbSynopDetail.text = sesionDetailData.synopsis
            self.urlGo = sesionDetailData.url
        }
        
    }
    
    @IBAction func goWatch(_ sender: UIButton) {
        guard let url = URL(string: self.urlGo) else { return }
        UIApplication.shared.open(url)
    }
}

