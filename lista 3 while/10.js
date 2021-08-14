const entrada = require('prompt-sync')()

function principal(){
    // Entrada
    var quantidade_combustível = Number(entrada('Informe a quantidade de gasolina em litros: '))
    var peso_decolagem_exigido = 500000
    var peso_combustível = quantidade_combustível * 1.5
    var peso_decolagem_atual = peso_combustível + peso_carga + peso_passageiro + peso_bagagem

    if(quantidade_combustível >= 1000){
        var quantidade_container = Number(entrada('Informe a quantidade de containers: '))
        var peso_container = Number(entrada('Informe o peso dos containers: '))
        var peso_carga = peso_container * quantidade_container
        if(peso_carga <= peso_decolagem_exigido){
            var bilhete = 1 
            var quantidade_passageiro = 0
            var peso_bagagem = quantidade_bagagem * 10
            var peso_passageiro = quantidade_passageiro * 70
            var quantidade_bagagem =0
            while(bilhete !== 0){
                bilhete = Number(entrada('Informe o número do bilhete: '))
                let quantidade_bagagem = Number(entrada('Informe a quantidade de  bagagem:  '))
                peso_bagagem = quantidade_bagagem + (quantidade_bagagem * 10)
                peso_passageiro = quantidade_passageiro + (quantidade_passageiro * 70)
                quantidade_passageiro++
            }
            if(peso_decolagem_atual >= peso_decolagem_exigido){
                console.log(`A quantidade de passageiro é: ${quantidade_passageiro}`)
                console.log(`O peso das bagagens é: ${peso_bagagem}`)
                console.log(`O peso dos passageiros é: ${peso_passageiro}`)
                console.log(`O peso dos da carga é: ${peso_carga}`)
                console.log(`A quantidade de combustível é: ${quantidade_combustível}`)
                console.log('O voo pode ser levantado')
            }else{
                console.log(`A quantidade de passageiro é: ${quantidade_passageiro}`)
                console.log(`O peso das bagagens é: ${peso_bagagem}`)
                console.log(`O peso dos passageiros é: ${peso_passageiro}`)
                console.log(`O peso dos da carga é: ${peso_carga}`)
                console.log(`A quantidade de combustível é: ${quantidade_combustível}`)
                console.log('O voo não pode ser levantado')
            }
        }else{
            console.log('O peso dos containers informados são superiores ao de voo')
        }




    }else{
        console.log('A quantidade de combustível informada é inferiro a 1000 litros')
    }
   
}

principal()