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
        
        let menu = NSMenu()
        
        menu.addItem(NSMenuItem(title: "PrintQuote", action: Selector("printQuote:"), keyEquivalent: "P"))
        menu.addItem(NSMenuItem.separatorItem())
        menu.addItem(NSMenuItem(title: "Quit Quotes", action: Selector("terminate:"), keyEquivalent: "q"))
        
        statusItem.menu = menu
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

