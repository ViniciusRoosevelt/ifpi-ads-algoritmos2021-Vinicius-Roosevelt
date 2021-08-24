/* Construir um programa que leia uma string s, e dois caracteres a e b. Em seguida, o
programa deve substituir todas as ocorrências do caractere a na string s pelo caractere
b. */
const prompt = require('prompt-sync')()
function main(){
    let s = prompt("Insira um texto: ")
    console.log(s.split('b').join('a'))
}main()