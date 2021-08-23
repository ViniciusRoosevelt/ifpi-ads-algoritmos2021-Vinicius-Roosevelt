/* 1. Escreva um programa que possua uma variável com um número inteiro e mostre seu
antecessor e sucessor. */
const prompt = require('prompt-sync')();
function main(){
    var n1,n2
    const n = Number(prompt("Insira número para vermos o seu sucessor e antecessor: "))
    n1 = n - 1
    n2 = n1+1
    console.log("O Sucessor é:",n2,'E o antecessor é:',n1,)
}main()