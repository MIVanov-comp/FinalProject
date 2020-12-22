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

var defaults = UserDefaults.standard

class ViewController: UIViewController {
    

    @IBOutlet weak var statButton: UIButton!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var playButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        levelNav = defaults.integer(forKey: "LevelNav")
        pageId = defaults.integer(forKey: "PID")
        firstendingDone = defaults.bool(forKey: "FED")
        secondendingDone = defaults.bool(forKey: "SED")
        thirdendingDone = defaults.bool(forKey: "TED")
        fourthendingDone = defaults.bool(forKey: "FOED")
        totalScore = defaults.integer(forKey: "TS")
        wrongAnswer = defaults.integer(forKey: "WA")
        let storage = Storage.storage()
        let storageRef = storage.reference()
        let ref = storageRef.child("fonsm.png")
        backgroundImage.sd_setImage(with: ref)
        playButton.layer.borderWidth = 3
        playButton.layer.borderColor = UIColor.blue.cgColor
        statButton.layer.borderWidth = 3
        statButton.layer.borderColor = UIColor.blue.cgColor
    }
    
    @IBAction func playG(_ sender: UIButton) {
        if levelNav == 0
        {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "000") as! Ready
            navigationController?.pushViewController(vc, animated: true)
        }
        else{
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "playGameID") as! Play
            navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    

    
    
}





class Ready: UIViewController {
    var readyText: UILabel!

    @IBOutlet weak var backfroundImage: UIImageView!
    @IBOutlet weak var readyButton: UIButton!
    
    override func viewDidLoad() {
        let storage = Storage.storage()
        let storageRef = storage.reference()
        let ref = storageRef.child("gradient_2.png")
        super.viewDidLoad()
        readyText = UILabel()
        let fontSize = readyText.font.pointSize
        readyText.translatesAutoresizingMaskIntoConstraints = false
        readyText.textAlignment = .left
        readyText.numberOfLines = 300
        readyText.textColor = .blue
        readyText.shadowColor = .black
        readyText.textAlignment = .center
        backfroundImage.sd_setImage(with: ref)

        view.addSubview(readyText)
        readyButton.layer.borderWidth = 3
        readyButton.layer.borderColor = UIColor.blue.cgColor
        
        NSLayoutConstraint.activate([
            readyText.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 50),
            readyText.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor),
            readyText.rightAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor)
        ])
        readyText.text = "Привет! В этой игре тебе понадобится делать различные выборы для развития сюжета, а также решать задачи, с помощью которых ты сможешь отточить свои навыки по решению первой части ОГЭ по математике. ВАЖНО: ответы с дробным значением пишутся через точку. Ты готов?"
        readyText.font = UIFont(name: "HelveticaNeue", size: fontSize)
        readyText.textAlignment = NSTextAlignment.center
        
    }
    
    @IBAction func playG(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "playGameID") as! Play
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
}






class Play: UIViewController {
    var textText: UILabel!

    @IBOutlet weak var backgorundImage: UIImageView!
    
    
    @IBOutlet weak var firstVar: UIButton!
    
    @IBOutlet weak var secondVar: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        backgorundImage.sd_setImage(with: ref)
        view.addSubview(textText)
        defaults.set(levelNav, forKey: "LevelNav")
        defaults.set(pageId, forKey: "PID")
        firstVar.layer.borderWidth = 3
        firstVar.layer.borderColor = UIColor.blue.cgColor
        secondVar.layer.borderWidth = 3
        secondVar.layer.borderColor = UIColor.blue.cgColor
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
        let vc = storyboard.instantiateViewController(withIdentifier: "answerID") as! Answer
       // navigationController?.pushViewController(vc, animated: true)
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false)
    }
    
    @IBAction func secondVar(_ sender: Any) {
        levelPoint2 = 2
        levelPoint = 0
       
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "answerID") as! Answer
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false)
    }
    

    
}





class Answer: UIViewController{
    var questionS: UILabel!

