//
//  SearchHouseViewController.swift
//  funiWisdomHouseCloud
//
//  Created by You on 16/1/4.
//  Copyright © 2016年 funi. All rights reserved.
//

import UIKit

class SearchHouseViewController: BaseViewController {
    
    var classifys:Array<String>!
    var cates:Array<String>!
    var movices:Array<String>!
    var hostels:Array<String>!
    var areas:Array<String>!
    
    var sorts:Array<String>!
    var menu:DOPDropDownMenu!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.initMenuView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // 初始化menu
    func initMenuView() {
        // 数据
        self.classifys = ["美食","今日新单","电影","酒店"]
        self.cates = ["自助餐","快餐","火锅","日韩料理","西餐","烧烤小吃"]
        self.movices = ["内地剧","港台剧","英美剧"]
        self.hostels = ["经济酒店","商务酒店","连锁酒店","度假酒店","公寓酒店"]
        self.areas = ["全城","芙蓉区","雨花区","天心区","开福区","岳麓区"]
        self.sorts = ["默认排序","离我最近","好评优先","人气优先","最新发布"]
        
        // 添加下拉菜单
        self.menu = DOPDropDownMenu(origin: CGPointMake(0, 64), andHeight: 44)
        self.menu.delegate = self
        self.menu.dataSource = self
        self.view.addSubview(self.menu)
        // 创建menu 第一次显示 不会调用点击代理，可以用这个手动调用
        self.menu.selectDefalutIndexPath()
    }

}

// MARK DOPDropDownMenuDataSource,DOPDropDownMenuDelegate
extension SearchHouseViewController : DOPDropDownMenuDataSource,DOPDropDownMenuDelegate {
    
    func numberOfColumnsInMenu(menu: DOPDropDownMenu!) -> Int {
        return 3
    }
    
    func menu(menu: DOPDropDownMenu!, numberOfRowsInColumn column: Int) -> Int {
        var count = 0
        switch column{
        case 0:
            count = self.classifys.count
            break
        case 1:
            count = self.areas.count
            break
        case 2:
            count = self.sorts.count
            break
        default:break
        }
        return count
    }
    
    func menu(menu: DOPDropDownMenu!, titleForRowAtIndexPath indexPath: DOPIndexPath!) -> String! {
        var str = ""
        switch indexPath.column{
        case 0:
            str = self.classifys[indexPath.row]
            break
        case 1:
            str = self.areas[indexPath.row]
            break
        case 2:
            str = self.sorts[indexPath.row]
            break
        default:break
        }
        return str
    }
    
//    func menu(menu: DOPDropDownMenu!, detailTextForItemsInRowAtIndexPath indexPath: DOPIndexPath!) -> String! {
//        if (indexPath.column < 2) {
//            return [@(arc4random()%1000) stringValue];
//        }
//        return nil;
//    }
    
    func menu(menu: DOPDropDownMenu!, numberOfItemsInRow row: Int, column: Int) -> Int {
        var count = 0
        if column == 0 {
            switch row{
            case 0:
                count = self.cates.count
                break
            case 2:
                count = self.movices.count
                break
            case 3:
                count = self.hostels.count
                break
            default:break
            }
        }
        return count
    }
    
    func menu(menu: DOPDropDownMenu!, titleForItemsInRowAtIndexPath indexPath: DOPIndexPath!) -> String! {
        var str = ""
        if indexPath.column == 0 {
            switch indexPath.row{
            case 0:
                str = self.cates[indexPath.row]
                break
            case 2:
                str = self.movices[indexPath.row]
                break
            case 3:
                str = self.hostels[indexPath.row]
                break
            default:break
            }
        }
        return str
    }
    
    func menu(menu: DOPDropDownMenu!, didSelectRowAtIndexPath indexPath: DOPIndexPath!) {
        if indexPath.item >= 0 {
            print("点击了 \(indexPath.column) - \(indexPath.row) - \(indexPath.item)")
        } else {
            print("点击了 \(indexPath.column) - \(indexPath.row)")
        }
    }
}
