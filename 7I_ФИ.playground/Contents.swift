struct Games {
    var price: Double
    var count: Int
    var name: Title
}

struct Title {
    let name: String
}

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

class GameShop {
    var stock = [
        "Doom Eternal": Games(price: 2330, count: 7, name: Title(name: "Doom Eternal")),
        "Alien": Games(price: 1432, count: 0, name: Title(name: "Alien")),
        "Wolfenstein": Games(price: 5400, count: 3, name: Title(name: "Wolfenstein")),
        "WRC 8": Games(price: 2435, count: 2, name: Title(name: "WRC 8")),
        "NFS": Games(price: 3800, count: 6, name: Title(name: "NFS"))
    ]
    
    var fundsLimit: Double = 1500
    
    func buy(game name: String) -> (game: Title?, error: GameShopError?){
        guard let buyingGame = stock[name] else {
            return (game: nil, error: GameShopError.wrongName)
        }
        
        guard stock.count > 0 else {
            return (game: nil, error: GameShopError.outOfStock)
        }
        
        guard buyingGame.price <= fundsLimit else {
            return (game: nil, error: GameShopError.noCredit(credit: buyingGame.price - fundsLimit))
        }
        
        fundsLimit -= buyingGame.price
        var newItem = buyingGame
        newItem.count -= 1
        stock[name] = newItem
        return (game: newItem.name, error: nil)
    }
}

let gameShop = GameShop()
//let buy1 = gameShop.buy(game: "NFS")
//let buy2 = gameShop.buy(game: "Doom Eternal")
//let buy3 = gameShop.buy(game: "Alien")

if let product = buy1.game {
    print("Мы купили: \(product.name)")
} else if let error = buy1.error {
    print("Произошла ошибка: \(error.description)")
}

if let product = buy2.game {
    print("Мы купили: \(product.name)")
} else if let error = buy2.error {
    print("Произошла ошибка: \(error.description)")
}

if let product = buy3.game {
    print("Мы купили: \(product.name)")
} else if let error = buy3.error {
    print("Произошла ошибка: \(error.description)")
}

//2 часть

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
