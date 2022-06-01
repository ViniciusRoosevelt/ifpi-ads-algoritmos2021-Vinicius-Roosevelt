const express = require('express')
const app = express()


//response as Json
app.use(express.json()); 
app.use(express.urlencoded({ extended: true }));
const port = 3000
// Configurando Firebase
var admin = require("firebase-admin");
var serviceAccount = require("./web-api-fire-firebase-adminsdk-1mmwn-e4c8e189d2.json");

admin.initializeApp({
    credential:
    admin.credential.cert(serviceAccount)
})
 






const db = admin.firestore()

/*
db.collection('posts').add({
    text: "Nova Postagem",
    likes: 0
})
.then((docRef) =>{
    console.log('Document written with id:',docRef.id)
})
.catch((error) => {
    console.error('Error:',error)
}) */



db.collection("posts").get().then((querySnapshot) => {
    querySnapshot.forEach((doc) => {
    console.log(doc.id, " => ", doc.data());
 });
 });



 app.listen(port, () => {
        console.log('Servidor rodando')
})
    