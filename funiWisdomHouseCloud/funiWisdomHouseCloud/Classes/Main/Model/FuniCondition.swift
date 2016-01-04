//
//  FuniCondition.swift
//  funiWisdomHouseCloud
//
//  Created by You on 16/1/4.
//  Copyright © 2016年 funi. All rights reserved.
//

import UIKit

class FuniCondition: Mappable {
    
    var title:String?          //title
    var conditionArray:Array<FuniConfigInfo>? //搜索条件array

    init(){}
    
    required init?(_ map: Map){
        mapping(map)
    }
    
    func mapping(map: Map) {
        title <- map["title"]
        conditionArray <- map["conditionArray"]
    }
}
