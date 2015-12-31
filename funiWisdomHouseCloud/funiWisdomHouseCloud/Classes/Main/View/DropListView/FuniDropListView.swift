//
//  FuniDropListView.swift
//  funiWisdomHouseCloud
//
//  Created by You on 15/12/29.
//  Copyright © 2015年 funi. All rights reserved.
//

import UIKit

//选中之后的回调
typealias  DidSelDropListClosure = (configInfo: FuniConfigInfo) -> Void

class FuniDropListView: UIViewController {

    @IBOutlet var myTableView: UITableView!
    var dropListDataSource:Array<FuniConfigInfo>!
    var lastSelValue:String?
    var didSelDropListClosure:DidSelDropListClosure?
    @IBOutlet var myTableViewHeightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.5)
        self.myTableView.delegate = self
        self.myTableView.dataSource = self
        
        self.resetTableView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func resetTableView() {
        let maxHeight = APPHEIGHT - 84 - 49
        let cHeight:CGFloat   = CGFloat(self.dropListDataSource.count * 44)
        if cHeight < maxHeight {
            //实际数据小于屏幕最大显示的高度
            self.myTableViewHeightConstraint.constant = cHeight
        }
    }

}

// MARK TableView Delegate
extension FuniDropListView : UITableViewDataSource, UITableViewDelegate {

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dropListDataSource.count;
    }
    
    func tableView(tableView:UITableView,cellForRowAtIndexPath indexPath: NSIndexPath)
        -> UITableViewCell{
            
            let cell = tableView.dequeueReusableCellWithIdentifier("FuniDropListTableViewCell", forIndexPath: indexPath) as! FuniDropListTableViewCell
            if self.dropListDataSource.count > 0 {
                cell.lastSelValue = self.lastSelValue
                cell.configInfoObj = self.dropListDataSource[indexPath.row]
            }
            return cell;
            
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let configInfo = self.dropListDataSource[indexPath.row]
        self.lastSelValue = configInfo.value
        
        if self.didSelDropListClosure != nil {
            self.didSelDropListClosure!(configInfo: configInfo)
        }
    }
}
