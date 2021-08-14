/* Escreva um algoritmo para determinar o número de dígitos de um número informado. */
const prompt = require('prompt-sync')()
function main(){
    console.log('### Algarismo dos Números ####')
    const n = Number(prompt('Insira um número: '))
    let t = 1
    let v = 1 // Quantidade de Vezes que o algoritmo vai rodar
    if(n > 0){
        while((n / v* 10) > 100000 ){
            console.log(`${v} digitos: `)
        }
    }
}