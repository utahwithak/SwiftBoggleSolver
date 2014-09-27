//
//  Board.swift
//  Boggle
//
//  Created by Carl Wieland on 9/26/14.
//  Copyright (c) 2014 Carl Wieland. All rights reserved.
//

import Foundation

func randChar()->String{
    let letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    var randCount = Int( arc4random()) % 25
    for char in letters{
        randCount -= 1
        if(randCount == 0){
            return String(char).lowercaseString
        }
    }
    return "D"
}

class Board:Printable{
    let tiles:[[Letter]]
    init(boardName:String){
        tiles = [[Letter]()]
    }
    init(xDim:Int, yDim:Int){
        var board:[[Letter]] = []
        for i in 0..<xDim{
            board.append([Letter]())
            for j in 0..<yDim{
                board[i].append(Letter(val: randChar()))
            }
        }
        println("Sizes:\(board.count), \(board[0].count)")
        tiles = board
    }
    
    var description: String {
        get{
            var descp = ""
            for row in tiles{
                for t in row{
                    descp += " \(t.value)"
                }
                descp += "\n"
            }
            return descp
        }
    }
    
    func letterAt(x:Int, y:Int)->Letter?{
        if x < 0 || y < 0 || y >= tiles.count  || x >= tiles[y].count{
            return nil
        }
        else{
            let letter = tiles[y][x]
            if letter.visited {
                return nil
            }
            return letter
            
        }
    }
    
    func wordsInDictionary(dict:Dictionary)->NSSet{
        var words = NSMutableSet()
        for(var i = 0; i < tiles.count; i++ ){
            for(var j = 0; j < tiles[i].count; j++ ){
                println("Search Start At:\(j),\(i)")
                words.unionSet(findWords(j,y:i,prefix:"",dict:dict))
            }
        
        }
        return words
    }
    let validMoves:[(x:Int,y:Int)] = [(-1,0),(-1,-1),(-1,1),(0,-1),(0,1),(1,0),(1,-1),(1,1)]
    func findWords(x:Int, y:Int, prefix:String, dict:Dictionary)->NSSet{
        var words = NSMutableSet()
        var curLetter = letterAt(x, y: y)
        if let letter = curLetter{
            letter.visited = true
            let curWord = prefix+letter.value
            let wordState = dict.checkWord(curWord)
            if (wordState != WordState.Invalid){
               // println("ValidPrefix:\(curWord)")
                for (xOff,yOff) in validMoves{
                    words.unionSet(findWords(x+xOff, y: y+yOff, prefix: curWord, dict: dict))
                }
                if wordState == .Word{
                    words.addObject( curWord)
                }
            }
            
            letter.visited = false
            
        }
        return words
        
    }
}