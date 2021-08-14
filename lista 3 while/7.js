/*  Leia um número e, a seguir, leia uma lista de números até achar um igual ao primeiro número lido. */
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