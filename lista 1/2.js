const prompt = require('prompt-sync')();
// Entrada
const hora = Number(prompt('Hora: '))
const minuto = Number(prompt('Minuto: '))
// Processamento
const resultado = hora * 60
// Saída
console.log(hora,('hora em minutos é'), resultado, ('minutos'))