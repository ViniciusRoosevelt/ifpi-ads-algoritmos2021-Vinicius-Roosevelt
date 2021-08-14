// Entrada - Leia um valor em kg (quilograma), calcule e escreva o equivalente em g (grama).
const prompt = (require('prompt-sync'))();
const kg = Number(prompt('Quantos quilograma deseja transformar em gramas: '))
// Processamento - 1 KG = 1000 g
const g = kg * 1000
// Saída 
console.log(kg,'kg equivale a:',g,'g')