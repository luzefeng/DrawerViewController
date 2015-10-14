//
//  ViewController.swift
//  DrawerViewController
//
//  Created by lu on 15/10/14.
//  Copyright © 2015年 lu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, DrawerViewDelegate, UINavigationControllerDelegate {
    
    var offsetX: CGFloat?
    var contentView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setupView(){
        offsetX = self.view.frame.width/2
        let drawer = DrawerView(frame: self.view.frame)
        drawer.delegate = self
        self.view.addSubview(drawer)
        
        contentView = UIView(frame: self.view.frame)
        contentView!.backgroundColor = UIColor.grayColor()
        self.view.addSubview(contentView!)
        self.view.bringSubviewToFront(contentView!)
        self.navigationItem.title = "hello"
        let leftButtonItem = UIBarButtonItem(image: UIImage(named: "List"), style: UIBarButtonItemStyle.Plain, target: self, action: "showDrawer:")
        self.navigationItem.leftBarButtonItem = leftButtonItem
//        self.navigationController?.navigationBar.backgroundColor = UIColor.redColor()
        self.edgesForExtendedLayout = UIRectEdge.None
        self.automaticallyAdjustsScrollViewInsets = false
    }
    
    func showDrawer(sender: AnyObject){
        if self.contentView?.center.x <= self.view.center.x{
            UIView.animateWithDuration(NSTimeInterval(0.5), animations: {
                self.contentView!.center = CGPoint(x: self.contentView!.center.x + self.offsetX!, y: self.contentView!.center.y)
            })
        }else{
            UIView.animateWithDuration(NSTimeInterval(0.5), animations: {
                self.contentView!.center = CGPoint(x: self.contentView!.center.x - self.offsetX!, y: self.contentView!.center.y)
            })
        }
    }
    
    func didSelectItemAtIndexPath(indexPath: NSIndexPath) {
        print(indexPath)
    }
}

