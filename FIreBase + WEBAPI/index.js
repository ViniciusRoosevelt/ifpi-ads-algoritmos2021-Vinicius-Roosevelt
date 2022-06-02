// import {query,orderBy,limit} from "firebase/firestore";
const express = require('express');
const cors = require('cors');
const Post = require('./config');
const app = express()
const port = 3000
//response as Json
app.use(express.json()); // BoryParser - Transformar array em json
app.use(express.urlencoded({ extended: true }));
app.use(cors())



// Receive Posts
app.get("/" , async(req,res) => {
    const snapshot = await Post.get();
  //  const ids = snapshot.docs.map((docs) =>docs.id) // Pegar os ids
  //  console.log(ids);
    const list = snapshot.docs.map((doc) =>({id: doc.id, ...doc.data() })) // Map para tratamento e encontar os dados
    res.send(list);
});


// Pegando pelo timestamp
app.get("/timestamp" , async(req,res) => {
    const snapshot = await Post.orderBy('timestamp', 'asc   ').get()
  //  const ids = snapshot.docs.map((docs) =>docs.id) // Pegar os ids
  //  console.log(ids);
    const list = snapshot.docs.map((doc) =>({id: doc.id, ...doc.data() })) // Map para tratamento e encontar os dados
    res.send(list);
});




// Create Post
app.post('/create',async (req,res)=>    {
    let timestamp = new Date()
    const data = req.body; // Recebe a requisição http
   await Post.add({data,
    timestamp
                  })                // Manda para o firebase
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
app.delete('/delete',async (req,res)=>    {
    const id = req.body.id;
    
    await Post.doc(id).delete();
   res.send({msg:"Deleted"})
});













app.listen(port, () => console.log(`Subiu e Rodando em ${port}`))
