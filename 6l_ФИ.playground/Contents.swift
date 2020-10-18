
class CarTravel {                           // Статистика по макс. скорости и пробегу машин
    
    var allKm: Int                      // Пробег
    var maxSpeed: Int                   //Максимальная скорость
    
    init(allKm: Int, maxSpeed: Int ) {
        self.allKm = allKm
        self.maxSpeed = maxSpeed
    }
}

struct GenericStack<T> {
    public var elements: [T] = []
    
    func filter (i: (T) -> Bool) -> [T] {
        var tempArray:[T] = []
        for element in elements {
            if i(element) {
                tempArray.append(element)
            }
        }
        return tempArray
    }
    
    mutating func push(_ element: T) {
        elements.append(element)
    }
    
    mutating func pop() -> T? {
        guard elements.count > 0 else { return nil }
        return elements.removeFirst()
    }
}

extension CarTravel {
    var toText: String {
        """
        Пробег автомобиля: \(allKm) Максимальная скорость: \(maxSpeed)
        """
    }
}

var queue = GenericStack<CarTravel>()

queue.push(CarTravel(allKm: 100, maxSpeed: 200))
queue.push(CarTravel(allKm: 300, maxSpeed: 111))
queue.push(CarTravel(allKm: 332, maxSpeed: 234))
queue.push(CarTravel(allKm: 5454, maxSpeed: 645))
queue.push(CarTravel(allKm: 2323232, maxSpeed: 563))
queue.push(CarTravel(allKm: 234566787, maxSpeed: 332))

var filter = queue.filter{element in element.allKm > 340}
filter.forEach { print($0.toText) }

queue.pop()
queue.pop()
queue.pop()
queue.pop()
queue.pop()
queue.pop()

