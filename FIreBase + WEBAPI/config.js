const firebase = require("firebase");
// Configurando Firebase
const firebaseConfig = {
    apiKey: "AIzaSyDDtPYqTxdKoGqFpz3TySlF_n5K7zv8mkQ",
    authDomain: "web-api-fire.firebaseapp.com",
    projectId: "web-api-fire",
    storageBucket: "web-api-fire.appspot.com",
    messagingSenderId: "943204772615",
    appId: "1:943204772615:web:e6ab31c61244695320f3a2"
};
firebase.initializeApp(firebaseConfig);
const db = firebase.firestore();
const Post = db.collection('posts')
module.exports= Post;
module.exports= db;

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


/*
db.collection("posts").get().then((querySnapshot) => {
    querySnapshot.forEach((doc) => {
    console.log(doc.id, " => ", doc.data());
 });
 });
*/



    