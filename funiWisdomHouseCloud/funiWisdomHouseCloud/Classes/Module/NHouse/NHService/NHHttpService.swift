//
//  NHService.swift
//  funiWisdomHouseCloud
//
//  Created by You on 16/1/4.
//  Copyright © 2016年 funi. All rights reserved.
//

import UIKit

let NHBaseServiceURL               = "http://mobileapi.funi.com/"      //正式
let NHServerConfigURL              = "m/config.json"               //配置

class NHHttpService: NSObject {

    let sessionManager:ESPAFHTTPSessionManager;
    
    static let sharedInstance = NHHttpService()
    
    var nhConfig:FuniConfig!
    
    class func setAppNetworkActivity(on: Bool) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = on;
    }
    
    private override init() {
//        sessionManager = AFHTTPSessionManager(baseURL: NSURL(string: baseURLString)!)
        sessionManager = ESPAFHTTPSessionManager();
        sessionManager.securityPolicy = AFSecurityPolicy(pinningMode: AFSSLPinningMode(rawValue: 0)!)
        sessionManager.requestSerializer = AFJSONRequestSerializer()
//        AFNetworkReachabilityManager.sharedManager().startMonitoring()
//        AFNetworkActivityIndicatorManager.sharedManager().enabled = true
    }
    
    
    // 数据URL拼装
    func buildUrl(postfixUrl:String) ->String{
        return NHBaseServiceURL + postfixUrl
    }
    
    // config request
    func serviceConfig(success:(msg:String)->Void,faild:(error:String)->Void){
        
        sessionManager.ESP_GET(self.buildUrl(NHServerConfigURL), parameters: nil, taskSuccessed: { (responseVO: BaseRespDomain) -> Void in
            
            if responseVO.data != nil {
                self.nhConfig = FuniConfig.parse(dict: responseVO.data as! NSDictionary)
            }
            
            success(msg: String_LoginSuccess)
            
            }) { (error: String) -> Void in
                faild(error: error)
        }
    }
}
