//
//  SingleLastObject.swift
//  SeriesFarmatodo
//
//  Created by Oscar Daza on 19/05/21.
//

import Foundation

class SingleLastObject: NSObject {
    
    var mal_id = ""
    var url = ""
    var title = ""
    var image_url = ""
    var synopsis = ""
    var type = ""
    var rank = 0
    var episodes = 0
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
        synopsis = ValueJsonString(dic: dic, key: "synopsis")
        type = ValueJsonString(dic: dic, key: "type")
        episodes = ValueJsonInt(dic: dic, key: "episodes")
        start_date = ValueJsonString(dic: dic, key: "start_date")
        end_date = ValueJsonString(dic: dic, key: "end_date")
        members = ValueJsonInt(dic: dic, key: "members")
        score = ValueJsonDouble(dic: dic, key: "score")
    }
    
}
