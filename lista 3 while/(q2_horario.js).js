/* Leia um horário no formato hh:mm:ss e escreva o resultado na
seguinte forma: “hh hora(s), mm minuto(s) e ss segundo(s) */
const prompt = require('prompt-sync')()
function tempo(){
    const t = prompt('Insira um horário no formato,hh:mm:ss :')
    console.log(`${t.length[0]}${t.length[1]}horas`)
}