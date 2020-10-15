struct Games {
    var price: Double
    var count: Int
    var name: Title
}
import Cocoa

struct Title {
    let name: String
}

class GameShop {
    var stock = [
        "Doom Eternal": Games(price: 2330, count: 7, name: Title(name: "Doom Eternal")),
        "Alien": Games(price: 1432, count: 0, name: Title(name: "Alien")),
        "Wolfenstein": Games(price: 5400, count: 3, name: Title(name: "Wolfenstein")),
        "WRC 8": Games(price: 2435, count: 2, name: Title(name: "WRC 8")),
        "NFS": Games(price: 3800, count: 6, name: Title(name: "NFS"))
    ]
    
    var fundsLimit: Double = 1500
    
    func buy(game name: String) -> Title? {
        guard let buyingGame = stock[name] else {
            return nil
        }
        
        guard stock.count > 0 else {
            return nil
        }
        
        guard buyingGame.price <= fundsLimit else {
            return nil
        }
        
        fundsLimit -= buyingGame.price
        var newItem = buyingGame
        newItem.count -= 1
        stock[name] = newItem
        print("Вы приобрели игру: \(name)")
        print("У вас на счету осталось: \(fundsLimit) руб.")
        return newItem.name
    }
}

let gameShop = GameShop()
//gameShop.buy(game: "NFS")
//gameShop.buy(game: "Doom Eternal")
//gameShop.buy(game: "Alien")

//2 часть

enum GameShopError: Error {

    case wrongName
    case outOfStock
    case noCredit(credit: Double)
}

extension GameShopError: CustomStringConvertible {
    var description: String {
        switch self {
        case .noCredit(let credit): return "У вас недостаточно средств для покупки игры. На счету: \(gameShop.fundsLimit) руб., игра стоит: \(credit) руб."
        case .outOfStock: return "Сожалеем, но данный товар закончился. Приходите позже."
        case .wrongName: return "К сожалению у нас в ассортименте нет такой игры, но мы учтем ваше пожелание и постараемся добавить её."
        }
    }
}

extension GameShop {
    
    func buyError(game name: String) throws -> Title {
        guard let buyingGame = stock[name] else {
            throw GameShopError.wrongName
        }
        
        guard stock.count > 0 else {
            throw GameShopError.outOfStock
        }
        
        guard buyingGame.price <= fundsLimit else {
            throw GameShopError.noCredit(credit: buyingGame.price - fundsLimit)
        }
        
        fundsLimit -= buyingGame.price
        var item = buyingGame
        item.count -= 1
        stock[name] = item
        print("Вы приобрели игру: \(name)")
        print("У вас на счету осталось: \(fundsLimit) руб.")
        return item.name
    }
}


do {
    try gameShop.buyError(game: "Alien")
} catch let error as GameShopError {
    print(error.description)
}

do {
    try gameShop.buyError(game: "NFS")
} catch let error as GameShopError {
    print(error.description)
}
