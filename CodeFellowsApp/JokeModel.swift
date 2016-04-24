//
//  JokeModel.swift
//  CodeFellowsApp
//
//  Created by David Maybach on 4/23/16.
//  Copyright © 2016 David Maybach. All rights reserved.
//

import UIKit
import ObjectMapper

class JokeModel: Mappable {
    var id: Int?
    var joke: String?
        {
        didSet
        {
            //Clean up the source text. It goes with "&quot" occurences in the text. Ideally should be fixed on the server side.
            if (joke!.rangeOfString("&quot") != nil)
            {
                joke = joke!.stringByReplacingOccurrencesOfString("&quot", withString: "", options: NSStringCompareOptions.LiteralSearch, range: nil)
            }
        }
    }
    
    required init?(_ map: Map){
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        joke <- map["joke"]
    }
}
