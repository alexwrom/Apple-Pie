//
//  ViewController.swift
//  Apple Pie
//
//  Created by Alexwrom on 19.04.2021.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet weak var image: UIImageView!
    @IBOutlet var letteralsButtons: [UIButton]!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var btnNewRound: UIButton!
    @IBOutlet weak var keyBoard: UIStackView!
    
    // MARK: - Properties
    var currentGame : Game!
    let incorrectAllowed = 7
    var statesCapital = [
        "Вена",
        "Баку",
        "Нассау",
        "Манама",
        "Дакка",
        "Бриджтаун",
        "Минск",
        "Брюссель",
        "Бельмопан",
        "Порто-Ново",
        "Тхимпху",
        "Сукре",
        "Сараево",
        "Габороне",
        "Бразилиа",
        "Бандар-Сери-Багаван",
        "София",
        "Уагадугу",
        "Бужумбура",
        "Пномпень",
        "Яунде",
        "Оттава",
        "Прая",
        "Банги",
        "Нджамена",
        "Сантьяго",
        "Пекин",
        "Санта-Фе-де-Богота",
        "Морони",
        "Браззавиль",
        "Киншаса",
        "Сан-Хосе",
        "Ямусукро",
        "Загреб",
        "Гавана",
        "Никосия",
        "Прага",
        "Копенгаген",
        "Джибути",
        "Розо",
        "Санто-Доминго",
        "Дили",
        "Кито",
        "Каир",
        "Сан-Сальвадор",
        "Малабо",
        "Асмэра",
        "Таллин",
        "Аддис-Абеба",
        "Сува",
        "Хельсинки",
        "Париж",
        "Либревиль",
        "Банжул",
        "Тбилиси",
        "Берлин",
        "Аккра",
        "Афины",
        "Сент-Джорджес",
        "Гватемала",
        "Бисау",
        "Конакри",
        "Джорджтаун",
        "Порт-о-Пренс",
        "Тегусигальпа",
        "Будапешт",
        "Рейкьявик",
        "Нью-Дели",
        "Джакарта",
        "Тегеран",
        "Багдад",
        "Дублин",
        "Иерусалим",
        "Рим",
        "Кингстон",
        "Токио",
        "Амман",
        "Астана",
        "Найроби",
        "Южная Тарава",
        "Пхеньян",
        "Сеул",
        "Эль-Кувейт",
        "Бишкек",
        "Вьентьян",
        "Рига",
        "Бейрут",
        "Масеру",
        "Монровия",
        "Триполи",
        "Вадуц",
        "Вильнюс",
        "Люксембург",
        "Скопье",
        "Антананариву",
        "Лилонгве",
        "Куала-Лумпур",
        "Мале",
        "Бамако",
        "Валлетта",
        "Маджуро",
        "Нуакшот",
        "Порт-Луи",
        "Мехико",
        "Паликир",
        "Кишинев",
        "Монако",
        "Улан-Батор",
        "Подгорица",
        "Рабат",
        "Мапуту",
        "Найпьидо",
        "Виндхук",
        "Катманду",
        "Амстердам",
        "Веллингтон",
        "Манагуа",
        "Ниамей",
        "Абуджа",
        "Осло",
        "Маскат",
        "Исламабад",
        "Мелекеок",
        "Панама",
        "Порт-Морсби",
        "Асунсьон",
        "Лима",
        "Манила",
        "Варшава",
        "Лиссабон",
        "Доха",
        "Бухарест",
        "Москва",
        "Кигали",
        "Бастер",
        "Кастри",
        "Кингстаун",
        "Апиа",
        "Сан-Марино",
        "Сан-Томе",
        "Эр-Рияд",
        "Дакар",
        "Белград",
        "Виктория",
        "Фритаун",
        "Сингапур",
        "Братислава",
        "Любляна",
        "Хониара",
        "Могадишо",
        "Претория",
        "Мадрид",
        "Коломбо",
        "Хартум",
        "Парамарибо",
        "Мбабане",
        "Стокгольм",
        "Берн",
        "Дамаск",
        "Душанбе",
        "Додома",
        "Бангкок",
        "Ломе",
        "Нукуалофа",
        "Порт-оф-Спейн",
        "Тунис",
        "Анкара",
        "Ашхабад",
        "Фунафути",
        "Кампала",
        "Киев",
        "Абу-Даби",
        "Лондон",
        "Вашингтон",
        "Монтевидео",
        "Ташкент",
        "Порт-Вила",
        "Ватикан",
        "Каракас",
        "Ханой",
        "Сана",
        "Лусака",
        "Хараре"
    ]
    var totalWins = 0
    var totalLosses = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
    }
    
    func updateWordLabel() {
        var tempWord : [String] = []
        for letter in currentGame.gussedWord{
            tempWord.append(String(letter))
        }
        textLabel.text = tempWord.joined(separator: " ")
    }
    
    func newRound() {
        let newWord = statesCapital[Int.random(in: 0...statesCapital.count - 1)]
        currentGame = Game(word: newWord, incorrectMoves: incorrectAllowed)
        buttonsEnable()
        updateUI()
    }
    
    func buttonsEnable() {
        for button in letteralsButtons{
            button.isEnabled = true
            button.setTitleColor(.black, for: .normal)
        }
    }
    
    func updateState() {
        if currentGame.word == currentGame.gussedWord{
            totalWins += 1
            btnNewRound.setTitle("Вы угадали столицу \"\(currentGame.gussedWord)\". Далее", for: .normal)
            btnNewRound.isHidden = false
        } else {
            if currentGame.incorrectMoves < 1{
                totalLosses += 1
                updateUI()
                btnNewRound.setTitle("Вы не угадали столицу \"\(currentGame.word)\". Далее", for: .normal)
                btnNewRound.isHidden = false
            } else {
                updateUI()
            }
        }
        keyBoard.isHidden = !btnNewRound.isHidden
    }
    
    func updateUI() {
        let fileName = "View\(currentGame.incorrectMoves < 0 ? 0 : 7 - currentGame.incorrectMoves)"
        image.image = UIImage(named: fileName)
        updateWordLabel()
        scoreLabel.text = "Score:Wins - \(totalWins), Losses - \(totalLosses)"
    }
    
    // MARK: - IB Actions
    
    @IBAction func newRoundStart(_ sender: Any) {
        newRound()
        keyBoard.isHidden = false
        btnNewRound.isHidden = true
    }
    
    @IBAction func clickButton(_ sender: UIButton) {
        sender.isEnabled = false
        let letter = sender.title(for: .normal)!
        let oldIncorrectAllowed = currentGame.incorrectMoves
        currentGame.playerGussed(letter: Character(letter))
        sender.setTitleColor(oldIncorrectAllowed == currentGame.incorrectMoves ? .green : .red, for: .normal)
        updateState()
    }
}

