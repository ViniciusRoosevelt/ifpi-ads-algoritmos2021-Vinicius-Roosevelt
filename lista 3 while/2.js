/* Leia 2 (dois) números, calcule e escreva o mmc (mínimo múltiplo comum) entre os números lidos. */
const prompt = require('prompt-sync')()
function main(){
    console.log('### MMC de dois números ###')
    let n = Number(prompt('Insira o primeiro Número: '))
    let n1 = Number(prompt('Insira o segundo Número: '))
    // Processamento 
    var resto,x,y
    x = n
    y = n1
    if(n > 0 && n1 > 0){
    while(resto != 0){
        resto = x % y
        x = y
        y = resto
    }
    let MMC = (n * n1)/x
console.log('O MMC entre',n,'e',n1,`(${MMC})`)
    }else{
        console.log('Você inseriu números errados')
    }
}main()