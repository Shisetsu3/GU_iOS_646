import Foundation

enum EngineState: String {
    case start = "Запущен"
    case stop = "Заглушен"
}

enum WindowState: String {
    case open = "Открыты"
    case close = "Закрыты"
}

enum TrunkState: String {
    case full = "Полный"
    case empty = "Пустой"
}

enum Color: String {
    case white = "Белый"
    case black = "Черный"
    case red = "Красный"
    case blue = "Синий"
}

class SphericalCarInVacuum {
        
    let brand : String
    let model : String
    var color : Color
    
    func changeColor(Color:Color) {} //пустой метод
    
    let release : Int
    var trunkVolume : Double {
        willSet {
            if (trunkState == .empty) && (trunkVolume > 0) && (trunkVolume != 0) && (newValue < trunkVolume) {
                let space = trunkVolume - newValue
                print ("\(brand) \(model) свободный объем в багажнике: \(space)")
            } else { print("Вы или пытаетесь положить слишком габаритный груз в багажник \(brand) \(model) или там уже нет места :(")}
        }
    }
    var engineState : EngineState {
        willSet {
            if newValue == .start {
                print ("\(brand) \(model) двигатель будет заведен")
            } else {print("\(brand) \(model) двигатель будет заглушен")}
        }
    }
    var windowState : WindowState {
        willSet {
            if newValue == .open {
                print("\(brand) \(model) окна будут открыты")
            } else { print("\(brand) \(model) окна будут закрыты") }
        }
    }
    var trunkState : TrunkState
    func emptyTrunck() {
        self.trunkState = .empty
        print ("\(brand) \(model) багажник пустой")
    }
    
    init(brand: String, model: String, color: Color, release: Int, trunkVolume: Double, engineState: EngineState, windowState: WindowState, trunkState: TrunkState) {
        self.brand = brand
        self.model = model
        self.color = color
        self.release = release
        self.trunkVolume = trunkVolume
        self.engineState = engineState
        self.windowState = windowState
        self.trunkState = trunkState
    }
}

class SportCar: SphericalCarInVacuum {
    
    enum SpeedLimit: String {
        case on = "Включен"
        case off = "Выключен"
    }
    
    var limitState: SpeedLimit
    static var carSpoiler = true
    
    init(brand: String, model: String, color: Color, release: Int, trunkVolume: Double, engineState: EngineState, windowState: WindowState, trunkState: TrunkState, limitState: SpeedLimit) {
        
        self.limitState = limitState
        
        super.init(brand: brand, model: model, color: color, release: release, trunkVolume: trunkVolume, engineState: engineState, windowState: windowState, trunkState: trunkState)
    }
    
    func limitOn() {
        limitState = .on
        print("\(brand) \(model) Включен ограничитель скорости")
    }
    
    func limitOff() {
        limitState = .off
        print("\(brand) \(model) Выключен ограничитель скорости")
    }
    
    override func emptyTrunck() {
        self.trunkState = .empty
        print ("Забрали свой мини пакетик из 'багажника' \(brand) \(model)?:)")
    }
    
    override func changeColor(Color:Color) {
        switch Color {
        case .red:
            print("Горячий! Красный! Твой! Цвет даёт + 10 к ЧСВ")
        default:
            print("Серьёзно!? Нет, конечно если вы не любите красный цвет, то не страшно. Но давайте вы ещё раз подумаете над цветом вашего спорткара?")
        }
    }
    
    func CarInfo(){
        print ("""
            -------------------------------------------------
            Данные по автомобилю:
            Модель: \(self.brand) \(self.model)
            Год выпуска: \(self.release)
            Цвет: \(self.color.rawValue)
            Свободное место в багажнике: \(self.trunkVolume)
            Состояние двигателя: \(self.engineState.rawValue)
            Ограничитель скорости: \(self.limitState.rawValue)
            """)
    }
}

class TruckCar: SphericalCarInVacuum {
    enum OverloadState: String {
        case overload = "Перегрузка"
        case no_overload = "Нет перегрузки"
    }
    
    var overload: OverloadState
    static var cargoBody = true
    
    init(brand: String, model: String, color: Color, release: Int, trunkVolume: Double, engineState: EngineState, windowState: WindowState, trunkState: TrunkState, overload: OverloadState) {
        
        self.overload = overload
        
        super.init(brand: brand, model: model, color: color, release: release, trunkVolume: trunkVolume, engineState: engineState, windowState: windowState, trunkState: trunkState)
    }
    
    func overloaded() {
        overload = .overload
        print("Внимание! Перегрузка \(brand) \(model)! Движение запрещено!")
    }
    
    func noOverload() {
        overload = .no_overload
        print("Нет перегрузки \(brand) \(model)! Движение разрешено!")
    }
    override func changeColor(Color:Color) {
        switch Color {
        case .black:
            print("Вы истинный гуру в цветовых палитрах грузовых авто!")
        default:
            print("Зачем вам разноцветный грузовик \(brand) \(model)? Только черный - только хардкор!")
        }
    }
    
    func CarInfo(){
        print ("""
            -------------------------------------------------
            Данные по автомобилю:
            Модель: \(self.brand) \(self.model)
            Год выпуска: \(self.release)
            Цвет: \(self.color.rawValue)
            Свободное место в багажнике: \(self.trunkVolume)
            Состояние двигателя: \(self.engineState.rawValue)
            Состояние перегрузки: \(self.overload.rawValue)
            """)
    }
}

var sportCar1 = SportCar(brand: "Ауди", model: "А3", color: .white, release: 2016, trunkVolume: 580.0 , engineState: .stop, windowState: .open, trunkState: .empty, limitState: .on)
var sportCar2 = SportCar(brand: "Ламборгини", model: "Дьябло", color: .blue, release: 1990, trunkVolume: 4.0, engineState: .stop, windowState: .close, trunkState: .full, limitState: .off)

var truckCar1 = TruckCar(brand: "Хендэ", model: "Портер", color: .black, release: 2012, trunkVolume: 3000.0, engineState: .start, windowState: .open, trunkState: .full, overload: .no_overload)
var truckCar2 = TruckCar(brand: "Лада", model: "Ларгус", color: .black, release: 2013, trunkVolume: 6000.0, engineState: .start, windowState: .close, trunkState: .empty, overload: .overload)

sportCar1.engineState = .start
sportCar2.trunkVolume = 340.0
truckCar1.changeColor(Color: .white)
truckCar2.trunkVolume = 890.0
sportCar2.emptyTrunck()
truckCar2.trunkVolume = 80.9
sportCar2.windowState = .close
sportCar2.changeColor(Color: .white)
truckCar2.changeColor(Color: .black)
sportCar2.limitOff()
truckCar2.overloaded()


truckCar1.CarInfo()
truckCar2.CarInfo()
sportCar1.CarInfo()
sportCar2.CarInfo()

