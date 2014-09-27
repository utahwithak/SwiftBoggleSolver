//
//  Letter.swift
//  Boggle
//
//  Created by Carl Wieland on 9/26/14.
//  Copyright (c) 2014 Carl Wieland. All rights reserved.
//

import Foundation
class Letter{
    let value:String;
    var visited:Bool;
    init(val:String){
        visited = false
        value = val
    }
}