//
//  LevelResults.swift
//  Shooter-1
//
//  Created by student on 9/21/16.
//  Copyright © 2016 student. All rights reserved.
//

import Foundation
class LevelResults{
    let levelNum:Int
    let levelScore:Int
    let totalScore:Int
    let msg:String
    init(levelNum:Int, levelScore:Int, totalScore:Int, msg:String) {
        self.levelNum = levelNum
        self.levelScore = levelScore
        self.totalScore = totalScore
        self.msg = msg
    }
}
