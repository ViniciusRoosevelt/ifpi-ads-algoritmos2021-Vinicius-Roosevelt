// Escreva um programa que leia um vetor de 5 posições e apresente-o na tela.
const prompt = require('prompt-sync')()
function main(){
    let vetor
    console.log("Insira 5 Números: ")
    const n = Number(prompt(":"))
    const n1 = Number(prompt(":"))
    const n2 = Number(prompt(":"))
    const n3 = Number(prompt(":"))
    const n4 = Number(prompt(":"))
    vetor = new Array(4)
    vetor = [n,n1,n2,n3,n4]
    console.log("Aqui está os vetores \n",vetor)
}main()