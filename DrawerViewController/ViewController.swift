//
//  ViewController.swift
//  DrawerViewController
//
//  Created by lu on 15/10/14.
//  Copyright © 2015年 lu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, DrawerViewDelegate, UINavigationControllerDelegate, UIGestureRecognizerDelegate {
    
    var offsetX: CGFloat?
    var contentView: UIView?
    var tapGesture: UITapGestureRecognizer?
    var panGesture: UIPanGestureRecognizer?
    
    var isOpen: Bool?{
        didSet{
            if isOpen == true{
                self.addTapGesture()
            }else{
                self.contentView?.removeGestureRecognizer(self.tapGesture!)
            }
        }
    }
    
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
        contentView!.backgroundColor = UIColor.orangeColor()
        self.view.addSubview(contentView!)
        self.view.bringSubviewToFront(contentView!)
        self.navigationItem.title = "Drawer"
        let leftButtonItem = UIBarButtonItem(image: UIImage(named: "List"), style: UIBarButtonItemStyle.Plain, target: self, action: "showDrawer:")
        self.navigationItem.leftBarButtonItem = leftButtonItem
//        self.navigationController?.navigationBar.backgroundColor = UIColor.redColor()
        self.edgesForExtendedLayout = UIRectEdge.None
        self.automaticallyAdjustsScrollViewInsets = false
        
    }
    
    func addPanGesture(){
        panGesture = UIPanGestureRecognizer(target: self, action: "panHandler:")
        panGesture!.delegate = self
        self.contentView?.addGestureRecognizer(panGesture!)
    }
    
    func addTapGesture(){
        tapGesture = UITapGestureRecognizer(target: self, action: "tapHandler:")
        tapGesture!.delegate = self
        self.contentView?.addGestureRecognizer(tapGesture!)
    }
    
    func tapHandler(sender: AnyObject){
        showDrawer(sender)
        print("tap")
    }
    
    func showDrawer(sender: AnyObject){
        if self.contentView?.center.x <= self.view.center.x{
            UIView.animateWithDuration(NSTimeInterval(0.5), animations: {
                self.contentView!.center = CGPoint(x: self.contentView!.center.x + self.offsetX!, y: self.contentView!.center.y)
            })
            self.isOpen = true
        }else{
            UIView.animateWithDuration(NSTimeInterval(0.5), animations: {
                self.contentView!.center = CGPoint(x: self.contentView!.center.x - self.offsetX!, y: self.contentView!.center.y)
            })
            self.isOpen = false
        }
    }
    
    func didSelectItemAtIndexPath(indexPath: NSIndexPath) {
        print("选中了第\(indexPath.row)行")
    }
}

