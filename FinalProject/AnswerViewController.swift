//
//  AnswerViewController.swift
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

class AnswerViewController: UIViewController{
    var questionS: UILabel!
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
    
    @IBOutlet weak var backInMenuButton: UIButton!
    @IBOutlet weak var helpButton: UIButton!
    @IBOutlet weak var textTopConstr: NSLayoutConstraint!
    @IBOutlet var tapOnTheScreen: UITapGestureRecognizer!
    @IBOutlet weak var backgroundImageA: UIImageView!
    @IBOutlet weak var answerButton: UIButton!
    @IBOutlet weak var answerField: UITextField!
    
    func setDesign(){
        let storage = Storage.storage()
        let storageRef = storage.reference()
        let ref = storageRef.child("gradient_2.png")
        backgroundImageA.sd_setImage(with: ref)
        questionS = UILabel()
        questionS.translatesAutoresizingMaskIntoConstraints = false
        questionS.textAlignment = .left
        questionS.numberOfLines = 300
        questionS.textColor = .blue
        questionS.shadowColor = .black
        questionS.textAlignment = .center
        answerButton.layer.borderWidth = 3
        answerButton.layer.borderColor = UIColor.blue.cgColor
        helpButton.layer.borderWidth = 3
        helpButton.layer.borderColor = UIColor.blue.cgColor
        backInMenuButton.layer.borderWidth = 3
        backInMenuButton.layer.borderColor = UIColor.blue.cgColor
    }
    func setMyValue(){
        defaults.set(pageId, forKey: "PID")
        defaults.set(levelNav, forKey: "LevelNav")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setDesign()
        setMyValue()
        view.addSubview(questionS)
        NotificationCenter.default.addObserver(self, selector:
                #selector(keyboardShows), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector:
                #selector(keyboardHides), name: UIResponder.keyboardWillHideNotification, object: nil)
        NSLayoutConstraint.activate([
            questionS.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 70),
            questionS.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor),
            questionS.rightAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor)
        ])
        setPagea(seter: levelNav)
    }
    @objc func keyboardShows(notification: NSNotification){
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue{
            textTopConstr.constant -= keyboardSize.height/1.7
        }
    }
    @objc func keyboardHides(notification: NSNotification){
        textTopConstr.constant = 510
        
    }
  
    @IBAction func tapOnScreen(_ sender: UITapGestureRecognizer) {
        answerField.resignFirstResponder()
        
        
    }
    
    @IBAction func useHeelp(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "podskazkaID") as! PodskazkaViewController
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
        self.present(vc, animated: true)
    }
    
    
    @IBAction func trueOrNot(_ sender: UIButton) {
        if levelNav >= 2{
            if answerField.text == String(rightAnswer)
            {
                if levelPoint != 0 {
                    pageId+=10
                }
                if levelPoint2 != 0 {
                    pageId+=100
                }
                levelNav += 1
                defaults.set(levelNav, forKey: "LevelNav")
                defaults.set(pageId, forKey: "PID")
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "finalID") as! FinalViewController
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
                self.present(vc, animated: true)
            }
            else{
                answerField.text = ""
                answerField.layer.borderWidth=2
                answerField.layer.borderColor=UIColor.red.cgColor
                answerField.placeholder = "Неверный ответ"
                wrongAnswer += 1
                defaults.set(wrongAnswer, forKey: "WA")
            }
        }
        if levelNav < 2{
            
            if levelPoint != 0
            {
                
                if answerField.text == String(rightAnswer){
                    levelNav += 1
                    pageId += 10
                    defaults.set(levelNav, forKey: "LevelNav")
                    defaults.set(pageId, forKey: "PID")
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let vc = storyboard.instantiateViewController(withIdentifier: "playGameID") as! GameViewController
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
                    self.present(vc, animated: true)
                }
                else{
                    answerField.text = ""
                    answerField.layer.borderWidth=2
                    answerField.layer.borderColor=UIColor.red.cgColor
                    answerField.placeholder = "Неверный ответ"
                    wrongAnswer += 1
                    defaults.set(wrongAnswer, forKey: "WA")
                }
            
            }
            if levelPoint2 != 0
            {
               
                if answerField.text == String(rightAnswer){
                    levelNav += 1
                    pageId += 100
                    defaults.set(levelNav, forKey: "LevelNav")
                    defaults.set(pageId, forKey: "PID")
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
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: true)
                   
                }
                else{
                    answerField.text = ""
                    answerField.layer.borderWidth=2
                    answerField.layer.borderColor=UIColor.red.cgColor
                    answerField.placeholder = "Неверный ответ"
                    wrongAnswer += 1
                    defaults.set(wrongAnswer, forKey: "WA")
                }
            
            
            }
        }
        
    }
    
    @IBAction func backinMenu(_ sender: Any) {
       
    }
}

