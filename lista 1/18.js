// Entrada - Leia o valor do raio de uma circunferência, calcule e escreva seu comprimento.(c = 2 * p * r)
const prompt = require('prompt-sync')();
const raio = Number(prompt('Qual o raio da sua circuferência: '))
// Processamento
const comprimento = (2 * 3.14 * raio)
// Saida
console.log('O comprimento da circunferência é: ',comprimento.toFixed(2))
