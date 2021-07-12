const prompt = require('prompt-sync')();
//entrada
const salario = Number(prompt('Salário (R$): '))
const aumento = Number(prompt('Quanto é o aumento em número decimal Ex: 35/100 = 1.35(Não use virgula e sim ponto): '))
// Processamento
const aumento_salarial = (salario * aumento)
// Saída
console.log('Salario antigo é: ', salario, 'R$')
console.log('Novo Salario é: ', aumento_salarial, 'R$')