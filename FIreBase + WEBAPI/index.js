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
// Receive Posts 

app.get("/timestamp" , async(req,res) => {
    const snapshot = await db.collection('posts').orderBy('timestamp','sc').get();
    //  const ids = snapshot.docs.map((docs) =>docs.id) // Pegar os ids
    //  console.log(ids);
      const list = snapshot.docs.map((doc) =>({post:doc.data() })) // Map para tratamento e encontar os dados
      res.send(list);
}); 

app.get("/:id" , async(req,res) => {
    const id = parseInt(req.params.id)
    const snapshot = await  db.collection('posts').where('id' ,'==', id).get()
    
  //  if(snapshot.empty) {
   //     res.send({msg:`Not found Post ${id}`})
    //    return;
   // } else if (snapshot != snapshot.empty) {
        const list = snapshot.docs.map( (doc) => ({post:doc.data()}))
        res.send(list); 
  //  }
     
});


// Pegando pelo timestamp
app.get("/timestamp" , async(req,res) => {
    const snapshot = await db.collection('posts').get();
  //  const ids = snapshot.docs.map((docs) =>docs.id) // Pegar os ids
  //  console.log(ids);
    const list = snapshot.docs.map((doc) =>({post:doc.data() })) // Map para tratamento e encontar os dados
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
app.delete('/del/:id',async (req,res)=>    {
    const id = parseInt(req.params.id)
    const snapshot = await db.collection('posts').where('id' ,'==', id).get()
   const list = snapshot.docs.map( (doc) => (doc.id))
    const ids = list.toString()
  
   await db.collection('posts').doc(ids).delete()
    
 //  console.log(resposta)
   res.send({msg: 'Post Deleted'})
});












app.listen(port, () => console.log(`Subiu e Rodando em ${port}`))
