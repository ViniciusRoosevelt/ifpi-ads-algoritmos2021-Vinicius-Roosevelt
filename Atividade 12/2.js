/* Leia um horário no formato hh:mm:ss e escreva o resultado na
seguinte forma: “hh hora(s), mm minuto(s) e ss segundo(s) */
const prompt = require('prompt-sync')()
function tempo(){
    console.log('### Só uma Questão de tempo ###')
    // Entrada dos dados
    const t = prompt('Insira um horário no formato,hh:mm:ss,Ex:09:59:59 ,:')
    /* Processamento - Os números ficaram armazenados respectivamente nas posições da String t em: {0,1}(horas),{3,4}(minutos),{6,7}(segundos)
     e a partir de agora eu vou classificar de acordo com o plural do português em que as posições 1,4 e 7 forem igual a 1 é singular e
     se forem plural sera > 1 e ai eu encaixo todas as possiblidades */
    if(t[1] == 1 && t[4] == 1 && t[7] == 1){ // Caso que todos são singulares
        console.log(`${t[0]}${t[1]} hora`)
        console.log(`${t[3]}${t[4]} minuto`)
        console.log(`${t[6]}${t[7]} segundo`)
    }else if(t[1] == 1 && t[4] == 1 && t[7] > 1){ // Caso em que t[1] e t[4] é singular e t[7] é plural
        console.log(`${t[0]}${t[1]} hora`)
        console.log(`${t[3]}${t[4]} minuto`)
        console.log(`${t[6]}${t[7]} segundos`)
    }else if(t[1] == 1 && t[4] > 1 && t[7] == 1){ // Caso em que t[1] e t[7] é singular e t[4] é plural
        console.log(`${t[0]}${t[1]} hora`)
        console.log(`${t[3]}${t[4]} minutos`)
        console.log(`${t[6]}${t[7]} segundo`)
    }else if(t[4] == 1 && t[1] > 1 && t[7] == 1 ){ // Caso em que t[4] e t[7] é singular e t[1] é plural
        console.log(`${t[0]}${t[1]} horas`)
        console.log(`${t[3]}${t[4]} minuto`)
        console.log(`${t[3]}${t[4]} segundo`)
    }else if(t[7] == 1 && t[4] > 1 && t[1] > 1){ // Caso em que t[4] e t[1] é plural e t[7] é singular
    console.log(`${t[0]}${t[1]} horas`) // Saídas Das Horas
    console.log(`${t[3]}${t[4]} minutos`) // Saída dos minutos
    console.log(`${t[6]}${t[7]} segundo`) // Saída dos segundos
}else{ // Caso que todos são plurais
    console.log(`${t[0]}${t[1]} horas`) // Saídas das Horas
    console.log(`${t[3]}${t[4]} minutos`) // Saída dos minutos
    console.log(`${t[6]}${t[7]} segundos`) // Saída dos segundos
}
}tempo()