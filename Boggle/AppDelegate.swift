//
//  AppDelegate.swift
//  Boggle
//
//  Created by Carl Wieland on 9/26/14.
//  Copyright (c) 2014 Carl Wieland. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!


    func applicationDidFinishLaunching(aNotification: NSNotification?) {
        // Insert code here to initialize your application
        
        let board = Board(xDim: 25, yDim: 25)
        let dict = Dictionary(path: "wordList.txt");
        //println("Board:\n\(board)")
        let foundWords = board.wordsInDictionary(dict)
        for word in foundWords{
            println(word)
        }
        
        
    }

    func applicationWillTerminate(aNotification: NSNotification?) {
        // Insert code here to tear down your application
    }


}

