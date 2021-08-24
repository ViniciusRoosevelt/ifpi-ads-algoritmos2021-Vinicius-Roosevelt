/* Escrever um programa que leia três valores inteiros e apresente o menor dos valores
lidos */
const prompt = require('prompt-sync')()
function main(){
    const n = Number(prompt("Insira o primeiro número: "))
    const n1 = Number(prompt("Insira o segundo número: "))
    const n2 = Number(prompt("Insira o terceiro número: "))
    if(n > n1 && n1 < n2){
        console.log("O maior é",n,'e o menor é',n1)
    }
    else if(n > n1 && n1 > n2){
        console.log("O maior é",n,'e o menor é',n2)
    }
    else if(n1 > n && n > n2){
        console.log("O maior é",n1,'e o menor é',n2)
    }
    else if(n1 > n && n < n2){
        console.log("O maior é",n1,'e o menor é',n)
    }
    else if(n2 > n && n > n1){
        console.log("O maior é",n2,'e o menor é',n1)
    }
    else{
        console.log("O maior é",n2,'e o menor é',n)
    }
}main()