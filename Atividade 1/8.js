/* Escreva um programa que leia e mostre um vetor de 20 elementos inteiros. A seguir,
conte quantos valores pares existem
no vetor. */
const prompt = require('prompt-sync')()
function main(){
    let vetor
    console.log("Insira 20 Números: ")
    const n = Number(prompt(":"))
    const n1 = Number(prompt(":"))
    const n2 = Number(prompt(":"))
    const n3 = Number(prompt(":"))
    const n4 = Number(prompt(":"))
    const n5 = Number(prompt(":"))
    const n6 = Number(prompt(":"))
    const n7 = Number(prompt(":"))
    const n8 = Number(prompt(":"))
    const n9 = Number(prompt(":"))
    const n10 = Number(prompt(":"))
    const n11 = Number(prompt(":"))
    const n12 = Number(prompt(":"))
    const n13 = Number(prompt(":"))
    const n14 = Number(prompt(":"))
    const n15 = Number(prompt(":"))
    const n16 = Number(prompt(":"))
    const n17 = Number(prompt(":"))
    const n18 = Number(prompt(":"))
    const n19 = Number(prompt(":"))
    vetor = new Array(19)
    vetor = [n,n1,n2,n3,n4,n5,n6,n7,n8,n9,n10,n11,n12,n13,n14,n15,n16,n17,n18,n19]
    let contador = 0
    for(let i = 0 ; i != vetor.length ; i++){
        if(vetor[i] % 2 == 0){
            contador++
        }
    }
    console.log('Há',contador,"números pares")
}main()