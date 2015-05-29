# ios with swift

# Interface Builder

storyboard - view que é exibida para o usuário final, mas podemos ter várias views. Ela também é conectada com a lógica da aplicação, recebendo o nome de View Controller.

IB - interface builder

@IBOutlet - conectar objetos presentes na tela

@IBAction - conectar objetos para executar uma ação

A classe requer que todo atributo seja inicializado, para evitar a inicialização adicione uma exclamação.
Ex: 
@IBOutlet var nameField:UITextField!

# Declaração de variáveis
- var: variável
- let: constante
- Para concatenar string com variáveis basta utilizar o `\(variavel)`
- O ponto e vírgula no final de uma declaração é opcional (evite o uso)
- Adicionando tipo da variável. Ex: `let name:String = "My Name"`
- Tipos de variváveis básicas: :String, :Int, :Double, :Bool

# Declaração de Função, parâmetros e retorno
Exemplo de função com parâmetros:
```
func add(name:String, calories:Double) {
    println("adding \(name) \(calories)")
}

func allCalories(calories:Array<Double>) -> Double {
    var total:Double = 0
    for c in calories {
        total += c
    }
    return total
}
```

# Declaração de arrays
```
let items = [] // generico
let items:Array<Double> = [] // array de double
let calories:Array<Double> = [50.5, 100, 300, 500]
```

# Comentários
```
// comentário de uma linha

/* 
   Comentário
   de 
   várias linhas
 */
```

# Declaração de loops for
```
let calories:Array<Double> = [50.5, 100, 300, 500]

for (var i=0; i < calories.count; i++) {
    println(calories[i])
}

for var i=0; i < calories.count; i++ { // for sem utilizar os parênteses
    println(calories[i])
}

for i in 0...(calories.count-1) { // utilizando os ...
    println(calories[i])
}

for i in calories { // percorrendo todos os valores do array atribuídos em i
    println(i)
}
```

# Cuidados com operações matemáticas
```
let calories:Array<Double> = [50.5, 100, 300, 500]

let total = 1000.0 // Double
let avg = total / calories.count // não compila pois não faz cast automático do count que é um Int

let avg = total / Double(calories.count) // deve ser explícito
```

# Orientação a objetos (Classes básicas e variáveis optinal)
```
class Meal {
    var name:String? // ? (optional), pode ou não ter valor (nil)
    var happiness:Int! // variavel que pode ser
}

var brownie = Meal()
brownie.name = "Eggplant brownie"
brownie.happiness = 3

// extraindo o valor de optional com !
println(countElements(brownie.name!))

// extraindo o valor de optional com 'if let'
if let name = brownie.name { // não utiliza os parênteses
    println(countElements(name))
} else {
    println("name is empty")
}
```

# Orientação a objetos (Construtor e métodos)
```
class Meal {
    var name:String
    var happiness:Int
    var items = Array<Item>() // inicializando com array vazio
    init(name:String, happiness:Int) { // construtor
        self.name = name
        self.happiness = happiness
    }
    
    func allCalories() -> Double {
        var total = 0.0
        for i in items {
            total += i.calories
        }
        return total
    }
}

class Item {
    var name:String
    var calories:Double
    init(name:String, calories:Double) {
        self.name = name
        self.calories = calories
    }
}

let brownie = Meal(name:"Eggplant brownie", happiness:5) // sempre deve informar o nome do parâmetro na chamada do construtor

brownie.items.append(Item(name: "brownie", calories: 115))
brownie.items.append(Item(name: "Vegan cream", calories: 40))

println(brownie.allCalories())
```

# Boas práticas para grupos de diretórios
- Ao criar grupos dentro do xcode ele não cria o diretório no disco, cria apenas virtual
- Crie primeiro os diretórios no disco e depois adicione-os como grupos no projeto dentro do xcode
