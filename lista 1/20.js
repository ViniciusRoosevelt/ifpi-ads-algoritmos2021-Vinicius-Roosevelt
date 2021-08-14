// Leia uma temperatura em °C, calcule e escreva a equivalente em °F. (t°F = (9 * t°C + 160) / 5)
const prompt = require('prompt-sync')();
const C = Number(prompt('Qual a temperatura em °C que deseja transformar em °F: '))
// Processamento
const multi = (((C * 9) + 160) / 5)
// Saída
console.log('A temperatura transformada é:',multi,'°F')