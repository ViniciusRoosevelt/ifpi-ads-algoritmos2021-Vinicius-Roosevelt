// Entrada - Leia um valor em km, calcule e escreva o equivalente em m.
const prompt = require('prompt-sync')();
const km = Number(prompt('Quantos kilometros deseja transformar em metors:'))
// Processamento 1 km = 1000 m 
const m = km * 1000
// Saída 
console.log(km, 'km equivale a:',m,'m')