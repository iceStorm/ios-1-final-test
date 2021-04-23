//
//  FourthViewController.swift
//  EngQuiz
//
//  Created by Nguyen Anh Tuan on 4/23/21.
//  Copyright © 2021 CK2021. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController {
    @IBOutlet weak var lbLevel: UILabel!
    @IBOutlet weak var lbScore: UILabel!
    
    @IBOutlet weak var lbBestEasyScore: UILabel!
    @IBOutlet weak var lbBestMediumScore: UILabel!
    @IBOutlet weak var lbBestHardScore: UILabel!
    
    @IBOutlet weak var btnReStart: IceButton!
    public var game: GameController!
    private var user: UserDefaults!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lbLevel.text = game.data.mode.rawValue
        lbScore.text = "\(game.scores)"
        
        user = UserDefaults.standard
        calculateBestScores()
    }

    private func calculateBestScores() {
        //  processing current game level scores
        let mode = game.data.mode.rawValue
        let theOldScore = user.integer(forKey: mode)
        if game.scores > theOldScore {
            user.set(game.scores, forKey: mode)
        }
        
        
        //  getting other best scores
        let bestEasyScores = user.integer(forKey: GameMode.Easy.rawValue)
        
        let bestMediumScores = user.integer(forKey: GameMode.Medium.rawValue)
        
        let bestHardScores = user.integer(forKey: GameMode.Hard.rawValue)
        
        
        lbBestEasyScore.text = "\(bestEasyScores)"
        lbBestMediumScore.text = "\(bestMediumScores)"
        lbBestHardScore.text = "\(bestHardScores)"
    }
    
    
    @IBAction func btnReStartClicked(_ sender: IceButton) {
        dismiss(animated: true, completion: nil)
    }
}
