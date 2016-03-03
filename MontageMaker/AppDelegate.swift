//
//  AppDelegate.swift
//  MontageMaker
//
//  Created by Jim Toepel on 3/2/16.
//  Copyright © 2016 FunderDevelopment. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    
    let statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(NSSquareStatusItemLength)


    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
        
        if let button = statusItem.button {
            button.image = NSImage(named: "StatusBarButtonImage")
            button.action = Selector("printQuote:")
        }
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }
    
    func printQuote(sender: AnyObject) {
        let quoteText = "Never surrender"
        let quoteAuthor = "Winston Churchill"
        
        print("\(quoteText) - \(quoteAuthor)")
    }


}

