//
//  HttpService-NHouse.swift
//  funiWisdomHouseCloud
//
//  Created by You on 15/12/28.
//  Copyright © 2015年 funi. All rights reserved.
//

import UIKit

class HttpService_NHouse {

    let sessionManager:ESPAFHTTPSessionManager;
    
    static let sharedInstance = HttpService_NHouse()
    var certificateTypeMArray = Array<FuniConfigInfo>()
    
    class func setAppNetworkActivity(on: Bool) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = on;
    }
    
    private init() {
        sessionManager = ESPAFHTTPSessionManager();
        sessionManager.securityPolicy = AFSecurityPolicy(pinningMode: AFSSLPinningMode(rawValue: 0)!)
        sessionManager.requestSerializer = AFJSONRequestSerializer()
    }
    
    /**
    *  初始化证件类型数据
    */
    func getCerificateTypeData() ->Array<FuniConfigInfo> {
        if self.certificateTypeMArray.count == 0 {
            let configInfo1 = FuniConfigInfo()
            configInfo1.title = "身份证";
            configInfo1.value = "身份证";
            self.certificateTypeMArray.append(configInfo1)
            
            let configInfo2 = FuniConfigInfo()
            configInfo2.title = "户口薄";
            configInfo2.value = "户口薄";
            self.certificateTypeMArray.append(configInfo2)
            
            let configInfo3 = FuniConfigInfo()
            configInfo3.title = "护照";
            configInfo3.value = "护照";
            self.certificateTypeMArray.append(configInfo3)
            
            let configInfo4 = FuniConfigInfo()
            configInfo4.title = "军官证";
            configInfo4.value = "军官证";
            self.certificateTypeMArray.append(configInfo4)
            
            let configInfo5 = FuniConfigInfo()
            configInfo5.title = "士兵证";
            configInfo5.value = "士兵证";
            self.certificateTypeMArray.append(configInfo5)
            
            let configInfo6 = FuniConfigInfo()
            configInfo6.title = "警官证";
            configInfo6.value = "警官证";
            self.certificateTypeMArray.append(configInfo6)
            
            let configInfo7 = FuniConfigInfo()
            configInfo7.title = "通行证";
            configInfo7.value = "通行证";
            self.certificateTypeMArray.append(configInfo7)
        }
        return self.certificateTypeMArray
    }

}
