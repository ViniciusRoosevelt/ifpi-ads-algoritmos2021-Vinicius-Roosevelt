

const url = "https://jsonplaceholder.typicode.com"


/*fetch(url+'/posts')
.then(response => response.json())
.then(json => {
    const div = document.getElementById("conteudo")
    div.innerText = JSON.stringify(json);
    console.log(get.statusco)
}) */
function getUser(){
    axios.get(url+"/posts")
    .then(response =>{
        const data = response.data
        // const div = document.getElementById("renderResults") - Caso eu queria enviar a prop para div
        // div.innerText = JSON.stringify(data)
        console.log(data)
        console.log(response.status)
        console.log(response.statusText)
        console.log(response.headers)
    })
    .catch(error => console.log(error))
}
getUser()
/*
function addnewUser(){
    axios.post(url+'/posts',{
        userId: 10,
        id: 101,
        title: "O Melhor do Mundo" ,
        body: "O melhor do mundo é o Pele"
    })
    .then(response =>{
        console.log(response.data)
    })
    .catch(error => console.log(error))
}
addnewUser()
*/
/*
fetch('https://jsonplaceholder.typicode.com/photos/1')
    .then(function(data){
        return data.blob()
    })
  .then(function(results){
      const imgUrl = URL.createObjectURL(results)
      const img = `<img src="${imgUrl}" />`
  })
  */
 
  function download(){
     axios({
                url:'https://source.unsplash.com/random/500x500',
                method:'GET',
                responseType:'blob'
            })
            .then((response) =>{
                const url = window.URL.createObjectURL(new Blob([response.data]));
                const link = document.createElement('a');
             link.href = url;
             link.setAttribute('download', 'file.jpg'); //or any other extension
            document.body.appendChild(link);
            link.click();
       



     })
 } 
 function link(){
    axios.get(url).then((response)=>{
        console.log("url")
        const linkExp = '<a href="http://www.google.com">Página do Google</a>'
        const doc = response.data.toString()
        const urls = doc.match(linkExp)
        console.log(urls)
    }).catch((err)=>{
        console.log(err)
    })
 }
 link()

