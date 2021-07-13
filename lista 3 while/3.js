/* Leia 2 (dois) números, calcule e escreva o mdc (máximo divisor comum)- fatores primos entre os números lidos. */
const prompt = require('prompt-sync')()
function main(){
    const n = Number(prompt('Insira um número: '))
    const n1 = Number(prompt('Insira um número: '))
    // Processmaneto

    
    if(n > 0 && n1 > 0){ // Coloco a condição dos dados nõ seres zero pq se não o mdc dar 0
        let resto,x,resto1,y,z
    x = 1
    y = n
    z = n1
    resto = y % x
    resto1 = z % x
        while(resto !== 0 && resto1 !== 0 && ){
y
x++
console.log(`O MDC entre ${n} e ${n1} é ${mdc}`)
        }
    
        }else{
            console.log('Você inseriu dados inválidos')
        }
    }main()