    @IBOutlet weak var helpButton: UIButton!
    @IBOutlet weak var textTopConstr: NSLayoutConstraint!
    @IBOutlet var tapOnTheScreen: UITapGestureRecognizer!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var answerButton: UIButton!
    @IBOutlet weak var answerField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        let storage = Storage.storage()
        let storageRef = storage.reference()
        let ref = storageRef.child("gradient_2.png")
        backgroundImage.sd_setImage(with: ref)
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
        defaults.set(pageId, forKey: "PID")
        defaults.set(levelNav, forKey: "LevelNav")
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
        let vc = storyboard.instantiateViewController(withIdentifier: "podskazkaID") as! Podskazka
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
                let vc = storyboard.instantiateViewController(withIdentifier: "finalID") as! Final
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true)
            }
            else{
                answerField.text = String(rightAnswer)
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
                    let vc = storyboard.instantiateViewController(withIdentifier: "playGameID") as! Play
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
            if levelPoint2 != 0
            {
               
                if answerField.text == String(rightAnswer){
                    levelNav += 1
                    pageId += 100
                    defaults.set(levelNav, forKey: "LevelNav")
                    defaults.set(pageId, forKey: "PID")
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let vc = storyboard.instantiateViewController(withIdentifier: "playGameID") as! Play
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
    
}


class Podskazka: UIViewController{
    
    @IBOutlet weak var labelText: UILabel!
    @IBOutlet weak var lastText: UILabel!
    @IBOutlet weak var helpText3: UILabel!
    @IBOutlet weak var helpText2: UILabel!
    @IBOutlet var taponView3: UITapGestureRecognizer!
    @IBOutlet weak var helpText: UILabel!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var theFirstView: UIView!
    @IBOutlet var tapOnView: UITapGestureRecognizer!
    @IBOutlet var taponView2: UITapGestureRecognizer!
    @IBOutlet weak var firstHelp: UIView!
    @IBOutlet weak var secondHelp: UIView!
   @IBOutlet weak var lastHelp: UIView!
    
    override func viewDidLoad() {
        helpText.text = "Средняя линия треугольника равна половине основания"
        helpText2.text = "Чтобы найти вероятность нужного тебе события необходимо поделить кол-во нужных тебе событий на все события"
        helpText3.text = "Жи-Ши пиши через И!!!"
        lastText.text = "Здесь больше ничего нет :("
        labelText.textColor = .blue
        labelText.shadowColor = .black
        super.viewDidLoad()
        let storage = Storage.storage()
        let storageRef = storage.reference()
        let ref = storageRef.child("gradient_2.png")
        backgroundImage.sd_setImage(with: ref)
   
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

class Final: UIViewController{
    var endingsText: UILabel!
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var backgroundImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
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
        view.addSubview(endingsText)
        let storage = Storage.storage()
        let storageRef = storage.reference()
        let ref = storageRef.child("gradient_2.png")
        backgroundImage.sd_setImage(with: ref)
        backButton.layer.borderWidth = 3
        backButton.layer.borderColor = UIColor.blue.cgColor
        
        NSLayoutConstraint.activate([
            endingsText.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor,constant: 70),
            endingsText.leftAnchor.constraint(equalTo: view.layoutMarginsGuide.leftAnchor),
            endingsText.rightAnchor.constraint(equalTo: view.layoutMarginsGuide.rightAnchor)
        ])
       
        
        whatFinal(what: pageId)
    }
    @IBAction func setZero(_ sender: Any) {
        levelNav = 0
        pageId = 0
        defaults.set(levelNav, forKey: "LevelNav")
        defaults.set(pageId, forKey: "PID")
        defaults.set(totalScore,forKey: "TS")
        defaults.set(firstendingDone, forKey: "FED")
        defaults.set(secondendingDone, forKey: "SED")
        defaults.set(thirdendingDone, forKey: "TED")
        defaults.set(fourthendingDone, forKey: "FOED")
    }
    
}


extension Answer{
    func whatQuestion(quest: Int)
    {
        switch quest {
        case 0:
            if levelPoint != 0
                {
                    questionS.text = "Учитель: Рада, что ты вызвался, Сычев! Ерохин совсем плох в этом деле. Покажи ему как решаются такие задачи. Вот твой пример: (18/2 + 11/22) : 5/10"
                    rightAnswer = 19
                }
            if levelPoint2 != 0
            {
                questionS.text = "Сычуш, помоги мне решить этот пример, а то я совсем не понимаю как его решить. Вот этот, под номером 3: Основания трапеции равны 4см и 10см. Диагональ трапеции делит среднюю линию на два отрезкаю Найдите длину большего из них."
                rightAnswer = 5
            }
            break
        case 10:
            if levelPoint != 0
                {
                questionS.text = "Подумав, что оценок у меня и так предостаточно, я решил пойти домой. На остановке я встретил свою соседку с этажа ниже. Она рассказала, что делает ремонт у себя в гостинной и попросила узнать, сколько будет стоить покупка паркетных досок, если площадь гостинной 35(кв.м), 1 доска занимает 0,25(кв.м), в одной пачке 8 досок, а пачка досок стоит 500р"
                rightAnswer = 9000
                }
            if levelPoint2 != 0
            {
                questionS.text = "Я решил, что лишняя пятерка мне не помешает, и потому остался чтобы помочь преподавателю. Ответов на задания у него не было и мне пришлось прорешивать каждое заново и сверять ответы. В основном все здачи были легкие, но одна показалась мне довольно трудной: В треугольнике ABC отрезок DE - средняя линия. Площадь треугольника CDE = 97. Найдите площадь ABC"
                rightAnswer = 388
            }
           
            break
        case 20:
            if levelPoint != 0
                {
                questionS.text = "Домашку я решил начать со своего любимого предмета - математики. Большинство заданий я решил еще в школе. Осталось лишь одно: При свободном падении тело прошло в первую секунду 5м, а в каждую следующую на 10м больше. Найдите глубину шахты, если падающее тело достигло лна через 5с после начала падения."
                rightAnswer = 125
                }
            if levelPoint2 != 0
            {
                questionS.text = "Подготовка к экзаменам шла полным ходом. Из первой части у меня осталась лишь геометрия. Ей я и решил заняться. Задача была такой: Боковая сторона равнобедренного треугольника = 4. Угол при основании, противолежащий основанию = 120(гр.). Найдите диаметр окружности, описаной около этого треугольника."
                rightAnswer = 8
            }
            break
        case 110:
            if levelPoint != 0
                {
                questionS.text = "Подготовка к экзаменам шла полным ходом. Из первой части у меня осталась лишь геометрия. Ей я и решил заняться. Задача была такой: Боковая сторона равнобедренного треугольника = 4. Угол при основании, противолежащий основанию = 120(гр.). Найдите диаметр окружности, описаной около этого треугольника."
                rightAnswer = 8
                }
            if levelPoint2 != 0
            {
                questionS.text = "Брат рассказал мне, что проблем с ПО нет, дело в том, что на компьютере стоял пароль, который он не знал, а подсказкой была одна задача, решить которую он был не в силах: Стрелок стреляет 4 раза по мишеням. Вероятность попадания в мишень при одном выстреле = 0.5 . Найдите вероятность того, что стрелок первые 3 раза попал в мишени, а последний - промахулся. Пароль - ответ умноженный на 10000"
                rightAnswer = 625
            }
            break
        case 200:
            if levelPoint != 0
                {
                questionS.text = "Брат рассказал мне, что проблем с ПО нет, дело в том, что на компьютере стоял пароль, который он не знал, а подсказкой была одна задача, решить которую он был не в силах: Стрелок стреляет 4 раза по мишеням. Вероятность попадания в мишень при одном выстреле = 0.5 . Найдите вероятность того, что стрелок первые 3 раза попал в мишени, а последний - промахулся. Пароль - ответ умноженный на 10000"
                rightAnswer = 625
                }
            if levelPoint2 != 0
            {
                questionS.text = "Я решил остаться с Катей и помочь ей. Очевидно это был ее день. Придя к ей я увидел на компьютере странный вирус, который блокировал доступ к файлам. Вирус требовал решить одну задачку, ответ на которую автоматически удалит вирус. Вот она: Клиент взял в банке кредит в размере 50000р. на 5 лет под 20% годовых. Какую сумму он должен вернуть в банк в конце срока, если весь кредит с процентами возвращается в банк после срока?"
                rightAnswer = 124416
            }
        case 100:
            if levelPoint != 0
                {
                questionS.text = "Я решил, что лишняя пятерка мне не помешает, и потому остался чтобы помочь преподавателю. Ответов на задания у него не было и мне пришлось прорешивать каждое заново и сверять ответы. В основном все здачи были легкие, но одна показалась мне довольно трудной: В треугольнике ABC отрезок DE - средняя линия. Площадь треугольника CDE = 97. Найдите площадь ABC"
                rightAnswer = 388
                }
            if levelPoint2 != 0
            {
                questionS.text = "Я подумал, что пора немного отвлечься от такого обильного количества задач и мы отправились с катей в кино. В кинотеатре была акция - каждому, кто решит геометрическую задачку дают ведерко попкорна в подарок. Я решил не упускать такой шанс. Вот какая была задача: Окружность с центром на стороне AC треугольника ABC пролходит через вершину С и касается прямой АВ в точке В. Найдите АС, если диаметр окружности = 7.5 , а АВ = 2"
                rightAnswer = 8
            }
            break
        default:
            break
        }
    }
}
extension Answer{
    func setPagea(seter: Int)
    {
        switch seter {
        case 0:
            whatQuestion(quest: pageId)
        case 1:
            whatQuestion(quest: pageId)
        case 2:
            whatQuestion(quest: pageId)
        default:
            break
        }
        
    }
    
}
extension Play{
    func whatText(quest: Int)
    {
        switch quest {
        case 0:
            textText.text = "Очередным холодным зимним утром я направился в школу. Все было как обычно. Сидя на уроке я листал соцсети, в то время как одноклассник не могу решить задачу у доски, а моя соседка Катя билась над задачей потруднее и выбор стоял между тем чтобы помочь ей или получить легкую оценку"
            let buttonText1 = NSAttributedString(string: "Выйти к доске")
            let buttonText2 = NSAttributedString(string: "Помочь соседке")
            firstVar.setAttributedTitle(buttonText1, for: .normal)
            secondVar.setAttributedTitle(buttonText2, for: .normal)
        case 10:
            textText.text = "Задача была легкой, как я и предполагал. Но несмотря на это моя самооценка немного поваысилась, на фоне победы над Ерохиным. Досидев до конца урока у меня осталось два варианта: пойти домой и заняться подготовкой к предстоящим экзаменам либо остаться и помочь преподавателю с проверкой самостоятельных работ."
            let buttonText1 = NSAttributedString(string: "Пойти домой")
            let buttonText2 = NSAttributedString(string: "Помочь")
            firstVar.setAttributedTitle(buttonText1, for: .normal)
            secondVar.setAttributedTitle(buttonText2, for: .normal)
            break
        case 20:
            textText.text = "Наконец, придя домой, передо мной стоял выбор, заняться домашкой или подготовиться к предстоящему экзамену."
            let buttonText1 = NSAttributedString(string: "Сделать дз")
            let buttonText2 = NSAttributedString(string: "Подготовка к экзамену")
            firstVar.setAttributedTitle(buttonText1, for: .normal)
            secondVar.setAttributedTitle(buttonText2, for: .normal)
            break
        case 100:
            textText.text = "Я помог Кате и она так обрадовалась решенной задаче, что предложила мне пойти с ней после школы в кино. Предложение было многообещающим, но наш преподаватель просил меня остаться и помочь ему с проверкой самостоятельных за дополнительную оценку. Я разрывался между двумя очень сочными предложениями"
            let buttonText1 = NSAttributedString(string: "Помочь преподавателю")
            let buttonText2 = NSAttributedString(string: "Пойти в кино")
            firstVar.setAttributedTitle(buttonText1, for: .normal)
            secondVar.setAttributedTitle(buttonText2, for: .normal)
            break
        case 110:
            textText.text = "Справившись с самостоятельными я направился в сторону дома. Усталость брала верх, но меня подбадривали несколько простых пятерок по алгебре. Я хотел потратить остаток времени на подготовку к экзамену, но вдруг раздался звонок от брата, который попросил меня помочь ему с установкой ПО на его компьютер."
            let buttonText1 = NSAttributedString(string: "Подготовка к экзамену")
            let buttonText2 = NSAttributedString(string: "Помочь брату")
            firstVar.setAttributedTitle(buttonText1, for: .normal)
            secondVar.setAttributedTitle(buttonText2, for: .normal)
            break
        case 200:
            textText.text = "Я чувствовал себя победителемю После просмотра кино я думал пойти домой, но она вновь попросила меня о помощи. На этот раз с вирусом, который каким-то неведанным образом оказался у нее на компьютере. Проблемы с компьютером были не только у Кати, но еще и у моего брата, который позвонил мне с просьбой помочь ему с установкой ПО"
            let buttonText1 = NSAttributedString(string: "Помочь брату")
            let buttonText2 = NSAttributedString(string: "Помочь Кате")
            firstVar.setAttributedTitle(buttonText1, for: .normal)
            secondVar.setAttributedTitle(buttonText2, for: .normal)
            break
        default:
            break
        }
    }
}

extension Play{
    func setPage(seter: Int)
    {
        switch seter {
        case 0:
            whatText(quest: pageId)
        case 1:
            whatText(quest: pageId)
        case 2:
            whatText(quest: pageId)
        default:
            break
        }
        
    }
    
}

extension Final{
    func whatFinal(what: Int){
        switch what {
        case 30:
            if firstendingDone == false{
                totalScore += 1
                firstendingDone = !firstendingDone
            }
            endingsText.text = "Все свое свободное время я решил посвятить решению задач предстоящего экзамена. Я так увлекся, что совсем забыл о том, что завтра биология и мне надо сдать конспект по изученной теме. Полученная двойка никак не омрачила меня, так как экзамен я сдал на высокий балл."
        
            break
        case 120:
            if secondendingDone == false{
                totalScore += 1
                secondendingDone = !secondendingDone
            }
            endingsText.text = "Я решил, что времени подгтовиться экзамену у меня будет предостаточно и занялся своей домашней работой. Помимо математики была еще тонна скучны и неинтересных мне предметов. Тем не менее я усешно справился с их решением, но на подготовку осталась совсем мало времени. Надо собраться с силами"
         
            break
        case 210:
            if thirdendingDone == false{
                totalScore += 1
                thirdendingDone = !thirdendingDone
            }
            endingsText.text = "Я помог брату с <<установкой необходимых ему программ>>. Взглянув на часы я увидел что уже совсем поздно и времени на решения своих проблем у меня не остается. Но тем не менее я был рад помочь другим людям. Надеюсь мне это зачтется в будущем."
            break
        case 300:
            if fourthendingDone == false{
                totalScore += 1
                fourthendingDone = !fourthendingDone
            }
            endingsText.text = "Вирус был успешно удален с компьютера Кати. Она угостила меня чаем с вкусняшками и проводила до подьъезда. Я поехал домой, с грустью осознавая, что не помог другим людям сегодня и не успел решить свои проблемы. Тем не менее мою душу грела перспектива налаживания моей личной жизни."
            break
        default:
            break
        }
    }
}





class Statistics: UIViewController{
 

    @IBOutlet weak var wrongAnswers: UILabel!
    @IBOutlet weak var cleanProgress: UIButton!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var myScore: UILabel!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        totalScore = defaults.integer(forKey: "TS")
        myScore.updateScore(to: totalScore)
        let storage = Storage.storage()
        let storageRef = storage.reference()
        let ref = storageRef.child("gradient_2.png")
        backgroundImage.sd_setImage(with: ref)
        wrongAnswers.updateID(to: wrongAnswer)
        wrongAnswers.textColor = .blue
        wrongAnswers.shadowColor = .black
        wrongAnswers.textAlignment = .center
        myScore.textColor = .blue
        myScore.shadowColor = .black
        myScore.textAlignment = .center
        cleanProgress.layer.borderWidth = 3
        cleanProgress.layer.borderColor = UIColor.blue.cgColor
       
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
        defaults.set(totalScore,forKey: "TS")
        defaults.set(levelNav, forKey: "LevelNav")
        defaults.set(pageId, forKey: "PID")
        defaults.set(firstendingDone, forKey: "FED")
        defaults.set(secondendingDone, forKey: "SED")
        defaults.set(thirdendingDone, forKey: "TED")
        defaults.set(fourthendingDone, forKey: "FOED")
        myScore.updateScore(to: totalScore)
        wrongAnswers.updateID(to: wrongAnswer)
     
    }
}



extension UILabel{
    func updateScore(to totalScore: Int){
        self.text = "Разблокировано концовок: \(totalScore)/4"
    }
}
extension UILabel{
    func updateID(to totalScore: Int){
        self.text = "Кол-во ошибок: \(totalScore)"
    }
}



