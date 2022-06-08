// import {query,orderBy,limit} from "firebase/firestore";
const express = require('express');
const cors = require('cors');
const Post = require('./config');
const db = require('./config');
const app = express()
const port = 3000
//response as Json
app.use(express.json()); // BoryParser - Transformar array em json
app.use(express.urlencoded({ extended: true }));
app.use(cors())



// Receive Posts
app.get("/" , async(req,res) => {
    const snapshot = await db.collection('posts').get();
  //  const ids = snapshot.docs.map((docs) =>docs.id) // Pegar os ids
  //  console.log(ids);
    const list = snapshot.docs.map((doc) =>({post:doc.data() })) // Map para tratamento e encontar os dados
    res.send(list);
});

app.get("/:id" , async(req,res) => {
    const id = parseInt(req.params.id)
    const snapshot = await  db.collection('posts').where('id' ,'==', id).get()
    
    if(snapshot.empty) {
        res.send({msg:`Not found Post ${id}`})
        return;
    }
     const list = snapshot.docs.map( (doc) => ({...doc.data()}))
    res.send(list); 
});


// Pegando pelo timestamp
app.get("/timestamp" , async(req,res) => {
    const snapshot = await db.collection('posts').orderBy('timestamp', 'asc').get()
    const list = snapshot.docs.map((doc) =>({id: doc.id, ...doc.data()})) // Map para tratamento e encontar os dados
    res.send(list);
});




// Create Post
app.post('/create/:id',async (req,res)=>    {
    const id = parseInt(req.params.id)
    let timestamp = new Date()
  //  const data = req.body.id
    const text = req.body.text
    const like = req.body.like
    // Recebe a requisição http
   await db.collection('posts').add({id,text,like,timestamp
                  })               
                   // Manda para o firebase
    res.send({msg:"Post Added"})
});


app.put('/update',async (req,res)=>    {
    const id = req.body.id;
    console.log("Before deleting ID",req.body)
    delete req.body.id
    console.log("After deleting ID",req.body)
    const data = req.body
    await Post.doc(id).update(data);
   res.send({msg:"Updated"})
});

// Delete Posts pelo id
app.delete('/delete/:id',async (req,res)=>    {
    const id = parseInt(req.params.id)
    await db.collection('posts').where('id' ,'==', id).get();
   res.send({msg:"Deleted"})
});












app.listen(port, () => console.log(`Subiu e Rodando em ${port}`))
