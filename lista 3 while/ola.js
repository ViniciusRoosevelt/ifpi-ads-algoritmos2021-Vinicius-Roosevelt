const prompt = require('prompt-sync')()
function main(){
     const nome = prompt('Qual seu nome: ')
     let quantidade = 1
     while(quantidade <= 10){
         console.log(`${quantidade}: Olá ${nome}`)
         quantidade = quantidade + 1
     }
     console.log('Fim')
}main()