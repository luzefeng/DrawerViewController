//
//  DrawerView.swift
//  DrawerViewController
//
//  Created by lu on 15/10/14.
//  Copyright © 2015年 lu. All rights reserved.
//

import UIKit

class DrawerView: UIView, UITableViewDelegate, UITableViewDataSource {

    var tableView: UITableView?
    let cellIdentifier = "Cell"
    var items = ["第一行", "第二行", "第三行", "第四行", "第五行"]
    var delegate: DrawerViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView(frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setupView(frame: CGRect){
        self.tableView = UITableView(frame: frame, style: UITableViewStyle.Plain)
        self.tableView?.registerClass(DrawerViewCell.self, forCellReuseIdentifier: cellIdentifier)
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        self.addSubview(self.tableView!)
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        delegate?.didSelectItemAtIndexPath(indexPath)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! DrawerViewCell
        cell.textLabel?.text = items[indexPath.row]
        
        return cell
    }
}
