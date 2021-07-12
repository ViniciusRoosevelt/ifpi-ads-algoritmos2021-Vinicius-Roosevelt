const prompt = require('prompt-sync')();
// Entrada - Leia o valor do raio de uma esfera, calcule e escreva seu volume. (v = (4 * pi * r^3) / 3) (p = 3,14)
const pi = Number(prompt('Qual o valor de pi(não esqueca de colocar um ponto ao ínves da vírgula): '))
const raio = Number(prompt('Qual o raio: '))
// Processamento
const multiplicação = (4 * pi * Math.pow(raio, 2 ))
const divisão = (multiplicação/3)
// Saida
console.log('O volume da esfera é: ', divisão.toFixed(2))