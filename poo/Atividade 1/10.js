/* 10. Escreva um programa que leia um texto pelo teclado e remova todas as suas vogais.
Exiba a string resultante. */
const prompt = require('prompt-sync')()
function main(){
    let t = prompt("Insira um texto: ")
    let i = 0
    while(i <= t.length){
        i++
        if(t[i] == 'a' || t[i] == 'e' || t[i] == 'i' || t[i] == 'o' || t[i] == 'u'){
            console.log(t.split('a').join('').split('e').join('').split('i').join('').split('o').join('').split('u').join(''))
        }
    }
}main()