//
//  JokesResponseModel.swift
//  CodeFellowsApp
//
//  Created by David Maybach on 4/23/16.
//  Copyright © 2016 David Maybach. All rights reserved.
//

import UIKit
import ObjectMapper

class JokesResponseModel: Mappable {
    var type: String?
    var value: [JokeModel]?
    
    required init?(_ map: Map){
        
    }
    
    func mapping(map: Map) {
        type <- map["success"]
        value <- map["value"]
    }
}
