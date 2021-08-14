// Entrada - Leia uma velocidade em m/s, calcule e escreva esta velocidade em km/h. (Vkm/h = Vm/s * 3.6)
const prompt = require('prompt-sync')();
const velocidade_ms = Number(prompt('Velocidade (m/s)'))
// Processamento
const velocidade_km = velocidade_ms * 3.6
// Saída
console.log('A velocidade', velocidade_ms, 'm/s')
console.log('igual á', velocidade_km, 'km/h')
