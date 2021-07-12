// Entrada - Leia uma temperatura em °F, calcule e escreva a equivalente em °C. (t°C = (5 * t°F - 160) / 9).
const prompt = require('prompt-sync')()
const f = Number(prompt('Qual a temperatura °F que deseja transformar: '))
// Processamento
const formula = (f-32) / 1.8
// Saída
console.log('A temperatura transformada de °F em °C é:',formula.toFixed(2),'°C')