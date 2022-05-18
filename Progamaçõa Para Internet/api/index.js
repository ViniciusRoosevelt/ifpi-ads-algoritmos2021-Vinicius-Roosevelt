const express = require('express');
const morgan = require('morgan');
const cors = require('cors');
const bodyParser = require('body-parser');
const routes = require('./config/routes')



const app = express()

app.use(morgan('dev'))
app.use(bodyParser.urlencoded({extended : false}))
app.use(express.json()); // Tipo de Dados para receber
app.use(cors());
app.use(routes);


let Postagem = [
    {"id" : 1,"text" : "Lorem dhsauh cnaskbnc jk", "like": 300},
    {"id" : 2,"text" : "Lorem dhsauh cnaskbnc jk", "like": 301},
]

//   Buscando dados(Postagem)
app.get('/postagem' , (req,res) =>{
    return res.json(Postagem)
})
// Criar uma Postagem
app.post('/postagem' , (req,res) =>{
    const body = req.body
// Caso o body não exista
    if(!body){
        return res.status(400).end()
    }

    Postagem.push(body)
    return res.json(body);

})


 app.listen(3000, () =>{
     console.log('Rodando na Porta 3000 e no localhost')
 })