const { response } = require('express');
const express = require('express');

const routes = express.Router()


 let Postagens = [
   // {  "id": "1","text" : "Lorem dhsauh cnaskbnc jk", like: 300},
   // {  "id": "2" ,"text" : "Lorem dhsauh cnaskbnc jk", like: 301  },
]

//   Buscando dados(Postagem)
routes.get('/postagem' , (req,res) =>{
    return res.json(Postagens)
})
// Buscando uma Postagem
routes.get('/postagem/:id', (req,res) => {
   const postagem = Postagens.filter(value => value.id == req.params.id)
   res.json(postagem)
})
// Criar uma Postagem
routes.post('/postagem' , (req,res) =>{
    const body = req.body
    Postagens.push(body)
    return res.json(body);

})
// Atualizando text,like,id
routes.put('/postagem/:index', (req,res) => {
    const index = req.params.id;
    const text =  req.body.text
    const like = req.body.like
    const id = req.body.id

    let postagens = Postagens.filter(value => value.index == index);
    postagens[0].text = text; 
    postagens[0].like = like; 
    postagens[0].id = id; 

    res.json(postagens[0])
})


routes.delete('/postagem/:id', (req,res) => {
    const id = req.params.id;
    Postagens = Postagens.filter(value => value.id  != id);
     res.json(Postagens);

})
    


module.exports = routes;



class Post {
    constructor(id,text,like) {
        this.id = id
        this.text = text
        this.like = like
    }
}


class MicroBlog extends Post{
    create(){
        return  Postagens = [
         {  "id": this.id,"text" : this.text, like: this.like},
        ]
    }
    retrieve(id){
        for(i =0;i <= id;i++){
            if(Postagens[i].id == id){
                return Postagens[i];
            }
            else {
                return {masage: 'Error'}
            }
        }
    }
    update(id,text,like){
        for(i = 0;i <= id;i++){
            if(Postagens[i].id == id){
                Postagens[i].id = id
                Postagens[i].text = text
                postagens[i].like = like
            }
            else{
                return {massage: 'Não existe essa postagem'}
            }
        }
    }
    retrieveAll(){
        return Postagens;
    }



}

let microblog = new MicroBlog

microblog().create(1,'dsadsadsa',100).retrieveAll()

