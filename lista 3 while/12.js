/* Leia vários códigos do jogador (1 ou 2) que ganhou o ponto, em uma partida de pingue-pongue, e
responda quem ganha a partida. A partida chega ao final se:
· Um dos jogadores chega a 21 pontos e a diferença de pontos entre os jogadores é maior ou igual a 2.
· Se a primeira não for atendida, ganha aquele que, com mais de 21 pontos, consiga colocar uma
diferença de 2 pontos sobre o adversário. */
const prompt = require('prompt-sync')()
function main(){
    let ponto_a,ponto_b
    ponto_a = 0
    ponto_b = 0
 while(pontos(ponto_a, ponto_b)){
    let jogador = Number(prompt('Ponto de :')) 
    if(jogador == 1){
 ponto_a++
    }else{
ponto_b++
    }
 }
    let ganhador = 'Vecedor: jogardor'
    if(ponto_a > ponto_b){
        ganhador = ganhador + '1' 
    }else{
        ganhador = ganhador +  '2'
    }
    console.log(ganhador)
}
function pontos(ponto_a, ponto_b){
    const alvo = 21
    const dif = Math.abs(ponto_b - ponto_a)
    if(ponto_a < 21 && ponto_b < 21){
        return true
    }else if(dif < 2){
        return true
    }else{
        return false
    }
}main()