//
//  RLMObject+ObjectMapper.swift
//  RealmWithObjectMapper
//
//  Created by Takatomo Okitsu on 2015/04/14.
//  Copyright (c) 2015年 Takatomo Okitsu. All rights reserved.
//

import Foundation

extension RLMObject {
    class func objectForID(primaryKey: String) -> RLMObject? {
        return self(forPrimaryKey: primaryKey)
    }
}