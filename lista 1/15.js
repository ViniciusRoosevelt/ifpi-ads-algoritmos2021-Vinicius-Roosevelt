// Entrada - Leia o valor da base e altura de um triângulo, calcule e escreva sua área. (área=(base * altura)/2)
const prompt = require('prompt-sync')();
const altura = Number(prompt('Qual altura do seu triângulo: '))
const base = Number(prompt('Qual a base do seu triângulo: '))
// Processamento 
const alturaxbase = (base * altura) / 2 

// Saída 
console.log('A área do seu triângulo é: ', alturaxbase)