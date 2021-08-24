/* Escreva uma função que dados 2 valores reais p e x calcule e retorne quanto vale p
por cento de x */
const prompt = require('prompt-sync')()
function main(){
    const p = Number(prompt('Insira o valor p: '))
    const x = Number(prompt('Insira o valor x: '))
    let div = (p/x) * 100
    console.log("p/x% =",div,'%')
}main()