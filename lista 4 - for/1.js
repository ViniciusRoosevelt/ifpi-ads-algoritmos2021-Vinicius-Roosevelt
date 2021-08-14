/* Leia N e escreva todos os números inteiros de 1 a N. */
function main(){
    console.log('Todos os naturais até n')
    const prompt = require('prompt-sync')()
    const n = Number(prompt('Insira um número'))
    for(let i = 1 ; i <= n ; i++){
        console.log(`Os naturais de 1 até ${n} são: ${i}`)
    }
}main()