//
//  StatisticsViewController.swift
//  FinalProject
//
//  Created by Apple iMac 27 on 23.12.2020.
//

import Firebase
import UIKit
import FirebaseStorage
import Photos
import PhotosUI
import FirebaseUI

class StatisticsViewController: UIViewController{
    var levelPoint: Int = 0
    var levelPoint2: Int = 0
    var levelNav: Int = 0
    var pageId: Int = 0
    var wrongAnswer: Int = 0
    var totalScore: Int = 0
    var rightAnswer: Int = 0
    var firstendingDone: Bool = false
    var secondendingDone: Bool = false
    var thirdendingDone: Bool = false
    var fourthendingDone: Bool = false
    @IBOutlet weak var wrongAnswers: UILabel!
    @IBOutlet weak var cleanProgress: UIButton!
    @IBOutlet weak var backgroundImageS: UIImageView!
    @IBOutlet weak var myScore: UILabel!
    @IBOutlet weak var backInMenuButton: UIButton!
    
    
    func setDesign(){
        totalScore = defaults.integer(forKey: "TS")
        myScore.updateScore(to: totalScore)
        let storage = Storage.storage()
        let storageRef = storage.reference()
        let ref = storageRef.child("gradient_2.png")
        backgroundImageS.sd_setImage(with: ref)
        wrongAnswers.updateID(to: wrongAnswer)
        wrongAnswers.textColor = .blue
        wrongAnswers.shadowColor = .black
        wrongAnswers.textAlignment = .center
        myScore.textColor = .blue
        myScore.shadowColor = .black
        myScore.textAlignment = .center
        cleanProgress.layer.borderWidth = 3
        cleanProgress.layer.borderColor = UIColor.blue.cgColor
        backInMenuButton.layer.borderWidth = 3
        backInMenuButton.layer.borderColor = UIColor.blue.cgColor
    }
    override func viewDidLoad(){
        super.viewDidLoad()
        setDesign()
    }
    func saveAll(){
        defaults.set(totalScore,forKey: "TS")
        defaults.set(levelNav, forKey: "LevelNav")
        defaults.set(pageId, forKey: "PID")
        defaults.set(wrongAnswer, forKey: "WA")
        defaults.set(firstendingDone, forKey: "FED")
        defaults.set(secondendingDone, forKey: "SED")
        defaults.set(thirdendingDone, forKey: "TED")
        defaults.set(fourthendingDone, forKey: "FOED")
    }
    @IBAction func clerAllProgress(_ sender: Any) {
        levelNav = 0
        pageId = 0
        totalScore = 0
        wrongAnswer = 0
        firstendingDone = false
        secondendingDone = false
        thirdendingDone = false
        fourthendingDone = false
        saveAll()
        myScore.updateScore(to: totalScore)
        wrongAnswers.updateID(to: wrongAnswer)
    }
    
    @IBAction func backinMenu(_ sender: Any) {
    
    }
    
}
