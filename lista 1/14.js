// Leia 3 notas de um aluno e o peso de cada nota, calcule e escreva a média ponderada.
const prompt = require('prompt-sync')();
// Entrada - as notas
console.log('Se não tiver pesos considere o peso da nota igual a 1')
const nota_1 = Number(prompt("Qual a nota 1: "))
const nota_2 = Number(prompt("Qual a nota 2: "))
const nota_3 = Number(prompt("Qual a nota 3: "))
const peso_1 = Number(prompt("Qual peso da nota 1: "))
const peso_2 = Number(prompt("Qual peso da nota 2: "))
const peso_3 = Number(prompt("Qual peso da nota 3: "))
const soma = (peso_1 + peso_2 + peso_3)
// Processamento
const mediaponderada = (nota_1 * peso_1 + nota_2 * peso_2 + nota_3 * peso_3) / (soma)
// Saída
console.log('A média das notas é: ', mediaponderada.toFixed(2))