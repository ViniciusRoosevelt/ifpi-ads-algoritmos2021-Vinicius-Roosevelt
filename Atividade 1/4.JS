/* Escreva um programa que apresente o mês por extenso, a partir de um número
digitado pelo usuário (entre 1 e 12). */
const prompt = require('prompt-sync')()
function main(){
    const n = Number(prompt("Insira um número de 1 a 12: "))
    if(n == 1){
        console.log("O número equivale ao mes de Janeiro")
    }
    else if(n == 2){
        console.log("O número equivale ao mes de Fevereiro")
    }
    else if(n == 3){
        console.log("O número equivale ao mes de Março")
    }
    else if(n == 4){
        console.log("O número equivale ao mes de Abril")
    }
    else if(n == 5){
        console.log("O número equivale ao mes de Maio")
    }
    else if(n == 6){
        console.log("O número equivale ao mes de Junho")
    }
    else if(n == 7){
        console.log("O número equivale ao mes de Julho")
    }
    else if(n == 8){
        console.log("O número equivale ao mes de Agosto")
    }
    else if(n == 9){
        console.log("O número equivale ao mes de Setembro")
    }
    else if(n == 10){
        console.log("O número equivale ao mes de Outubro")
    }
    else if(n == 11){
        console.log("O número equivale ao mes de Novembro")
    }
    else if(n == 12){
        console.log("O número equivale ao mes de Dezembro")
    }
    else if(n == 0){
        console.log('O número 0 é inválido')
    }
    else{
        console.log("Você inseriu um número maior que 12")
    }

}main()