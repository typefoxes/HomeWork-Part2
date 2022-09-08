import UIKit

class ViewController: UIViewController, StepProtocol {

    /* Задание 4: В чем отличие класса от протокола?
    
     Класс - это описание для какого-либо объекта, конструктор.
     Протокол - свод "инструкций", по которым может быть составлен класс. */
    
    //Задание: 5: Могут ли реализовывать несколько протоколов:
    /*
     a. классы (Class)
     b. структуры (Struct)
     c. перечисления (Enum)
     d. кортежи (Tuples)
     */ // MARK: примеры ниже
    
    
    /* Задание 6: Создайте протоколы для:
     a) Игры в шахматы против компьютера: 1) протокол-делегат с функцией, через которую шахматный движок будет сообщать о ходе компьютера (с какой на какую клетку); 2) протокол для шахматного движка, в который передаётся ход фигуры игрока (с какой на какую клетку); Double-свойство, возвращающее текущую оценку позиции (без возможности изменения этого свойства) и свойство делегата.
     b) Компьютерной игры: один протокол для всех, кто может летать (Flyable), второй — для тех, кого можно отрисовывать в приложении (Drawable). Напишите класс, который реализует эти два протокола. */
    
    // Задание 7: Создайте расширение с функцией для:
    /*
     a. CGRect, которая возвращает CGPoint с центром этого CGRect’а
     b. CGRect, которая возвращает площадь этого CGRect’а
     c. UIView, которое анимированно её скрывает (делает alpha = 0)
     d. протокола Comparable, на вход получает еще два параметра того же типа: первое ограничивает минимальное значение, второе – максимальное; возвращает текущее значение. ограниченное этими двумя параметрами. Пример использования:
     7.bound(min: 10, max: 21) -> 10
     7.bound(min: 3, max: 6) -> 6
     7.bound(min: 3, max: 10) -> 7
     e. Array, который содержит элементы типа Int: функцию для подсчета суммы всех элементов
     */
    
    // Задание 8: В чем основная идея Protocol oriented programming?
    // в том, чтобы использовать протоколы вместо классов, т.к. наследование классов ограничено одним суперклассом, а протоколов может быть сколько угодно
    
  
    
    var classGame : Chess!
    private let comp = Chess(name: "comp")
    private let player = Chess(name: "player")
    
    func compstep(newpos: CGPoint) {
        self.comp.pos = newpos
    }
    
    func playerstep(newpos: CGPoint) {
        self.player.pos = newpos
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.classGame = Chess()
        self.classGame.delegate = self
        
        // 5. Могут ли реализовывать несколько протоколов:
        print(EnumClock.clock())
        EnumClock.Answer()
        print(EnumClock.clock())
        print("\n")
        
        // 6. Создайте протоколы для:
        
        comp.pos = CGPoint(x: 0, y: 1)
        player.pos = CGPoint(x: 3, y: 3)
        
        classGame.delegate?.compstep(newpos: CGPoint(x: 99, y: 99))
        classGame.delegate?.playerstep(newpos: CGPoint(x: 123, y: 123))
        
        print("\n")
        Player(name: "Player").draw()
        Bird(name: "Bird").fly() 
        print("\n")
        
        // 7. Создайте расширение с функцией для:
        print(ItemCenter)
        print(ItemArea)
        print("\n")
        let Square = essence
        Square.backgroundColor = .systemRed
        Square.frame.size = CGSize(width: 100, height: 100)
        Square.frame = CGRect(
            x: self.view.frame.midX - Square.frame.center().x,
            y: self.view.frame.midY - Square.frame.center().y,
            width: Square.frame.width,
            height: Square.frame.height)
        Square.alpha0()
        self.view.addSubview(Square)
        
        print(number.minMax(min: 10, max: 21))
        print(number.minMax(min: 3, max: 6))
        print(number.minMax(min: 3, max: 10))
        print("\n")
        print(IntArray.sum())
        print("\n")
        
        // MARK: UPDATE
        print(Tuples)
    }
}

// -- 5. Могут ли реализовывать несколько протоколов:
// a. классы (Class)
protocol CLASSprotocolA {
    var name: String { get set }
}
protocol CLASSprotocolB {
    var age: Int {get set }
}
class CLASS: CLASSprotocolA, CLASSprotocolB {
    
