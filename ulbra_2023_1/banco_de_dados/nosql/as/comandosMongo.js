// Comandos MongoDB para criar as coleções e inserir os dados.
// inserindo a colecao clientes
db.clientes.insertOne([
    {
    "_id": 1,
    "nome": "Lorenzo Cardoso",
    "enderecos": [
        {
            "rua": "rua 123",
            "bairro": "bairro 123",
            "numero": "123"
        },
        {
            "rua": "rua 543",
            "bairro": "bairro 543",
            "numero": "543"
        }
    ],
    "telefones": ["51995687264", "51999999999"]
    }
])
// insertindo a colecao itens
db.itens.insertMany([
    {
        "_id": 1,
        "nome": "pizza",
        "sabores": [
            {
                "sabor": "calabresa",
                "tamanhos": [
                    {"tamanho": "P", "valor": 89.90},
                    {"tamanho": "M", "valor": 100},
                    {"tamanho": "G", "valor": 120}
                ]
            },
            {
                "sabor": "chocolate com morango",
                "tamanhos": [
                    {"tamanho": "P", "valor": 89.90},
                    {"tamanho": "M", "valor": 100},
                    {"tamanho": "G", "valor": 120}
                ]
            },
            {
                "sabor": "portuguesa",
                "tamanhos": [
                    {"tamanho": "P", "valor": 89.90},
                    {"tamanho": "M", "valor": 100},
                    {"tamanho": "G", "valor": 120}
                ]
            },
            {
                "sabor": "coracao",
                "tamanhos": [
                    {"tamanho": "P", "valor": 89.90},
                    {"tamanho": "M", "valor": 100},
                    {"tamanho": "G", "valor": 120}
                ]
            },
            {
                "sabor": "strogonoff",
                "tamanhos": [
                    {"tamanho": "P", "valor": 89.90},
                    {"tamanho": "M", "valor": 100},
                    {"tamanho": "G", "valor": 120}
                ]
            }
        ]
    },
    {
        "_id": 2,
        "nome": "refrigerante",
        "sabores": [
            {
                "sabor": "coca cola",
                "estoque": 18,
                "tamanhos": [
                    {"tamanho": "350ml", "valor": 6},
                    {"tamanho": "600ml", "valor": 10},
                    {"tamanho": "2l", "valor": 15}
                ]
            },
            {
                "sabor": "fanta",
                "estoque": 15,
                "tamanhos": [
                    {"tamanho": "350ml", "valor": 6},
                    {"tamanho": "600ml", "valor": 10},
                    {"tamanho": "2l", "valor": 15}
                ]
            },
            {
                "sabor": "guarana",
                "estoque": 16,
                "tamanhos": [
                    {"tamanho": "350ml", "valor": 6},
                    {"tamanho": "600ml", "valor": 10},
                    {"tamanho": "2l", "valor": 15}
                ]
            },
            {
                "sabor": "sprite",
                "estoque": 15,
                "tamanhos": [
                    {"tamanho": "350ml", "valor": 6},
                    {"tamanho": "600ml", "valor": 10},
                    {"tamanho": "2l", "valor": 15}
                ]
            }
        ]
    },
    {
        "_id": 3,
        "sabores": [
            {"sabor": "melancia", "estoque": 50},
            {"sabor": "hortela", "estoque": 40}
        ]
    }
])
// insertindo a colecao pedidos
db.pedidos.insertMany([
    {
        "_id": 1,
        "_idCliente": 1,
        "itens": [
            {"_idItem": 1, "qtd": 2, "valor": 120, "tamanho": "G", "sabores":["calabresa"]},
            {"_idItem": 1, "qtd": 1, "valor": 89.90, "tamanho": "P", "sabores":["chocolate com morango"]},
            {"_idItem": 2, "qtd": 2, "valor": 15, "tamanho": "2l", "sabores":["coca cola", "guarana"]}
        ],
        "entrega": true,
        "numeroMesa": null,
        "endereco": {
            "rua": "rua123",
            "bairro": "bairro 123",
            "numero": "123"
        },
        "valorTotal": 359.90,
        "dataEntrega": "2023-06-24"
    },
    {
        "_id": 2,
        "_idCliente": 1,
        "itens": [
            {"_idItem": 1, "qtd": 1, "valor": 100, "tamanho": "M", "sabores": ["coracao"]},
            {"_idItem": 1, "qtd": 1, "valor": 120, "tamanho": "G", "sabores": ["portuguesa"]},
            {"_idItem": 2, "qtd": 1, "valor": 15, "tamanho": "2l", "sabores": ["sprite"]}
        ],
        "entrega": false,
        "numeroMesa": 5,
        "endereco": null,
        "valorTotal": 235,
        "dataEntrega": null
    },
    {
        "_id": 3,
        "_idCliente": 2,
        "itens": [
            {"_idItem": 1, "qtd": 1, "valor": 89.90, "tamanho": "P", "sabores": ["chocolate com morango"]},
            {"_idItem": 1, "qtd": 1, "valor": 120, "tamanho": "G", "sabores": ["strogonoff"]},
            {"_idItem": 2, "qtd": 1, "valor": 15, "tamanho": "2l", "sabores": ["fanta"]}
        ],
        "entrega": false,
        "numeroMesa": 3,
        "endereco": null,
        "valorTotal": 224.90,
        "dataEntrega": null
    }  
])

// --------------------------------------------------------------------------------- //
// Comandos MongoDB para realizar atualizações e exclusões de dados. 
// excluir o item chiclete
db.itens.deleteOne(
    {"_id": 3}
)
// atualizar dados
db.itens.updateMany(
    {"_id": 2},
    {$set: {"sabores.$[].tamanhos.$[tamanho].valor": 20}},
    {arrayFilters: [{"tamanho.tamanho": "2l"}]}
)
// irá definir o valor "20" para o campo "valor" em todos os elementos do array "tamanhos" que correspondem à condição "tamanho.tamanho" igual a "2l" dentro do array "sabores".

// Comandos MongoDB para as consultas que devem incluir pelo menos uma de cada: consulta simples, consulta com uma condição.
// buscar todos os pedidos
db.pedidos.find()

// buscar apenas os pedidos com valor total menor que 300 reais
db.pedidos.find(
    {"valorTotal": {$lt: 300}}
)

// Comando MongoDB com 2 consultas usando Aggregate. 
    // retorna o id do cliente com mais pedidos
    db.pedidos.aggregate(
        {
            $lookup: {
                from:"clientes",
                localField: "_idCliente",
                foreignField: "_id",
                as: "melhorCliente"
            },
        },
        {
            $group: {
                _id: "$_idCliente",
                totalPedidos: { $sum: 1 }
              }
        }
    )

    // retorna o valor total gasto por cliente
    db.pedidos.aggregate([
        {
            $lookup: {
                from: "clientes",
                localField: "_idCliente",
                foreignField: "_id",
                as: "cliente"
            }
        },
        {
            $group: {_id: "$_idCliente", "nomeCliente": {$first: "$cliente.nome"},"gastoPorCliente": {$sum: "$valorTotal"}}
        }
    ])

// Índices apropriados para melhorar o desempenho das consultas. Explicar por que desses índices.
//  índice para aprimorar a consulta por cliente.
db.pedidos.createIndex({ _idCliente: 1 })


// comando para testar index
.explain("executionStats")