function fetchApiData() {
    fetch('http://localhost:3000/timestamp')
        .then(  (resposta) => resposta.json())
        .then((data) => {
            const list = document.querySelector('#fill_list')
            data.map(   (item) => {
                const li = document.createElement('li')
                li.setAttribute('id',item.id)
                li.innerHTML = item.post.text
                list.appendChild(li)
            })   

        })
}

