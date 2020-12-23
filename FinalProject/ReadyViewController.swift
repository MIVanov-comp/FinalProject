//
//  ReadyViewController.swift
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

class ReadyViewController: UIViewController {
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
    var readyText: UILabel!
    var fonName2: String = "gradient_2.png"
    @IBOutlet weak var backfroundImage: UIImageView!
    @IBOutlet weak var readyButton: UIButton!
    
    func setDesign(){
        let storage = Storage.storage()
        let storageRef = storage.reference()
        let ref = storageRef.child("gradient_2.png")
        backfroundImage.sd_setImage(with: ref)
        readyText = UILabel()
        let fontSize = readyText.font.pointSize
        readyText.translatesAutoresizingMaskIntoConstraints = false
        readyText.textAlignment = .left
        readyText.numberOfLines = 300
        readyText.textColor = .blue
        readyText.shadowColor = .black
        readyText.textAlignment = .center
        readyButton.layer.borderWidth = 3
        readyButton.layer.borderColor = UIColor.blue.cgColor
        readyText.font = UIFont(name: "HelveticaNeue", size: fontSize)
        readyText.textAlignment = NSTextAlignment.center
        readyText.text = "Привет! В этой игре тебе понадобится делать различные выборы для развития сюжета, а также решать задачи, с помощью которых ты сможешь отточить свои навыки по решению первой части ОГЭ по математике. ВАЖНО: ответы с дробным значением пишутся через точку. Ты готов?"
    }
    
    override func viewDidLoad() {

        super.viewDidLoad()
       
       setDesign()

        view.addSubview(readyText)

        
        NSLayoutConstraint.activate([
            readyText.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 50),
            readyText.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor),
            readyText.rightAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor)
        ])
       
      
        
    }
    
    @IBAction func playGame(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "playGameID") as! GameViewController
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
}
