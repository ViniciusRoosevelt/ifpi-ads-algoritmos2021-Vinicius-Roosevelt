/* Escreva uma função que dados um inteiro n e um inteiro d, onde 0 < d ≤ 9, devolve
quantas vezes o dígito d aparece no número n. Por exemplo: se n = 7677 e d = 7, a
função deve retornar 3. */
const prompt = require('prompt-sync')()
function main(){
    const n = Number(prompt("Insira um número de no máximo 4 casas decimais: "))
    const d = Number(prompt("Insira um digíto entre 0 e 9 para vermos quantas vezes ele aparece no número acima: "))
    if(d >= 0 && d <= 9 && n <= 9999){
        let m,c,d1,u,contador,vetor
        contador = 0
        m = Math.floor(n/1000) // 7
        c = Math.floor((n % 1000) / 100) // 677 / 100 = 6
        d1 = Math.floor(((n % 1000) % 100) / 10) // 77 / 10 = 7
        u = Math.floor(((n % 1000) % 100) % 10) // 77 % 10 = 7
        vetor = new Array(4)
        vetor = [m,c,d1,u]
        for(let i = 0 ; i != vetor.length;i++){
            if(vetor[i] == d){
                contador++
            }
        }
        console.log(d,'Aparece:',contador)}
    }main()
