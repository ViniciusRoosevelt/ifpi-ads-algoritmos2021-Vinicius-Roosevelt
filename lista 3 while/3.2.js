/* Leia uma lista de números e que para cada número lido, escreva o próprio número e a relação de seus
divisores. (flag número = 0). */
const prompt =require('prompt-sync')()
function main(){
    console.log('### MDC ###')
    const n = Number(prompt('Insira o primeiro Número: '))
    const n1 = Number(prompt('Insira o segundo Número: '))
    let x = 2
    let a,b,c,resto,resto1
resto = n % x
resto1 = n1% x
a = n / x
b = n1 / x
x = 1
    
    if(n > 0 && n1 > 0){
        while(resto == 0 && resto == 0 && n == 1 && n1 !== 1){
            n = a = resto
            n1 = b = resto1
            while((n*n1) / (resto*resto1) == 0){
                let mdc = (n * n1)/ (resto*resto1)
            }

        }while(resto == 1 && resto1 == 1){
            x++
            resto!
            

        }
    }
}main()