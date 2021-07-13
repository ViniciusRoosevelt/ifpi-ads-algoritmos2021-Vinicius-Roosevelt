const prompt = require('prompt-sync')()

function main(){
    const nome = prompt('Qual seu nome: ')
    let quantidade = 0
while (quantidade < 10){
    console.log(`${quantidade} Olá ${nome},tudo bem?`)
    quantidade = quantidade + 1
} console.log('Fim"')
}
main()