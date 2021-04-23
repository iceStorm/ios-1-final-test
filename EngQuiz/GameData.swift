//
//  GameData.swift
//  EngQuiz
//
//  Created by Nguyen Anh Tuan on 4/23/21.
//  Copyright © 2021 CK2021. All rights reserved.
//

import Foundation


enum GameMode: String {
    case Easy = "Easy";
    case Medium = "Medium";
    case Hard = "Hard";
}


struct GameData {
    var mode: GameMode
    var questions: [GameQuestion]
    var time: Int
    var bonus: Int
    var minus: Int
    
    init(mode: GameMode, time: Int, bonus: Int, minus: Int, questions: [GameQuestion]) {
        self.mode = mode
        self.questions = questions
        self.time = time
        self.bonus = bonus
        self.minus = minus
    }
}

class GameQuestion {
    var name: String
    var noises: [String]
    
    init(name: String, noises: [String]) {
        self.name = name
        self.noises = noises
    }
}


let GAME_DATA : [GameData] = [

    GameData(
        mode: .Easy, time: 30, bonus: 10, minus: -5, questions: [
            GameQuestion(name: "Bee", noises: ["Fly", "Butterfly", "Bug"]),
            GameQuestion(name: "Elephant", noises: ["Buffalo", "Rhino", "Hippo"]),
            GameQuestion(name: "Snake", noises: ["Annaconda", "Worm", "Eel"]),
        ]
    ),
    
    GameData(
        mode: .Medium, time: 20, bonus: 20, minus: -10, questions: [
            GameQuestion(name: "Bee", noises: ["Fly", "Butterfly", "Bug"]),
            GameQuestion(name: "Elephant", noises: ["Buffalo", "Rhino", "Hippo"]),
            GameQuestion(name: "Snake", noises: ["Annaconda", "Worm", "Eel"]),
        ]
    ),
    
    GameData(
        mode: .Hard, time: 10, bonus: 30, minus: -15, questions: [
            GameQuestion(name: "Bee", noises: ["Fly", "Butterfly", "Bug"]),
            GameQuestion(name: "Elephant", noises: ["Buffalo", "Rhino", "Hippo"]),
            GameQuestion(name: "Snake", noises: ["Annaconda", "Worm", "Eel"]),
        ]
    ),

]
