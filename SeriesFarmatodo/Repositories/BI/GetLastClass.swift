//
//  GetLastClass.swift
//  SeriesFarmatodo
//
//  Created by Oscar Daza on 19/05/21.
//

import Foundation
import UIKit

func GetLastClass(controller:UIViewController, query:String,Ok:@escaping ((SesionLastObject) -> Void))
{
    let ws = Ws()
    ws.getDictionary(view: controller, Ok: {ObjResponse in
        
        
        let Tetirement = SesionLastObject(dic: ObjResponse)
        
        
        Ok(Tetirement)
    }, Error: {errer in
        let alert = UIAlertController(title: "Apreciado Cliente", message: errer, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        controller.present(alert, animated: true, completion: nil)
    },
        todoEndpointt: BASEURL + "schedule/monday"
    )
    
}
