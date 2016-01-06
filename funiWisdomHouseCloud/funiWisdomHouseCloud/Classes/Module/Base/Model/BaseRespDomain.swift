//
//  BaseRespDomain.swift
//  funiLand
//
//  Created by You on 15/11/30.
//  Copyright © 2015年 funi. All rights reserved.
//

import UIKit

class BaseRespDomain: Reflect {
    
    var code: Int?
    var remark: String?
    var total: Int?
    var data: AnyObject?
    
    required init() {
        self.code = 0
        self.total = 0
        self.remark = ""
    }

}
