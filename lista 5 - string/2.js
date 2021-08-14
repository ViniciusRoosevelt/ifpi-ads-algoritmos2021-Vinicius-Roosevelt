/*Leia uma frase e mostre cada palavra da frase em uma linha separada. */
const prompt = require('prompt-sync')()
function main(){
    console.log('### Texto e Enumeração ###')
    const texto = prompt('Insira um texto: ')
    for(let i = 0 ; i < texto.length ; i++){
        console.log(`A frase dividida é ${texto[i]}`)
    }
}main()