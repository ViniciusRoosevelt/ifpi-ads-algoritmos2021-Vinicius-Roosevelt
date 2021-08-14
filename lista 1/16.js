// Leia o valor do lado de um quadrado, calcule e escreva sua área. (área = lado2)
const prompt = require('prompt-sync')();
// Entrada
const lado = Number(prompt('Quanto mede a sea base: '))
const area = Math.pow(lado, 2)
// Saída
console.log('Sua área é: ', area)