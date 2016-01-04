//
//  FuniConfig.swift
//  funiWisdomHouseCloud
//
//  Created by You on 16/1/4.
//  Copyright © 2016年 funi. All rights reserved.
//

import UIKit

class FuniConfig: Mappable {
    
    // new house begin
    var regionList:Array<FuniConfigInfo>?         //区域
    var propertyPriceList:Array<FuniConfigInfo>?  //物业类型价格区间
    var tagList:Array<FuniConfigInfo>?            //楼盘标签    特色
    var nearbyList:Array<FuniConfigInfo>?         //周边楼盘
    var nearbyHouseList:Array<FuniConfigInfo>?    //附近房源
    
    // new house end
    
    // old house begin
    var houseRegionList:Array<FuniCondition>?    //区域
    var houseTaoXingList:Array<FuniCondition>?   //二手房房源套型
    var moreList:Array<FuniConfigInfo>?           //更多
    var priceList:Array<FuniConfigInfo>?          //价格
    // old house end
    
    
    var config:FuniConfigOther?
    
    init(){}
    
    required init?(_ map: Map){
        mapping(map)
    }
    
    func mapping(map: Map) {
        regionList <- map["regionList"]
        propertyPriceList <- map["propertyPriceList"]
        tagList <- map["tagList"]
        nearbyList <- map["nearbyList"]
        nearbyHouseList <- map["nearbyHouseList"]
        houseRegionList <- map["houseRegionList"]
        houseTaoXingList <- map["houseTaoXingList"]
        moreList <- map["moreList"]
        priceList <- map["priceList"]
        config <- map["config"]
    }

}
