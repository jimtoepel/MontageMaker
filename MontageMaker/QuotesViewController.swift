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
        
        
        trackTitle.stringValue = "Final Fantasy - Victory!"
        let path = NSBundle.mainBundle().URLForResource("Final Fantasy VII - Victory Fanfare", withExtension: "mp3")
        
        do {
        try audioPlayer = AVAudioPlayer(contentsOfURL: path!)
        } catch {
            print ("Player not available")
        }
            
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
    
    @IBAction func playPauseMusic(sender:AnyObject) {
        if isPlaying {
            audioPlayer.pause()
            print("paused")
            isPlaying = false
        } else {
            audioPlayer.play()
            print("playing")
            isPlaying = true
            
            timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "updateTime", userInfo: nil, repeats: true)
        }
    }
    
    @IBAction func stopMusic(sender: AnyObject) {
        audioPlayer.stop()
        audioPlayer.currentTime = 0
        isPlaying = false
    }
    
    func updateTime() {
        var currentTime = Int(audioPlayer.currentTime)
        var minutes = currentTime/60
        var seconds = currentTime - minutes * 60
        
        trackTime.stringValue = NSString(format: "%02d:%02d", minutes, seconds) as String
        
    }
    
    
}
