/* Leia 2 (duas) notas parciais de um aluno, calcule a média e escreva a mensagem:
o "Aprovado", se a média alcançada for maior ou igual a sete;
o "Reprovado", se a média for menor do que sete;
o "Aprovado com Distinção", se a média for igual a dez. */
const prompt = require('prompt-sync')()
function main(){
    const n1 = Number(prompt('Qual a sua primeira nota: '))
    const n2 = Number(prompt('Qual a sua segunda nota: '))
    const media = (n1+n2) / 2
    if(media >= 7 && media < 10){
        console.log("Aprovado")
    }else if(media < 7){
        console.log("Reprovado")
    }else{
        console.log("Aprovado com Distinção")
    }
}main()