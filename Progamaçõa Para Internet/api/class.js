const { response } = require('express');
const express = require('express');
const res = require('express/lib/response');
const app = express()
const port = 3000


var Post = /** @class */ ( function () {
    function Post(id, text, likes) {
        this.id = id;
        this.text = text;
        this.likes = likes;
    }
    Post.prototype.curtir = function () {
        this.likes++;
    };
    //---------------------alterar texto
    Post.prototype.alterar = function (new_text) {
        this.text = new_text;
    };
    Post.prototype.alterarlike = function (new_like) {
        this.likes = new_like;
    };
    Post.prototype.toString = function () {
        return (this.text + " - " + this.likes);
    };
    return Post;
}());

var Microblog = /** @class */ (function () {
    function Microblog() {
        this.postagens = []
    }
    Microblog.prototype.create = function (post) {
        this.postagens.push(post)
    }
    Microblog.prototype.consultarindice = function (id){
        var indice = -1;
        for(var i = 0;i < this.postagens.length;i++){
       if(this.postagens[i].id == id){
        indice = i
        break;
       }
        }
        return indice;
    };

    Microblog.prototype.retrieve = function (id) {
        exist = this.consultarindice(id);
        if(exist == -1){
            return "Postagem não encontrada"
        }
        return (this.postagens[id]);
    }

    Microblog.prototype.delete = function (id){
        var indice = this.consultarindice(id);
        if(indice != -1 ){
            for (var i = indice; i < this.postagens.length;i++){
                this.postagens[i] = this.postagens[i+1]
            }
            this.postagens.pop();
        }
    }
    Microblog.prototype.update = function (post) {
        post.id = parseInt(post.id)
        var achou = this.consultarindice(post.id)
        if(encontrou != -1 ){
            this.postagens[achou].alterar(post.text)
        }
        else{
            console.log('Postagem not found')
        }
    }
    Microblog.prototype.updatelike = function (post) {
        post.id = parseInt(post.id)
        var achou = this.consultarindice(post.id);
        if(enctrou != -1){
            this.postagens[achou].alterar(post.likes)
        }
        else {
            console.log('Postagem not found ')
        }
    }
    Microblog.prototype.retrieveAll = function (post) {
        return this.postagens
    }
    Microblog.prototype.hot_post = function () {
        var mais_like = 0
        var postagem_clicada = null
        for(var i = 0;i < this.postagens.length;i++){
            if(this.postagens[i].likes > mais_like){
                mais_like = this.postagens[i].likes
                postagem_clicada = this.postagens[i];
            }
        }
        return postagem_clicada
    }
    Microblog.prototype.curtir_postagem = function (post){
        var achou = this.consultarindice(post.id)
        if (achou != -1) {
            this.postagens[achou].curtir();
        }
        else {
            console.log('Postagem not found')
        }
    }
    Microblog.prototype.toString = function () {
        for (var i = 0; i < this.postagens.length; i++) {
            console.log(this.postagens[i].toString());
        }
    }
    return Microblog
}())


var microblog = new Microblog();


microblog.create(new Post(0,'eae',100))
microblog.create(new Post(1,'eae',101))
microblog.create(new Post(2,'eae',102))
microblog.create(new Post(3,'eae',103))
microblog.create(new Post(4,'eae',104))


app.use(express.json());
app.use(express.urlencoded({ extended: false }));



app.get('/postagem' , (req,res) =>{
    res.send(microblog.retrieveAll());
})


app.get('/postagem/:index' ,(req,res) => {
    index = req.params.id
    res.json(microblog.retrieve(id));
})


app.get('/postagem/criar', function(req,res) {
    console.log(req.body)
    microblog.create(new Post(parseInt(req.body.id),req.body.text, 100))
})

app.delete('/postagem/:index', (req,res) => {
    id = req.params.id
    microblog.delete(id)
    res.status(204).send();
})



app.put('/postagem/:index', function(req,res) {
    index = parseInt(req.params.id)
    microblog.update(req.body)
    console.log(index)
    return response.status(200).send()
})

app.post('/postagem/criar' m function(req,res) {
    console.log(req.body);
    microblog.create(new Post(parseInt(req.body.id), req.body.text, 0))
    res.status(201).send()
})


