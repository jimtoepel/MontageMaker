//
//  QuotesViewController.swift
//  MontageMaker
//
//  Created by Jim Toepel on 3/4/16.
//  Copyright © 2016 FunderDevelopment. All rights reserved.
//

import Cocoa

class QuotesViewController: NSViewController {
    
    @IBOutlet weak var quoteLabel: NSTextField!
    let quotes = Quote.all
    
    var currentQuoteIndex: Int = 0 {
        didSet {
            updateQuote()
        }
    }
    
    override func viewWillAppear() {
        super.viewWillAppear()
        
        currentQuoteIndex = 0
    }
    
    func updateQuote() {
        quoteLabel.stringValue = String(quotes[currentQuoteIndex])
    }
    
}



// MARK: Actions

extension QuotesViewController {
    @IBAction func goLeft(sender: NSButton) {
        currentQuoteIndex = (currentQuoteIndex - 1 + quotes.count) % quotes.count
    }
    
    @IBAction func goRight(sender: NSButton) {
        currentQuoteIndex = (currentQuoteIndex + 1) % quotes.count
    }
    
    @IBAction func quit(sender: NSButton){
        NSApplication.sharedApplication().terminate(sender)
    }
    
    
}
