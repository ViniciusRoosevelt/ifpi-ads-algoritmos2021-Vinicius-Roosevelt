/* Leia uma frase e gere uma nova frase, retirando os espaços entre as palavras. */
const prompt = require('prompt-sync')()
function main(){
    console.log('### QUESTÂO DE ESPAÇO ###')
    let texto = prompt('Insira um Texto: ') // EX : OI BB
    let junção = texto.split(' ') // Retira o segmentos e fica tipo O,I,B,B retirado espaços
    for(let i = 0 ; i <= junção.length; i++){
        junção[i]
    }
    // Saída
    juntar = junção.join('') // Esse join transforma novamente a string só que agora sem o espaço
    console.log(juntar)
}main()