//
//  QuotesViewController.swift
//  MontageMaker
//
//  Created by Jim Toepel on 3/4/16.
//  Copyright © 2016 FunderDevelopment. All rights reserved.
//

import Cocoa
import AVFoundation

class QuotesViewController: NSViewController {
    
    @IBOutlet weak var trackTitle: NSTextField!
    @IBOutlet weak var quoteLabel: NSTextField!
    @IBOutlet weak var trackTime: NSTextField!
    @IBOutlet weak var stopMusic: NSButton!
    @IBOutlet weak var playPauseMusic: NSButton!
    
    let quotes = Quote.all
    
    var audioPlayer = AVAudioPlayer()
    var isPlaying = false
    var timer:NSTimer!
    
    var currentQuoteIndex: Int = 0 {
        didSet {
            updateQuote()
        }
    }
    
    override func viewWillAppear() {
        super.viewWillAppear()
        
        currentQuoteIndex = 0
        /*
        trackTitle.Title = "Final Fantasy - Victory!"
        var path = NSBundle.mainBundle().URLForResource("Final Fantasy VII - Victory Fanfare", withExtension: "mp3")
        var error:NSError?
        
        audioPlayer = AVAudioPlayer(contentsOfURL: path!, error: &error)
        */
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
