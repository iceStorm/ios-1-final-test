//
//  FirstViewController.swift
//  EngQuiz
//
//  Created by Nguyen Anh Tuan on 4/23/21.
//  Copyright © 2021 CK2021. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    enum SegueIntent: Int {
        case Easy = 0;
        case Medium = 1;
        case Hard = 2;
    }
    
    
    @IBOutlet weak var btnEasy: IceButton!
    @IBOutlet weak var btnMedium: IceButton!
    @IBOutlet weak var btnHard: IceButton!
    private var segueIntent: SegueIntent!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func unwindToFirst(unwindSegue: UIStoryboardSegue) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondViewController = segue.destination as! SecondViewController
        secondViewController.gameLevel = segueIntent.rawValue
    }
    
    
    
    
    
    @IBAction func btnEasyClicked(_ sender: IceButton) {
        segueIntent = .Easy
        performSegue(withIdentifier: "firstToSecond", sender: self)
    }
    
    @IBAction func btnMediumClicked(_ sender: IceButton) {
        segueIntent = .Medium
        performSegue(withIdentifier: "firstToSecond", sender: self)
    }
    
    
    @IBAction func btnHardClicked(_ sender: IceButton) {
        segueIntent = .Hard
        performSegue(withIdentifier: "firstToSecond", sender: self)
    }
}
