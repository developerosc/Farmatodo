//
//  SpinnerController.swift
//  SeriesFarmatodo
//
//  Created by Oscar Daza on 18/05/21.
//

import UIKit

class SpinnerController: UIViewController {

    
    @IBOutlet weak var vBack: UIView!
    @IBOutlet weak var sppCargando: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sppCargando.startAnimating()
        vBack.layer.cornerRadius = 5.0
        
    }
    
    func hideSpinner()
    {
        self.dismiss(animated: true, completion: nil)
    }
    
    func hideSpinnerCompletion(Ok :@escaping (() -> Void))
    {
        self.dismiss(animated: true, completion:
            {
                Ok()
        })
    }

}
