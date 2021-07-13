const prompt = require('prompt-sync')()
function main(){
    let n = Number(prompt('Escreva números para fazer média aritmétrica: '))
    let somatorio = n
    let quantidade = 1
    while((n >= 0)){
        n = Number(prompt('Escreva outro número: '))
        somatorio = n + n
        quantidade = quantidade + 1
        if(quantidade > 0){
const media = somatorio / (quantidade - 1) 
console.log('Você digitou',quantidade,'números - media =',media)
        }else{
            console.log('Você não digitou valores válidos')
        }
    }console.log('Fim')
}main()