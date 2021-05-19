//
//  GetSeriesClass.swift
//  SeriesFarmatodo
//
//  Created by Oscar Daza on 18/05/21.
//

import Foundation
import  UIKit

func GetSeriesClass(controller:UIViewController, query:String,Ok:@escaping ((SeriesTopObject) -> Void))
{
    let ws = Ws()
    ws.getDictionary(view: controller, Ok: {ObjResponse in
        
        
        let Tetirement = SeriesTopObject(dic: ObjResponse)
        
        
        Ok(Tetirement)
    }, Error: {errer in
        let alert = UIAlertController(title: "Apreciado Cliente", message: errer, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        controller.present(alert, animated: true, completion: nil)
    },
        todoEndpointt: BASEURL + "top/anime/1/upcoming"
    )
    
}
