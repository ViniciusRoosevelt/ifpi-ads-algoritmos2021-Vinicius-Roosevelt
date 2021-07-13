/* Leia um numero X e, a seguir, leia e escreva uma lista de números com o término da lista ocorrendo
quando a soma de dois números consecutivos da lista for igual a X. */

const prompt = require('prompt-sync')()
function main(){
    console.log('### Comparação ###')
    const n = Number(prompt('Insira um número: '))
    let x = 0
    while(n !== x){
        while(n > x ){
        console.log(`o seu número não é: ${x}`)
        x++
}
}if(n == x){
console.log(`Achamos um número igual ao seu: ${x} `)
}
}main()