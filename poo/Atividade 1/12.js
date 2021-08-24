/* Faça uma função que recebe por parâmetro uma medida de tempo expressa em
segundos e retorna, também por parâmetro, esse tempo em horas, minutos e
segundos no formato: “hh:mm:ss”. */
const prompt = require('prompt-sync')()
function converter(){
    let horas,minutos
    let segundos = Number(prompt("Insira um tempo em segundos: "))
    horas = Math.floor(segundos / 3600)
    minutos = Math.floor(segundos / 60)
    segundos = segundos % 60

    
    
    console.log("o valor transformado é",horas,':',minutos,':',segundos)
}converter()