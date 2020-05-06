//
//  PreferencesViewController.swift
//  MouseHotKey
//
//  Created by KJ Choi on 5/6/20.
//  Copyright © 2020 Kelvin Ng. All rights reserved.
//

import Cocoa

class PreferencesViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.preferredContentSize = NSMakeSize(self.view.frame.size.width, self.view.frame.size.height)
    }
    
    override func viewDidAppear() {
        super.viewDidAppear()
    }
    
}
