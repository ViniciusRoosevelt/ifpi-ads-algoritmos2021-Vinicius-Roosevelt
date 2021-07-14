const entrada = require('prompt-sync')()
function main(){
    console.log('### SEGREDO ###')
    let texto = entrada('Insira um texto para criptografar')
    texto = texto.split('').reverse('').join('')
    console.log(texto)
}main()