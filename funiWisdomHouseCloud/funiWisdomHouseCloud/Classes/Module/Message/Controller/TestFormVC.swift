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
        
        NHHttpService.sharedInstance.serviceConfig({ (msg:String) -> Void in
            
            }) { (error: String) -> Void in
                
        }
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
            case 4:
                var array = HttpService_NHouse.sharedInstance.getCerificateTypeData()
                array.removeFirst()
                array.removeFirst()
                array.removeFirst()
                textField.dataSource = array
                break;
            default:break
        }
    }
    
    @IBAction func menuBtnClicked(sender: UIButton) {
        let nhSearchVC = Helper.getViewControllerFromStoryboard("NHMain", storyboardID: "NHSearchViewController") as! NHSearchViewController
        self.navigationController?.pushViewController(nhSearchVC, animated: true)
    }
    
}
