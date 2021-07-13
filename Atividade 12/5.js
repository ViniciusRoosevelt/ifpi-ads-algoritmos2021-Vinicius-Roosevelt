/* Leia dois números X e N. A seguir, escreva o resultado das divisões de X por N onde, após cada
divisão, X passa a ter como conteúdo o resultado da divisão anterior e N é decrementado de 1 em 1, até
chegar a 2. */
const prompt = require('prompt-sync')()
function decaimento(){
    console.log('### Decremento ###')
    let n = Number(prompt('Insira um número:')) // Entrada
    let n1 = Number(prompt('Insira um número: ')) // Entrada
    // Processamento
    let div,x,y,z
    x = 1
    y = n
    z = n1
    div = n / n1
    if(n1 >= 2){ // condição de existência e parada do algoritmo quando n1 for igual a 2
        while(div !== 0 && n1 >= 2){
        console.log(`${x}° divisão de ${n} por ${n1} é igual ${div}`) // Saída
        n = div // X toma o valor da divisão
        n1 = n1 -1 // N decai
        div = n / n1 // Nova formula da divisão
        x++ // Dizer a ordem das divisões
    }
}
}decaimento()