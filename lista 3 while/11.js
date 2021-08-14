const prompt = require('prompt-sync')()
function main(){
    console.log('### QUESTÂO DAS MEDIAS ###')
    let m,nota1,nota2,nota3
    m = Number(prompt('Insira a matrícula: ')) // Entrada da Matrícula
while(m !== 0){ // Condição de parada do algoritmo
 
    for(let i = 0;i <= m; i++){
        nota1 = Number(prompt('Insira a nota1: ')) // Entrada das notas
        nota2 = Number(prompt('Insira a nota2: '))
        nota3 = Number(prompt('Insira a nota3: '))
        let media = ((2* nota1) + (3 * nota2) + (5 * nota3)) / 10 // Processamento das notas
        if(media >= 7){
            console.log(`O Aluno da Matrícula ${m} foi aprovador`) // Saída de aprovado
        }else{
            console.log(`O Aluno da Matrícula ${m} foi reprovaodr`) // Saída de reprovado
        }
        m = Number(prompt('Insira a matrícula: ')) // Novo Dado da Matrícula e tambem para o algoritmo
    }
}
}main()