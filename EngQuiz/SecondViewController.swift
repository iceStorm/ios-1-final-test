//
//  SecondViewController.swift
//  EngQuiz
//
//  Created by Nguyen Anh Tuan on 4/23/21.
//  Copyright © 2021 CK2021. All rights reserved.
//

import UIKit
var game: GameController!


class SecondViewController: UIViewController {
    
    var gameLevel: Int!
    private var game: GameController!
    
    @IBOutlet weak var btnStartQuizz: IceButton!
    @IBOutlet weak var lbLevel: UILabel!
    @IBOutlet weak var lbTotalQuestions: UILabel!
    @IBOutlet weak var lbTotalTime: UILabel!
    @IBOutlet weak var lbBonus: UILabel!
    @IBOutlet weak var lbMinus: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        game = GameController(data: GAME_DATA[gameLevel])
        
        lbLevel.text = game.data.mode.rawValue
        lbTotalQuestions.text = "\(game.data.questions.count)"
        lbBonus.text = "\(game.data.bonus)"
        lbMinus.text = "\(game.data.minus)"
        lbTotalTime.text = "\(game.data.time) seconds"
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let thirdViewController = segue.destination as! ThirdViewController
        thirdViewController.game = self.game
    }

    @IBAction func btnStartQuizzClicked(_ sender: IceButton) {
        performSegue(withIdentifier: "secondToThird", sender: self)
    }
}
