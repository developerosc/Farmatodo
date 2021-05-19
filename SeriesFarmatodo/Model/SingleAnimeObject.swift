//
//  SingleAnimeObject.swift
//  SeriesFarmatodo
//
//  Created by Oscar Daza on 18/05/21.
//

import Foundation
import UIKit

class SingleAnimeObject: NSObject {
    
    var id = 0
    var name = ""
    var mal_id = ""
    var rank = 0
    var title = ""
    var url = ""
    var image_url = ""
    var type = ""
    var episodes = ""
    var start_date = ""
    var end_date = ""
    var members = 0
    var score = 0.0
    
    
    
    init (dic:NSDictionary)
    {
        mal_id = ValueJsonString(dic: dic, key: "mal_id")
        rank = ValueJsonInt(dic: dic, key: "rank")
        title = ValueJsonString(dic: dic, key: "title")
        url = ValueJsonString(dic: dic, key: "url")
        image_url = ValueJsonString(dic: dic, key: "image_url")
        type = ValueJsonString(dic: dic, key: "type")
        episodes = ValueJsonString(dic: dic, key: "episodes")
        start_date = ValueJsonString(dic: dic, key: "start_date")
        end_date = ValueJsonString(dic: dic, key: "end_date")
        members = ValueJsonInt(dic: dic, key: "members")
        score = ValueJsonDouble(dic: dic, key: "score")
    }
    
}
