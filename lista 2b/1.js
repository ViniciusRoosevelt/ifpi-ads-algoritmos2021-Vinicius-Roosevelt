/* Leia um número e mostre na tela se o número é positivo ou negativo. */ 
const prompt = require('prompt-sync')()
function main(){
    const n1 = Number(prompt('Insira o número que deseje verificar: ')) // Entrada do número
    if(n1 > 0){ // Caso 1 - Número é positivo
        console.log(n1,'é positivo')
    }else if(n1 == 0){ // Caso 2 - Número é o proprio zero
        console.log(n1,'è o número neutro dos Naturais')
    }else{ // Caso 3 - Número é negativo
        console.log(n1,'é negativo')
    }
}main() // Saída