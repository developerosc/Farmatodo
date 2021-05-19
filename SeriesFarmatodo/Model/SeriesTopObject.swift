//
//  SeriesTopObject.swift
//  SeriesFarmatodo
//
//  Created by Oscar Daza on 18/05/21.
//

import Foundation
import UIKit

class SeriesTopObject: NSObject {
    
    var request_hash = ""
    var results = [SingleAnimeObject]()
    var request_cached = false
    var request_cache_expiry = 0
    
    
    
    init (dic:NSDictionary)
    {
        request_hash = ValueJsonString(dic: dic, key: "request_hash")
        request_cached = ValueJsonBool(dic: dic, key: "request_cached")
        request_cache_expiry = ValueJsonInt(dic: dic, key: "request_cache_expiry")

        if let arrayresults = ValueJsonArray(dic: dic, key: "top"){
            
            for resultsdic in arrayresults{
                
                if let dicresults = resultsdic as? NSDictionary{
                    
                    results.append(SingleAnimeObject(dic : dicresults))
                }
                
                
            }
            
        }
        
    }
    
}
