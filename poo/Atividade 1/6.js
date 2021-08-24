/* Escreva um programa que leia uma sequência de números inteiros terminada por –1 e
imprima na tela a soma e a média aritmética destes números. Obs: o valor –1 é
somente um terminador e não deve ser considerado nos cálculos. */
const prompt = require('prompt-sync')()
function main(){
    console.log("### INSIRA -1 PARA ENCERRAR ")
    const x = Number(prompt("Insira um número: "))
    let x1 = Number(prompt("Insira outro número número: "))
    let soma = x+x1
    let media = (x+x1)/ 2
    console.log("Soma:",soma,"Mèdia:",media)
    let i = 0
    let contador = 3
    if(x2 = -1){
        for(x2 = Number(prompt("Insira outro número: ")); x2 != -1;x2 = Number(prompt("Insira outro número: "))){
            let soma1 = soma+x2
            let media2 = soma1 / contador
            console.log("A soma:",soma1,"a média:",media2)
            contador++
        }
    }  
}main()