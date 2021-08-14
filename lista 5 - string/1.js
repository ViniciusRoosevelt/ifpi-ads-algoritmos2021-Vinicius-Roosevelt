const entrada = require('prompt-sync')()
function main(){
    console.log('### SEGREDO ###')
    let texto = entrada('Insira um texto para criptografar: ')
    let troca = texto.split('').reverse('').join('').replace('/bcdfghijkl,m,n,p,q,r,s,t,v,w,x,y,z')
    console.log(troca)
}main()