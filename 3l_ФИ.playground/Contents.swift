import Foundation
import Cocoa

enum engineState {
    case start, stop
}

enum windowState {
    case open, close
}

enum trunkState {
    case full, empty
}

struct someCar {
    let brand : String
    let model : String
    var color : String
    mutating func changeColor(c:String) {
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
    mutating func emptyTrunck() {
        self.trunkState = .empty
        print ("\(brand) \(model) багажник пустой")
    }
}

struct someTruck {
    let brand : String
    let model : String
    var color : String
    mutating func changeColor(c:String) {
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
    var bodyVolume : Double {
        willSet {
            if (trunkState == .empty) && (bodyVolume > 0) && (bodyVolume != 0) && (newValue < bodyVolume) {
                let space = bodyVolume - newValue
                print ("\(brand) \(model) свободный объем в багажнике: \(space)")
            } else { print("Вы или пытаетесь положить слишком габаритный груз в кузов \(brand) \(model) или там уже нет места :(")}
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
    mutating func emptyTrunck() {
        self.trunkState = .empty
        print ("\(brand) \(model) кузов пустой")
    }
}

var car1 = someCar(brand: "Ауди", model: "А3", color: "red", release: 2016, trunkVolume: 580.0 , engineState: .stop, windowState: .open, trunkState: .empty)
var car2 = someCar(brand: "Жигули", model: "Семерка", color: "blue", release: 2000, trunkVolume: 480.0, engineState: .stop, windowState: .close, trunkState: .full)

var truck1 = someTruck(brand: "Хендэ", model: "Портер", color: "black", release: 2012, bodyVolume: 100000.0, engineState: .start, windowState: .open, trunkState: .full)
var truck2 = someTruck(brand: "Лада", model: "Ларгус", color: "white", release: 2013, bodyVolume: 150000.0, engineState: .start, windowState: .close, trunkState: .empty)


car1.engineState = .stop
car1.trunkVolume = 340.0
car1.changeColor(c: "red")
car2.trunkVolume = 890.0
car2.emptyTrunck()
car2.trunkVolume = 80.9
car2.windowState = .close
car2.changeColor(c: "black")

truck1.engineState = .stop
truck1.windowState = .close
truck2.engineState = .stop
truck2.bodyVolume = 5678908


print ("Данные по первому автомобилю: \n Модель: \(car1.brand)\(car1.model), \n Год выпуска: \(car1.release), \n Цвет: \(String(describing: car1.color)), \n Свободное место в багажнике: \(car1.trunkVolume), \n Состояние двигателя: \(car1.engineState)")






















