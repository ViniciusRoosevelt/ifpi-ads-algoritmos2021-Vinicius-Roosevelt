const prompt = require('prompt-sync')();
// Entrada - Leia um número inteiro (3 dígitos) e escreva o inverso do número. (Ex.: número = 532 ; inverso = 235)  
let rev = 0
let numero = Number(prompt('Qual Número deseja inverter: '))
// Processamento -
rev = Number(String(numero).split('').reverse().join(''));
// Saída
console.log('Seu número reverso é: ', rev)