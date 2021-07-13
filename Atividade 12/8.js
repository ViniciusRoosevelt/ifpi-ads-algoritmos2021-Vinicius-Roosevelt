/* Leia um numero X e, a seguir, leia e escreva uma lista de números com o término da lista ocorrendo
quando a soma de dois números consecutivos da lista for igual a X. */

const prompt = require('prompt-sync')()
function main(){
    console.log('### Comparação e Soma válida para multiplos de 2 ###')
    const n = Number(prompt('Insira um número: '))
    let x = 0
    let y = 1
    for( let soma = x+y  ; x+y < n ; soma > n  ){
        x = x+1
        if(x == y){
            break
        }
        if(x >= y){
            break} 
        y++
            console.log(`o seu número não é: ${x}+${y}`)  
}
if(n == x+y){
console.log(`Achamos uma soma igual que é: ${x}+${y}=${n} `)
}
}main()