    var name: String = "username"
    var age: Int = 25245
}
//b. структуры (Struct)
protocol STRUCTprotocolA {
    var text: String { get set }
}
protocol STRUCTprotocolB {
    var number: Int { get set }
}
struct STRUCT: STRUCTprotocolA, STRUCTprotocolB {
    var text: String
    var number: Int
}
//c. перечисления (Enum)
protocol EnumProtocolA {
    var Question: String { get }
}
protocol EnumProtocolB {
    mutating func Answer()
}
extension EnumProtocolB {
    func TellTime() -> String {
        "\(Date())"
    }
}
enum Enum: EnumProtocolA, EnumProtocolB {
    // Перечисления не могут содержать хранимые переменные либо константы, но можно сделать так
    case WhatTimeIsIt, CheckTime
    
    var Question: String { self.clock() }
    
    func clock() -> String {
        switch self {
        case .WhatTimeIsIt:
            return "Который сейчас час?"
        case .CheckTime:
            return "\(TellTime())"
        }
    }
    mutating func Answer() {
        self = Enum.CheckTime
    }
}
var EnumClock = Enum.WhatTimeIsIt

//d. кортежи (Tuples)

protocol StructProtocolA {
    var Question: String { get }
}
protocol StructProtocolB {
    mutating func Answer()
}
struct TuplesStruct: StructProtocolA, StructProtocolB {
    
    var Question: String
    
    mutating func Answer() {
        print("PUK")
    }
    
    var name: String
    var age: Int
}
let Tuples = TuplesStruct(Question: "where am from?", name: "Jopa", age: 0)
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -


// -- 6. Создайте протоколы для:
//a. игры в шахматы против компьютера: протокол-делегат с функцией, через которую шахматный движок будет сообщать о ходе компьютера (с какой на какую клеточку); протокол для шахматного движка, в который передается ход фигуры игрока (с какой на какую клеточку), Double свойство, возвращающая текущую оценку позиции (без возможности изменения этого свойства) и свойство делегата;
protocol StepProtocol {
    func compstep(newpos: CGPoint)
    func playerstep(newpos: CGPoint)
}

protocol PosProtocol {
    var pos: CGPoint { get set }
}

class Chess: PosProtocol {
    var delegate: StepProtocol?
    
    var name: String = ""
    
    required init(name: String) {
        self.name = name
    }
    
    convenience init() {
        self.init(name: "noname")
    }
    
    var pos: CGPoint {
        get { return .init() }
        set { print("\(self.name) \(newValue)") }
    }
}


// b. компьютерной игры: один протокол для всех, кто может летать (Flyable), второй – для тех, кого можно отрисовывать приложении (Drawable).
protocol Flyable {
    func fly()
    init(name: String)
    func draw()
}
protocol Drawable {
    var name: String { get set }
    func draw()
}
class Game: Drawable {
    var name: String = ""
    
    required init(name: String) {
        self.name = name
    }
    
    func draw() { // MARK: допустим, что все объекты отрисованы по-умолчанию
        print("\(self.name) отрисован")
    }
}
class Player: Game { }

class Bird: Game, Flyable {
    func fly() {
        print("\(self.name) летает")
    }
}
// -- 7. Создайте расширение с функцией для:
//a. CGRect, которая возвращает CGPoint с центром этого CGRect’а
extension CGRect {
    func center() -> CGPoint {
        CGPoint(x: midX, y: midY)
    }
}
var Item = CGRect(x: 0, y: 0, width: 10, height: 10)
let ItemCenter = Item.center() // (5.0, 5.0)
//b. CGRect, которая возвращает площадь этого CGRect’а
extension CGRect {
    func area() -> CGFloat {
        width * height
    }
}
let ItemArea = Item.area() // 100.0
//c. UIView, которое анимированно её скрывает (делает alpha = 0)
extension UIView {
    func alpha0() {
        UIView.animate(withDuration: 0.5, delay: 0, options: [.repeat,.autoreverse], animations: {
            self.alpha = 0
        })}
}
let essence = UIView()
//d. протокола Comparable, на вход получает еще два параметра того же типа: первое ограничивает минимальное значение, второе – максимальное; возвращает текущее значение. ограниченное этими двумя параметрами. Пример использования:
let number = 7
extension Comparable {
    func minMax(min: Self, max: Self) -> Self {
        if (self < min) {
            return min
        } else if (self > max) {
            return max
        }
        return self
    }
}
//e. Array, который содержит элементы типа Int: функцию для подсчета суммы всех элементов
extension Sequence where Element: AdditiveArithmetic {

    func sum() -> Element {
        return reduce(0 as! Self.Element, +)
    }
}
let IntArray = (0...10)

