//
//  DrawerViewDelegate.swift
//  DrawerViewController
//
//  Created by lu on 15/10/14.
//  Copyright © 2015年 lu. All rights reserved.
//

import UIKit
import Foundation

protocol DrawerViewDelegate: NSObjectProtocol {
    func didSelectItemAtIndexPath(indexPath: NSIndexPath)
}
