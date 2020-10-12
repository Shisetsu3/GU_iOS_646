
class CarTravel {                           // Статистика по макс. скорости и пробегу машин
    var allKm : Int                      // Пробег
    
    init(allKm: Int) {
        self.allKm = allKm
    }
}

struct GenericStack<T> {
    public var elements: [T] = []
    
    
    mutating func push(_ element: T) {
        elements.insert(element, at: 0)     // Добавляем каждый новый элемент в начало
    }
    
    mutating func pop() -> T? {
        guard elements.count > 0 else { return nil }
        return elements.removeLast()        //Выводим последний элемент в массиве, но он же является первым, кто в этот                                     массив попал.
    }
}

var queue = GenericStack<CarTravel>()       // Создаем стек типа "Очередь"

queue.push(CarTravel(allKm: 100))
queue.push(CarTravel(allKm: 300))
queue.push(CarTravel(allKm: 332))
queue.push(CarTravel(allKm: 5454))
queue.push(CarTravel(allKm: 2323232))
queue.push(CarTravel(allKm: 234566787))

queue.pop()
queue.pop()
queue.pop()
queue.pop()
queue.pop()
queue.pop()

