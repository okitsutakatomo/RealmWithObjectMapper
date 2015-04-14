//
//  User.swift
//  RealmWithObjectMapper
//
//  Created by Takatomo Okitsu on 2015/04/14.
//  Copyright (c) 2015年 Takatomo Okitsu. All rights reserved.
//

import Foundation

class User: RLMObject, Mappable {
    
    dynamic var id:String = ""
    dynamic var name:String?
    
    override init!() {
        super.init()
    }
    
    required convenience init?(_ map: Map) {
        self.init()
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
