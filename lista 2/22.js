/* Leia 2 datas (cada data é composta por 3 variáveis inteiras: dia, mês e ano) e escreva qual delas é a mais
recente. */
const prompt = require('prompt-sync')()
function main(){
    console.log('Insira os dados da primeira data')
    const d = Number(prompt("Insira o dia:"))
    const m = Number(prompt("Insira o mês:"))
    const a = Number(prompt("Insira o ano:"))
    console.log('Insira os dados da primeira data')
    const d1 = Number(prompt("Insira o dia:"))
    const m1 = Number(prompt("Insira o mês:"))
    const a1 = Number(prompt("Insira o ano:"))
    if(d > d1 && m1 > m && a > a1){
        console.log(d,'/',m,'/',a,'é a mais recente')
    }else if(d == d1 && m1 > m && a > a1){
        console.log(d,'/',m,'/',a,'é a mais recente')
    }else if(d == d1 && m1 == m && a > a1){
        console.log(d,'/',m,'/',a,'é a mais recente')
    }else if(d == d1 && m1 > m && a == a1){
        console.log(d,'/',m,'/',a,'é a mais recente')
    }
}