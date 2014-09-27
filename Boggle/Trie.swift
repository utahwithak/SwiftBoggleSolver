//
//  Trie.swift
//  Boggle
//
//  Created by Carl Wieland on 9/26/14.
//  Copyright (c) 2014 Carl Wieland. All rights reserved.
//

import Foundation
class Node{
    var children = [Character:Node]()
    var isWord:Bool
    let value:Character
    init(str:Character, word:Bool = false){
        value = str
        isWord = word
    }
    func childWithValue(srch:Character)->Node?{
       return children[srch]
    }
    func addChild(child:Node){
        children[child.value] = child
    }
}
class Trie{
    let root:Node = Node(str: Character("*"), word: false)
    
    func insert(value:String){
        var curNode = root
        for char in value{
            var child = curNode.childWithValue(char)
            if child != nil{
                curNode = child!
            }
            else{
                let newNode = Node(str: char)
                curNode.addChild(newNode)
                curNode = newNode
            }
            
        }
        curNode.isWord = true
    }
    func trieState(val:String)->WordState{
        var node = root
        for char in val{
            var child = node.childWithValue(char)
            if child == nil{
                return .Invalid
            }
            else{
                node = child!
            }
        }
        if node.isWord{
            return .Word
        }
        else{
            return .Prefix
        }
    }
    func validPrefix(val:String)->Bool{
        var node = root
        for char in val{
            var child = node.childWithValue(char)
            if child == nil{
                return false
            }
            else{
                node = child!
            }
        }
        return true
    }
    func validWord(val:String)->Bool{
        var node = root
        for char in val{
            var child = node.childWithValue(char)
            if child == nil{
                return false
            }
            else{
                node = child!
            }
        }
        return node.isWord
    }
}