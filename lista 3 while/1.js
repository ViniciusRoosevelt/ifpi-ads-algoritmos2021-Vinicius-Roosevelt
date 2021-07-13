/* Leia uma lista de números e que para cada número lido, escreva o próprio número e a relação de seus
divisores. (flag número = 0). */
const prompt = require('prompt-sync')()
function main(){
    console.log('### Divisores de um número ###')
    console.log('### Insira 0,quando desejar parar o algoritmo')
    var n = 1
    let x = 1
    if(n !== 0){
        while(n !==0){
            n=Number(prompt('Insira um número'))
            while(n >= x){
                if(n % x ==0){
                    console.log(n,'é divisível por',x)
                } 
                x++
            }
x = 0
        }
    n = 0
    } 
}main()