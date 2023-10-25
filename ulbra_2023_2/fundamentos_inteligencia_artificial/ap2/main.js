const express = require("express")
const cors = require("cors");
const app = express()
const router = express.Router()
const port = 3000;
const fs = require("fs")
const path = require("path")

app.use(express.json({extended: true}))
app.use(express.static('public'))

app.use(cors());

const readFile = (file) => {
    const content = fs.readFileSync(`json/${file}`, 'utf-8')
    return JSON.parse(content)
}

// ROTAS POST
router.post("/salvarRegras", (req,res) => {
    const {variavel, valor, resultado} = req.body
    let currFile = readFile('regras.json')
    currFile.push({variavel, valor, resultado})
    fs.writeFileSync('json/regras.json', JSON.stringify(currFile), 'utf-8')

    res.send(currFile);
})

router.post("/salvarVariaveis", (req, res) => {
    const { nome, valores } = req.body;
    let currFile = readFile('variaveis.json');
    currFile.push({ nome, valores });
    fs.writeFileSync('json/variaveis.json', JSON.stringify(currFile), 'utf-8');

    res.send(currFile);
})

app.use(router)

app.listen(port, () => {
    console.log(`Listening on${port}`)
})
