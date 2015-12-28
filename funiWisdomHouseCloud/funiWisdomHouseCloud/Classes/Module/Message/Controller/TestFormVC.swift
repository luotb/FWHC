//
//  TestFormVC.swift
//  funiWisdomHouseCloud
//
//  Created by You on 15/12/28.
//  Copyright © 2015年 funi. All rights reserved.
//

import UIKit

class TestFormVC: FuniFormBaseVC {

    @IBOutlet var userNameTextField: FuniTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func testBtnClicked(sender: AnyObject) {
        self.validateInputInView()
    }
    
    
    /**
     为textfiled绑定弹窗所需的数据源
     
     - parameter textField: <#textField description#>
     */
    override func buildPopupDataSource(textField:FuniTextField) {
        switch textField.index {
            case 3:
                textField.dataSource = HttpService_NHouse.sharedInstance.getCerificateTypeData()
                break;
            default:break
        }
    }
}
