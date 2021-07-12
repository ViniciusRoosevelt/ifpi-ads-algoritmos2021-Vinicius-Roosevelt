/* Leia um número inteiro menor que 1000 e imprima a quantidade de centenas, dezenas e unidades do
número. Observando os termos no plural a colocação do "e", da vírgula entre outros. Exemplos:
o 326 = 3 centenas, 2 dezenas e 6 unidades
o 12 = 1 dezena e 2 unidades */
const prompt = require('prompt-sync')()
function main(){
    const n = Number(prompt('Qual Número deseja verificar'))
    let c,d,u
    if(n < 1000){
        c = n / 100 // 326 / 100 = 3.26
        c1 = Math.floor(c,0) * 100 // 3 * 100 = 300
        d = (n - c1)  // 326 - 300 = 26
        d1 = d / 10 // 26 / 10 = 2.6
        u = d - (Math.floor(d1,0) * 10) // 26 - 20 = 6
        console.log('Unidade da Centena: ',Math.floor(c,0))
        console.log('Unidade da Dezena: ',Math.floor(d1,0))
        console.log('Unidade das Unidades: ',Math.floor(u,0))
    }else{
        console.log('Você inseriu um número errado,tente novamente')
        return main()
    }
}main()