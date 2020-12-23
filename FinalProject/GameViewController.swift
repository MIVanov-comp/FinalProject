//
//  GameViewController.swift
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

class GameViewController: UIViewController {
    var textText: UILabel!
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
    @IBOutlet weak var backgorundImageG: UIImageView!
    @IBOutlet weak var firstVar: UIButton!
    @IBOutlet weak var secondVar: UIButton!
    
    func setDesign(){
        textText = UILabel()
        textText.translatesAutoresizingMaskIntoConstraints = false
        textText.textAlignment = .left
        textText.numberOfLines = 300
        textText.textColor = .blue
        textText.shadowColor = .black
        textText.textAlignment = .center
        let storage = Storage.storage()
        let storageRef = storage.reference()
        let ref = storageRef.child("gradient_2.png")
        backgorundImageG.sd_setImage(with: ref)
        view.addSubview(textText)
        firstVar.layer.borderWidth = 3
        firstVar.layer.borderColor = UIColor.blue.cgColor
        secondVar.layer.borderWidth = 3
        secondVar.layer.borderColor = UIColor.blue.cgColor
    }
    func setMyValues(){
        defaults.set(levelNav, forKey: "LevelNav")
        defaults.set(pageId, forKey: "PID")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setDesign()
        view.addSubview(textText)
        setMyValues()
        NSLayoutConstraint.activate([
            textText.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 70),
            textText.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor),
            textText.rightAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor)
        ])
        setPage(seter: levelNav)
        
    }
    @IBAction func firstVar(_ sender: UIButton) {
        levelPoint = 1
        levelPoint2 = 0
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "answerID") as! AnswerViewController
        vc.modalPresentationStyle = .fullScreen
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
        self.present(vc, animated: false)
    }
    
    @IBAction func secondVar(_ sender: Any) {
        levelPoint2 = 2
        levelPoint = 0
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "answerID") as! AnswerViewController
        vc.modalPresentationStyle = .fullScreen
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
        self.present(vc, animated: false)
    }
    

    
}
