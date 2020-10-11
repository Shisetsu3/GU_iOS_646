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

enum SpeedLimit: String {
    case on = "Включен"
    case off = "Выключен"
}

enum OverloadState: String {
    case overload = "Перегрузка"
    case no_overload = "Нет перегрузки"
}

enum CarSpoilerState: String {
    case pullUp = "Поднят"
    case pullDown = "Опущен"
}

enum CargoBodyState: String {
    case cargo = "Наличие самосвального кузова"
    case noCargo = "Самосвальный кузов отсутствует"
}

//---------

protocol SphericalCarInVacuumProtocol: class {
    var brand : String {get}
    var model : String {get}
    var color : Color {get set}
    var release : Int {get set}
    var trunkVolume : Double {get set}
    var engineState : EngineState {get set}
    var windowState : WindowState {get set}
    var trunkState : TrunkState {get set}
    var limitState: SpeedLimit {get set}
    var overload: OverloadState {get set}
    
    func changeSpeedLimit(to state: SpeedLimit)
    func changeOverloadState(to state: OverloadState)
}

extension SphericalCarInVacuumProtocol {
    func changeSpeedLimit(to state: SpeedLimit) {
        self.limitState = state
        print("Ограничитель скорости: \(state == .off ? "Вык" : "Вк")лючен")
    }
    func changeOverloadState(to state: OverloadState) {
        self.overload = state
        print("Состояние перегрузки: \(state == .no_overload  ? "Перегразука отсутствует" : "Автомобиль перегружен!")")
    }
}

//---------

class SportCar: SphericalCarInVacuumProtocol {
    var brand: String
    var model: String
    var color: Color
    var release: Int
    var trunkVolume: Double
    var engineState: EngineState
    var windowState: WindowState
    var trunkState: TrunkState
    var limitState: SpeedLimit
    var overload: OverloadState
    var carSpoiler: CarSpoilerState
    init(brand: String, model: String, color: Color, release: Int, trunkVolume: Double, engineState: EngineState, windowState: WindowState, trunkState: TrunkState, limitState: SpeedLimit, overload: OverloadState, carSpoiler: CarSpoilerState) {
        self.brand = brand
        self.model = model
        self.color = color
        self.release = release
        self.trunkVolume = trunkVolume
        self.engineState = engineState
        self.windowState = windowState
        self.trunkState = trunkState
        self.limitState = limitState
        self.overload = overload
        self.carSpoiler = carSpoiler
    }
    
    func emptyTrunck() {
        self.trunkState = .empty
        print ("Забрали свой мини пакетик из 'багажника' \(brand) \(model)?:)")
    }
    
    func changeColor(Color:Color) {
        switch Color {
        case .red:
            print("Горячий! Красный! Твой! Цвет даёт + 10 к ЧСВ")
        default:
            print("Серьёзно!? Нет, конечно если вы не любите красный цвет, то не страшно. Но давайте вы ещё раз подумаете над цветом вашего спорткара?")
        }
    }
}

extension SportCar : CustomStringConvertible {
    var description: String {
        """
        ------------------------------------------------
        Данные по спорткару:
        Модель: \(brand) \(model)
        Год выпуска: \(release)
        Цвет: \(color.rawValue)
        Свободное место в багажнике: \(trunkVolume)
        Состояние двигателя: \(engineState.rawValue)
        Состояние перегрузки: \(overload.rawValue)
        Ограничитель скорости: \(limitState.rawValue)
        """
        }
    }

class TruckCar: SphericalCarInVacuumProtocol {
    var brand: String
    var model: String
    var color: Color
    var release: Int
    var trunkVolume: Double
    var engineState: EngineState
    var windowState: WindowState
    var trunkState: TrunkState
    var limitState: SpeedLimit
    var overload: OverloadState
    var cargoBody: CargoBodyState
    init(brand: String, model: String, color: Color, release: Int, trunkVolume: Double, engineState: EngineState, windowState: WindowState, trunkState: TrunkState, limitState: SpeedLimit, overload: OverloadState, cargoBody: CargoBodyState) {
        self.brand = brand
        self.model = model
        self.color = color
        self.release = release
        self.trunkVolume = trunkVolume
        self.engineState = engineState
        self.windowState = windowState
        self.trunkState = trunkState
        self.limitState = limitState
        self.overload = overload
        self.cargoBody = cargoBody
    }
    
    func changeColor(Color:Color) {
        switch Color {
        case .black:
            print("Вы истинный гуру в цветовых палитрах грузовых авто!")
        default:
            print("Зачем вам разноцветный грузовик \(brand) \(model)? Только черный - только хардкор!")
        }
    }
}

extension TruckCar : CustomStringConvertible {
    var description: String {
        """
        ------------------------------------------------
        Данные по грузовому автомобилю:
        Модель: \(brand) \(model)
        Год выпуска: \(release)
        Цвет: \(color.rawValue)
        Свободное место в багажнике: \(trunkVolume)
        Состояние двигателя: \(engineState.rawValue)
        Состояние перегрузки: \(overload.rawValue)
        Ограничитель скорости: \(limitState.rawValue)
        """
        }
    }

var sportCar1 = SportCar(brand: "Ауди", model: "А3", color: .white, release: 2016, trunkVolume: 580.0 , engineState: .stop, windowState: .open, trunkState: .empty, limitState: .on, overload: .no_overload, carSpoiler: .pullUp)
var sportCar2 = SportCar(brand: "Ламборгини", model: "Дьябло", color: .blue, release: 1990, trunkVolume: 4.0, engineState: .stop, windowState: .close, trunkState: .full, limitState: .off, overload: .no_overload, carSpoiler: .pullDown)


var truckCar1 = TruckCar(brand: "Хендэ", model: "Портер", color: .black, release: 2012, trunkVolume: 3000.0, engineState: .start, windowState: .open, trunkState: .full, limitState: .off, overload: .no_overload, cargoBody: .cargo)
var truckCar2 = TruckCar(brand: "Лада", model: "Ларгус", color: .black, release: 2013, trunkVolume: 6000.0, engineState: .start, windowState: .close, trunkState: .empty, limitState: .off, overload: .overload, cargoBody: .cargo)

sportCar1.engineState = .start
sportCar2.trunkVolume = 340.0
truckCar1.changeColor(Color: .white)
truckCar2.trunkVolume = 890.0
sportCar2.emptyTrunck()
truckCar2.trunkVolume = 80.9
sportCar2.windowState = .close
sportCar2.changeColor(Color: .white)
sportCar2.changeColor(Color: .red)
truckCar2.changeColor(Color: .black)
sportCar2.changeSpeedLimit(to: .on)
truckCar2.changeOverloadState(to: .overload)

print(truckCar1.description)
print(truckCar2.description)
print(sportCar1.description)
print(sportCar2.description)

