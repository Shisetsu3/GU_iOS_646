import Foundation

enum engineState {
    case start, stop
}

enum windowState {
    case open, close
}

enum trunkState {
    case full, empty
}

class SphericalCarInVacuum {
    
    func someEmptyMethod() {
        
    }
    
    let brand : String
    let model : String
    var color : String
    func changeColor(c:String) {
        switch c {
        case "white":
            self.color = "white"
        case "black":
            self.color = "black"
        case "red":
            self.color = "red"
        case "blue":
            self.color = "blue"
        default:
            print("Вы указали цвет, которого нет в базе.")
        }
    }
    let release : Int
    var trunkVolume : Double {
        willSet {
            if (trunkState == .empty) && (trunkVolume > 0) && (trunkVolume != 0) && (newValue < trunkVolume) {
                let space = trunkVolume - newValue
                print ("\(brand) \(model) свободный объем в багажнике: \(space)")
            } else { print("Вы или пытаетесь положить слишком габаритный груз в багажник \(brand) \(model) или там уже нет места :(")}
        }
    }
    var engineState : engineState {
        willSet {
            if newValue == .start {
                print ("\(brand) \(model) двигатель заведен")
            } else {print("\(brand) \(model) двигатель заглушен")}
        }
    }
    var windowState : windowState {
        willSet {
            if newValue == .open {
                print("\(brand) \(model) окна открыты")
            } else { print("\(brand) \(model) окна закрыты") }
        }
    }
    var trunkState : trunkState
    func emptyTrunck() {
        self.trunkState = .empty
        print ("\(brand) \(model) багажник пустой")
    }
    
    init(brand: String, model: String, color: String, release: Int, trunkVolume: Double, engineState: engineState, windowState: windowState, trunkState: trunkState) {
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
    enum speedLimit {
        case on, off
    }
    
    var limitState: speedLimit
    static var carSpoiler = true
    
    init(brand: String, model: String, color: String, release: Int, trunkVolume: Double, engineState: engineState, windowState: windowState, trunkState: trunkState, limitState: speedLimit) {
        
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
}

class TruckCar: SphericalCarInVacuum {
    enum overloadState {
        case overload, no_overload
    }
    
    var overload: overloadState
    static var cargoBody = true
    
    init(brand: String, model: String, color: String, release: Int, trunkVolume: Double, engineState: engineState, windowState: windowState, trunkState: trunkState, overload: overloadState) {
        
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
    override func changeColor(c:String) {
        switch c {
        case "black":
            self.color = "black"
        default:
            print("Зачем вам разноцветный грузовик \(brand) \(model)? Только черный - только хардкор!")
        }
    }
}

var sportCar1 = SportCar(brand: "Ауди", model: "А3", color: "red", release: 2016, trunkVolume: 580.0 , engineState: .stop, windowState: .open, trunkState: .empty, limitState: .on)
var sportCar2 = SportCar(brand: "Ламборгини", model: "Дьябло", color: "blue", release: 1990, trunkVolume: 4.0, engineState: .stop, windowState: .close, trunkState: .full, limitState: .off)

var truckCar1 = TruckCar(brand: "Хендэ", model: "Портер", color: "black", release: 2012, trunkVolume: 3000.0, engineState: .start, windowState: .open, trunkState: .full, overload: .no_overload)
var truckCar2 = TruckCar(brand: "Лада", model: "Ларгус", color: "black", release: 2013, trunkVolume: 6000.0, engineState: .start, windowState: .close, trunkState: .empty, overload: .overload)

sportCar1.engineState = .start
sportCar2.trunkVolume = 340.0
truckCar1.changeColor(c: "red")
truckCar2.trunkVolume = 890.0
sportCar2.emptyTrunck()
truckCar2.trunkVolume = 80.9
sportCar2.windowState = .close
truckCar2.changeColor(c: "white")
sportCar2.limitOff()
truckCar2.overloaded()
print("----------")
print ("""
    Данные по первому спорткару:
    Модель: \(sportCar2.brand) \(sportCar2.model)
    Год выпуска: \(sportCar2.release)
    Цвет: \(String(describing: sportCar2.color))
    Свободное место в багажнике: \(sportCar2.trunkVolume)
    Состояние двигателя: \(sportCar2.engineState)
    Ограничители: \(sportCar2.limitState)
    """)

