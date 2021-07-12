// Leia o valor da base e altura de um retângulo, calcule e escreva sua área. (área = base * altura)
const prompt = require('prompt-sync')();
// Entrada
const altura = Number(prompt('Quanto mede seu altura: '))
const base = Number(prompt('Quanto mede sua base: '))
// Processamenot area=(base x altura)
// Saída
const area = (base * altura)
console.log('Sua área é: ', area)