// Entrada- Leia um valor em real (R$), calcule e escreva 70% deste valor.
const prompt = require('prompt-sync')();
const valor = Number(prompt('Qual o valor deseja descobrir uma % dele: '))
const part = Number(prompt('Qual o % deseja saber ex: 13/100 = 0.13(Coloque ponto e sim vírgula): '))
// Processamento
const multiplicação = (valor * part)
// Saída 
console.log('A parte do valor:',valor,'è igual a:',multiplicação.toFixed(2))