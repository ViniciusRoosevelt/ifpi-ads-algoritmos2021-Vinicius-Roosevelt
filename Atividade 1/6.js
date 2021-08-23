/* Escreva um programa que leia uma sequência de números inteiros terminada por –1 e
imprima na tela a soma e a média aritmética destes números. Obs: o valor –1 é
somente um terminador e não deve ser considerado nos cálculos. */
const prompt = require('prompt-sync')()
function main(){
    console.log("### INSIRA -1 PARA ENCERRAR ")
    const x = Number(prompt("Insira um número:"))
    let x1 = Number(prompt("Insira outro número número:"))
    let soma = x+x1
    let media = (x+x1)/soma
    console.log("Soma:",soma,"Mèdia:",media)
    let i = 0 
    while(i != -1){
        if(i != -1){let i = Number(prompt("Insira outro número: "))
        let soma1 = soma+i
        let media2 = media + (soma1 / soma1)
        console.log('Soma:',soma1,'Mèdia:',media2)
    }
 }     
}main()