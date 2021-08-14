/* Leia uma lista de números e que para cada número lido, escreva o próprio número e a relação de seus
divisores. (flag número = 0). */
const entrada = require('prompt-sync')({
    sigint: true
})
    console.log('### MDC entre dois números ###')
function principal(){
    // Entrada
    const numero_a = Number(entrada('Insira um número: '))
    const numero_b = Number(entrada('Insira um segundo número: '))
    
    // Processamento
    let num_a = numero_a
    let num_b = numero_b
    if(numero_a > 0 && numero_b > 0){ // condição para o mdc acontecer
        while(num_b != 0){ // interação para acontecer o mdc
            let resto = num_a % num_b // criar um resto para redividir 
            num_a = num_b // o novo valor do número a será b
            num_b = resto // o novo valor do número b será resto
        }
        var mdc = num_a // o valor do mdc é numero a
    }else{
        // Saída 1
        console.log('Os números informados não são válidos')
    }
        // Saída 2
        console.log(`O MDC entre os números ${numero_a} e ${numero_b} é: ${mdc}`)


}
principal()