//
//  PodskazkaViewController.swift
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

class PodskazkaViewController: UIViewController{
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
    @IBOutlet weak var labelText: UILabel!
    @IBOutlet weak var lastText: UILabel!
    @IBOutlet weak var helpText3: UILabel!
    @IBOutlet weak var helpText2: UILabel!
    @IBOutlet var taponView3: UITapGestureRecognizer!
    @IBOutlet weak var helpText: UILabel!
    @IBOutlet weak var backgroundImageP: UIImageView!
    @IBOutlet weak var theFirstView: UIView!
    @IBOutlet var tapOnView: UITapGestureRecognizer!
    @IBOutlet var taponView2: UITapGestureRecognizer!
    @IBOutlet weak var firstHelp: UIView!
    @IBOutlet weak var secondHelp: UIView!
   @IBOutlet weak var lastHelp: UIView!
    
    func setDesign(){
        helpText.text = "Средняя линия треугольника равна половине основания"
        helpText2.text = "Чтобы найти вероятность нужного тебе события необходимо поделить кол-во нужных тебе событий на все события"
        helpText3.text = "Жи-Ши пиши через И!!!"
        lastText.text = "Здесь больше ничего нет :("
        labelText.textColor = .blue
        labelText.shadowColor = .black
        let storage = Storage.storage()
        let storageRef = storage.reference()
        let ref = storageRef.child("gradient_2.png")
        backgroundImageP.sd_setImage(with: ref)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDesign()
    }
    @IBAction func tapOnLast(_ sender: Any) {
        UIView.transition(from: secondHelp, to: secondHelp, duration: 1, options: .transitionCurlUp, completion: nil)
    }
    @IBAction func tapOnFirst(sender: UITapGestureRecognizer){
        UIView.transition(from: firstHelp, to: firstHelp, duration: 1, options: .transitionCurlUp, completion: nil)
        
    }

    @IBAction func tapOnSecond(sender: UITapGestureRecognizer){
        UIView.transition(from: theFirstView, to: theFirstView, duration: 1, options: .transitionCurlUp, completion: nil)
     
    }
    

}
