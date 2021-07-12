/* Leia um número e mostre na tela se o número é positivo ou negativo. */ 
const prompt = require('prompt-sync')()
function main(){
    const n1 = Number(prompt('Insira o número que deseje verificar: '))
    if(n1 > 0){
        console.log(n1,'é positivo')
    }else if(n1 == 0){
        console.log(n1,'è o número neutro dos Naturais')
    }else{
        console.log(n1,'é negativo')
    }
}main()