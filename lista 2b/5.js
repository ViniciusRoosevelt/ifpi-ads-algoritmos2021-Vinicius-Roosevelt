/* Leia o preço de três produtos e informe qual produto deve ser comprado, sabendo que a decisão é
sempre pelo mais barato. */
const prompt = require('prompt-sync')()
function main(){
    // Entrada
    const p1 = Number(prompt('Qual primeiro preço do produto visto')) 
    const p2 = Number(prompt('Qual segundo preço do produto visto'))
    const p3 = Number(prompt('Qual terceiro preço do produto visto'))
    // Casos
if(p1 < p2 && p1 < p3){ // p1 menor preço
    console.log('Você deve optar pela primeira opção')
}else if(p2 < p1 && p2 < p3){ // p2 menor preço
    console.log('Você deve optar pela segunda opção')
}else{ // p3 menor preço
    console.log('Você deve optar pela terceira opção')
}
}main() // Saída