/* Leia um número e escreva se o número é inteiro ou decimal. */
const prompt = require('prompt-sync')()
function main(){
    const n = Number(prompt('Escreva o número:'))
    if(Number.isInteger(Number(n))){
        console.log(n + " inteiro");
       }else{
        console.log(n + " não é inteiro");
       }
  }main()