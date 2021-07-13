/* Leia um número e divida-o por dois (sucessivamente) até que o resultado seja menor que 1. Escreva o
resultado da última divisão efetuada. */
const prompt = require('prompt-sync')()
function main(){
    console.log('### Divisão por 2')
    const n = Number(prompt('Insira um número: '))
    // Processamento
    let div = n/2
    let x = 1
if(n >1){
    while(div >= 1){
    div = div /2
    x++
console.log(`${x}° divisão de ${n} por 2 até que essa divisão seja menor que 1 tem resultado ${div}`) // Saída 1
    
}
}else if(n == 1){
    console.log('Você não pode inserir 1 pq sempre 1 /2 = 0.5') // Saida 2
}else{
    console.log('Você não pode inserir 0 porque sempre 0 /2 = 0') // Saida 3
}
}main()