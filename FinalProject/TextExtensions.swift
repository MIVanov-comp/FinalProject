//
//  TextExtensions.swift
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


extension AnswerViewController{
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

extension AnswerViewController{
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

extension GameViewController{
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
extension GameViewController{
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
extension FinalViewController{
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







