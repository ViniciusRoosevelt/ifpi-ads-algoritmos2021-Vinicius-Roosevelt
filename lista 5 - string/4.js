/* Leia uma frase e gere uma nova frase, duplicando cada caractere da frase digitada. */
const prompt = require('prompt-sync')()
function main(){
    let frase = prompt('Insira um Frase: ')
    let duplicar = frase
    console.log(frase,duplicar)
}
main()