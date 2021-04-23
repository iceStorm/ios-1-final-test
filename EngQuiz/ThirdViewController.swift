//
//  ViewController.swift
//  EngQuiz
//
//  Created by Nguyen Anh Tuan on 4/23/21.
//  Copyright © 2021 CK2021. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController, GameEventListener {
    
    
    var game: GameController!
    var gameTimer: Timer!
    
    @IBOutlet weak var btnQuizzTime: UIButton!
    @IBOutlet var answerButtons: [IceButton]!
    
    @IBOutlet weak var lbScore: UILabel!
    @IBOutlet weak var lbCurrentQuestion: UILabel!
    @IBOutlet weak var imvHint: UIImageView!
    
    
    //  MARK:   INITIAL FUNCTIONS
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //  assigning the event listener for this game
        game.eventListener = self
        game.next()
    }
    
    private func initView() {
        let answers = game.answerItems
        
        //  assigning answer buttons title
        for i in 0..<answerButtons.count {
            answerButtons[i].isEnabled = true
            answerButtons[i].setTitle(answers[i], for: .normal)
            answerButtons[i].isAnswer = answers[i] == game.currentGameItem.name ? true : false
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let fourthViewController = segue.destination as! FourthViewController
        fourthViewController.game = self.game
    }
    
    


    
    //  MARK:   GAME CALLBACKS
    func onNextRound() {
        initView()
        print("game started...")
        
        
        //  setting the hint image
        imvHint.image = UIImage(named: game.currentGameItem.name.lowercased())
        
        
        if gameTimer == nil {
            //  count down value
            var counter = game.data.time
            
            
            gameTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                self.quizzTime = "\(counter)"
                counter -= 1
                
                if (counter == -1) {
                    timer.invalidate()
                    self.onGameEnd()
                }
            }
        }
    }
    
    func onGameEnd() {
        performSegue(withIdentifier: "thirdToFourth", sender: self)
    }
    
    func onScoreUpdated(score: Int) {
        lbScore.text = "\(score)"
    }
    
    func onRoundUpdated(roundValue: String) {
        lbCurrentQuestion.text = roundValue
    }
    
    
    
    
    
    //  MARK:   COMPUTED PROPERTIES
    private var quizzTime: String {
        get {
            return btnQuizzTime.currentTitle!
        }
        set {
            btnQuizzTime.setTitle(newValue, for: .normal)
        }
    }
    
    
    
    
    
    //  MARK:   EVENT LISTENERS
    @IBAction func btnAnswerClicked(_ sender: IceButton) {
        
        //  disabling all buttons
        for button in answerButtons {
            button.isEnabled = false
        }
        
        
        sender.isEnabled = true
        if sender.isAnswer {
            sender.backgroundColor = .green
        }
        else {
            sender.backgroundColor = .red
        }
        
        
        
        //  let's predict the game
        game.predict(isAnswer: sender.isAnswer)
    }
    
}

