//
//  FuniConfigInfo.swift
//  funiWisdomHouseCloud
//
//  Created by You on 15/12/28.
//  Copyright © 2015年 funi. All rights reserved.
//

import UIKit

class FuniConfigInfo: Mappable {

    var title:String?
    var value:String?
    var subs:Array<FuniConfigInfo>?
    
    init(){}
    
    required init?(_ map: Map){
        mapping(map)
    }
    
    func mapping(map: Map) {
        title <- map["title"]
        value <- map["value"]
        subs <- map["subs"]
    }
}
