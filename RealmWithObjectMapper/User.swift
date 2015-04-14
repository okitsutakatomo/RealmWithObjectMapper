//
//  User.swift
//  RealmWithObjectMapper
//
//  Created by Takatomo Okitsu on 2015/04/14.
//  Copyright (c) 2015年 Takatomo Okitsu. All rights reserved.
//

import Foundation

class User: RLMObject, Mappable {
    
    var id:String?
    var name:String?
    
    required init?(_ map: Map) {
        super.init()
        mapping(map)
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
    }
    
    override class func primaryKey() -> String {
        return "id"
    }
}
