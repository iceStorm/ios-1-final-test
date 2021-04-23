//
//  GameController.swift
//  EngQuiz
//
//  Created by Nguyen Anh Tuan on 4/23/21.
//  Copyright © 2021 CK2021. All rights reserved.
//

import Foundation



protocol GameEventListener {
    func onNextRound()
    func onGameEnd()
    
    func onScoreUpdated(score: Int)
    func onRoundUpdated(roundValue: String)
}


class GameController {
    public var eventListener: GameEventListener!
    public var data: GameData
    public var currentGameItem: GameQuestion!
    private var totalRounds: Int
    public var scores: Int {
        didSet {
            eventListener.onScoreUpdated(score: scores)
        }
    }
    private var currentRoundIndex: Int = 0 {
        didSet {
            self.eventListener.onRoundUpdated(roundValue: "\(self.currentRoundIndex)/\(self.totalRounds)")
        }
    }
    
    
    init(data: GameData) {
        self.data = data
        self.scores = 0
        
        self.currentRoundIndex = 0
        self.totalRounds = data.questions.count
    }
    
    
    
    public func next() {
        self.currentGameItem = nextItem
        eventListener.onNextRound()
    }
    
    
    public func nextRound() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
            if self.data.questions.count != 0 {
                self.next()
            }
            else {
                self.eventListener.onGameEnd()
            }
        })
    }
    
    
    private var nextItem: GameQuestion {
        if data.questions.isEmpty {
            eventListener.onGameEnd()
        }
        
        currentRoundIndex += 1
        return data.questions.removeFirst()
    }
    
    public var answerItems: [String] {
        get {
            var arr = [
                currentGameItem.name,
            ]
            
            arr += currentGameItem.noises
            
            return arr.shuffled()
        }
    }
    
    
    public func predict(isAnswer: Bool) {
        //  calculating score
        if isAnswer {
            scores += data.bonus
        }
        else {
            scores += data.minus
        }
        
        
        
        //  processing game navigating
        nextRound()
    }
}
