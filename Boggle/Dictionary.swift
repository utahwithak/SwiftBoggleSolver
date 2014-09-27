//
//  Dictionary.swift
//  Boggle
//
//  Created by Carl Wieland on 9/26/14.
//  Copyright (c) 2014 Carl Wieland. All rights reserved.
//

import Foundation
enum WordState{
    case Invalid
    case Word
    case Prefix
}

class Dictionary{
    let words:Trie
    init(path:String){
        var error:NSErrorPointer = nil
        var txtFile = NSString(contentsOfFile: "/Users/carlwieland/Desktop/wordList.txt", encoding: NSUTF8StringEncoding, error: error)
        
        words = Trie()
        if let file = txtFile{

            var allWords =  file.componentsSeparatedByString("\n") as [String]
            for word in allWords{
                words.insert(word)
            }
        }

        
    }
    
    func checkWord(prefix:String)->WordState{
       return words.trieState(prefix)
    }
    func validWord(word:String)->Bool{
        return words.validWord(word)
    }
}