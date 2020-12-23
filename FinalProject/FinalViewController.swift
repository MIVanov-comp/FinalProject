//
//  FinalViewController.swift
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


class FinalViewController: UIViewController{
    var endingsText: UILabel!
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
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var backgroundImageF: UIImageView!
    
    
    func setDesign(){
        endingsText = UILabel()
        endingsText.translatesAutoresizingMaskIntoConstraints = false
        endingsText.textAlignment = .left
        endingsText.numberOfLines = 300
        endingsText.textColor = .blue
        endingsText.shadowColor = .black
        endingsText.textAlignment = .center
        firstendingDone = defaults.bool(forKey: "FED")
        secondendingDone = defaults.bool(forKey: "SED")
        thirdendingDone = defaults.bool(forKey: "TED")
        fourthendingDone = defaults.bool(forKey: "FOED")
        totalScore = defaults.integer(forKey: "TS")
        wrongAnswer = defaults.integer(forKey: "WA")
        let storage = Storage.storage()
        let storageRef = storage.reference()
        let ref = storageRef.child("gradient_2.png")
        backgroundImageF.sd_setImage(with: ref)
        backButton.layer.borderWidth = 3
        backButton.layer.borderColor = UIColor.blue.cgColor
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setDesign()
        view.addSubview(endingsText)
  
        NSLayoutConstraint.activate([
            endingsText.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor,constant: 70),
            endingsText.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor),
            endingsText.rightAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor)
        ])
        whatFinal(what: pageId)
    }
    func saveAll(){
        defaults.set(levelNav, forKey: "LevelNav")
        defaults.set(pageId, forKey: "PID")
        defaults.set(totalScore,forKey: "TS")
        defaults.set(firstendingDone, forKey: "FED")
        defaults.set(secondendingDone, forKey: "SED")
        defaults.set(thirdendingDone, forKey: "TED")
        defaults.set(fourthendingDone, forKey: "FOED")
    }

    
    
    @IBAction func backinMenu(_ sender: Any) {
        levelNav = 0
        pageId = 0
        saveAll()
        print(totalScore)
    }
}

