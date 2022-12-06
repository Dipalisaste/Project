//
//  ViewController.swift
//  ExapandTableView
//
//  Created by Felix-ITS015 on 15/07/1944 Saka.
//  Copyright © 1944 Felix. All rights reserved.
//

import UIKit

struct CellData{
    var isOpen:Bool
    var menu:String
    var subMenu:[String]=[]
    var imgArr:[UIImage]=[]

}

class ViewController: UIViewController {
    
    var tableViewData:[CellData] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewData = [CellData(isOpen: false, menu: "Flag", subMenu:      ["White","Black","India"], imgArr: [#imageLiteral(resourceName: "india"),#imageLiteral(resourceName: "india"),#imageLiteral(resourceName: "india")]),
                         CellData(isOpen: false, menu: "Fruits", subMenu: ["Lemon","Apple","Orange"], imgArr: [#imageLiteral(resourceName: "india"),#imageLiteral(resourceName: "india"),#imageLiteral(resourceName: "india")]),
                     CellData(isOpen: false, menu: "Flowers", subMenu: ["Lotus","Rose","Sunflower"], imgArr: [#imageLiteral(resourceName: "india"),#imageLiteral(resourceName: "india"),#imageLiteral(resourceName: "india")])]
        
        
    }


}
extension ViewController:UITableViewDataSource,UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewData.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableViewData[section].isOpen == true{
            return tableViewData[section].subMenu.count + 1
        }else{ return 1}
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        if indexPath.row == 0{
                cell.textLabel?.text = tableViewData[indexPath.section].menu
                cell.backgroundColor = UIColor.gray
        
        }else {
            cell.textLabel?.text = tableViewData[indexPath.section].subMenu[indexPath.row - 1]
            cell.backgroundColor = UIColor.brown
            cell.imageView?.image = tableViewData[indexPath.section].imgArr[indexPath.row - 1 ]

        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if  tableViewData[indexPath.section].isOpen == true{
            tableViewData[indexPath.section].isOpen = false
            tableView.reloadSections([indexPath.section], with: .none)
        } else {
            tableViewData[indexPath.section].isOpen = true
            tableView.reloadSections([indexPath.section], with: .none)
        }
    }
    
}
