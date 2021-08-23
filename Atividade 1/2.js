/* Escreva um programa para converter de dólar para real e exibir para o usuário a
resposta final. */
const prompt = require('prompt-sync')()
function dolar(){
    const d = Number(prompt("Insira o valor em dolar para converter em real"))
    const r = d * 5.26
    console.log('O valor convertido é igual à: ',r.toFixed(2))
}dolar()