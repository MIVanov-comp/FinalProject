//
//  ViewController.swift
//  FinalProject
//
//  Created by Apple iMac 27 on 08.12.2020.
//
import Firebase
import UIKit
import FirebaseStorage
import Photos
import PhotosUI
import FirebaseUI



var defaults = UserDefaults.standard

class ViewController: UIViewController {
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
    
    @IBOutlet weak var titleImage: UIImageView!
    @IBOutlet weak var statButton: UIButton!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var playButton: UIButton!
    func setAllThings(){
        levelNav = defaults.integer(forKey: "LevelNav")
        pageId = defaults.integer(forKey: "PID")
        firstendingDone = defaults.bool(forKey: "FED")
        secondendingDone = defaults.bool(forKey: "SED")
        thirdendingDone = defaults.bool(forKey: "TED")
        fourthendingDone = defaults.bool(forKey: "FOED")
        totalScore = defaults.integer(forKey: "TS")
        wrongAnswer = defaults.integer(forKey: "WA")
      
    }
    func setDesign(){
        let storage = Storage.storage()
        let storageRef = storage.reference()
        let ref = storageRef.child("fonsm.png")
        backgroundImage.sd_setImage(with: ref)
        let storage2 = Storage.storage()
        let storageRef2 = storage2.reference()
        let ref2 = storageRef2.child("T.png")
        titleImage.sd_setImage(with: ref2)
        playButton.layer.borderWidth = 3
        playButton.layer.borderColor = UIColor.blue.cgColor
        statButton.layer.borderWidth = 3
        statButton.layer.borderColor = UIColor.blue.cgColor
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setAllThings()
        setDesign()
    }
   
    @IBAction func playG(_ sender: UIButton) {
        
        if levelNav == 0
        {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "000") as! ReadyViewController
            navigationController?.pushViewController(vc, animated: true)
        }
        else{
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "playGameID") as! GameViewController
            vc.levelPoint = self.levelPoint
            vc.levelPoint2 = self.levelPoint2
            vc.levelNav = self.levelNav
            vc.pageId = self.pageId
            vc.wrongAnswer = self.wrongAnswer
            vc.totalScore = self.totalScore
            vc.rightAnswer = self.rightAnswer
            vc.firstendingDone = self.firstendingDone
            vc.secondendingDone = self.secondendingDone
            vc.thirdendingDone = self.thirdendingDone
            vc.fourthendingDone = self.fourthendingDone
            navigationController?.pushViewController(vc, animated: true)
            
        }
        
    }
    
    @IBAction func gotoStatistics(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "STSTS") as! StatisticsViewController
        vc.levelPoint = self.levelPoint
        vc.levelPoint2 = self.levelPoint2
        vc.levelNav = self.levelNav
        vc.pageId = self.pageId
        vc.wrongAnswer = self.wrongAnswer
        vc.totalScore = self.totalScore
        vc.rightAnswer = self.rightAnswer
        vc.firstendingDone = self.firstendingDone
        vc.secondendingDone = self.secondendingDone
        vc.thirdendingDone = self.thirdendingDone
        vc.fourthendingDone = self.fourthendingDone
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
    
    
}



