/* Leia um horário no formato hh:mm:ss e escreva o resultado na
seguinte forma: “hh hora(s), mm minuto(s) e ss segundo(s) */
const prompt = require('prompt-sync')()
function tempo(){
    console.log('### Só uma Questão de tempo ###')
    // Entrada dos dados
    const t = prompt('Insira um horário no formato,hh:mm:ss,Ex:09:59:59 ,:')
    /* Processamento - Os números ficaram armazenados respectivamente nas posições da String t em: {0,1}(horas),{3,4}(minutos),{6,7}(segundos)*/
    console.log(`${t[0]}${t[1]} hora(s)`) // Saídas das Horas
    console.log(`${t[3]}${t[4]} minuto(s)`) // Saída dos minutos
    console.log(`${t[6]}${t[7]} segundo(s)`) // Saída dos segundos
}tempo()