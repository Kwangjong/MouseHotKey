//
//  AppDelegate.swift
//  MouseHotKey
//
//  Created by KJ Choi on 6/5/20.
//  Copyright (c) 2020 KJ Choi. All rights reserved.
//

import Cocoa

class AppDelegate: NSObject, NSApplicationDelegate {
    
    //strong reference to retain the status bar item object
	var statusItem: NSStatusItem?
    var preferenceController: NSWindowController?
    
    @IBOutlet weak var appMenu: NSMenu!
    
    @objc func displayMenu() {
        guard let button = statusItem?.button else { return }
        let x = button.frame.origin.x
        let y = button.frame.origin.y - 5
        let location = button.superview!.convert(NSMakePoint(x, y), to: nil)
        let w = button.window!
        let event = NSEvent.mouseEvent(with: .leftMouseUp,
                                       location: location,
                                       modifierFlags: NSEvent.ModifierFlags(rawValue: 0),
                                       timestamp: 0,
                                       windowNumber: w.windowNumber,
                                       context: w.graphicsContext,
                                       eventNumber: 0,
                                       clickCount: 1,
                                       pressure: 0)!
        NSMenu.popUpContextMenu(appMenu, with: event, for: button)
    }
	
    
    @IBAction func showPreferences(_ sender: Any) {
        let storyboard = NSStoryboard(name: NSStoryboard.Name(rawValue: "Preferences"), bundle: nil)
        preferenceController = storyboard.instantiateInitialController() as? NSWindowController
        preferenceController!.showWindow(sender)
    }
    
	func applicationDidFinishLaunching(_ aNotification: Notification) {
        statusItem = NSStatusBar.system.statusItem(withLength: -1)
        
        guard let button = statusItem?.button else {
            print("error")
            NSApp.terminate(nil)
            return
        }
        
        button.image = NSImage(named: NSImage.Name(rawValue: "mouseImage"))
        button.target = self
        button.action = #selector(displayMenu)
        
        //mouse handler
        NSEvent.addGlobalMonitorForEvents(matching: NSEvent.EventTypeMask.otherMouseDown, handler: mListener)
        NSEvent.addGlobalMonitorForEvents(matching: NSEvent.EventTypeMask.leftMouseDown, handler: mListener)
        NSEvent.addGlobalMonitorForEvents(matching: NSEvent.EventTypeMask.rightMouseDown, handler: mListener)
        //test
    }
    
    func mListener(event :NSEvent){
        NSLog("%ld", event.buttonNumber);
    }

}

