const prompt = require('prompt-sync')()
function gateway(){
    let c = Number(prompt('Insira o valor da compra: ')) // Entrada do dado da compra
    let d = Number(prompt('Insira o prazo em dias (2 à 31 dias): ')) // Entrada dos dias
    let p = Number(prompt('Insira o número de parcelas(0 = ávista): ')) // Entrada se é avista ou parcelado
  // Processamento
  let liquido,juros // Dou variável para liquido e juros
    juros = ((p*0.01) * c) +(c * 0.0439)+0.40 // Juros sobre a compra
    liquido = c - juros // Valor Liquído = Valor da compra - Juros
    if(d >= 2 && d < 14 ){ // Aparti de agora eu vou qualificar os dias e depois qualificar dentro dos dias se é a prazo ou àvista
if(p == 0){ // Caso do Caso: nessa probabilidade o dinheiro é àvista
// Saída 
console.log(`
-----------------------------------------
O valor da compra é: ${c} 
-----------------------------------------
A forma de pagamento é: parcelado
-----------------------------------------
O valor liquído é: ${liquido.toFixed(2)}
-----------------------------------------
A taxa é: ${juros.toFixed(2)}
-----------------------------------------
A data de recepimento é ${d} dias`)
}else if(p > 0 && p <= 12){ // Caso do Caso: nessa probabilidade o dinheiro é a prazo
    // Saída 
    console.log(`
    --------------------------------------------
    O valor da compra é: ${c}
    --------------------------------------------
    A forma de pagamento é a vista em ${p} vezes
    --------------------------------------------
    O valor liquído é: ${liquido.toFixed(2)}
    -------------------------------------------
    A taxa é: ${juros.toFixed(2)}
    -------------------------------------------
    A data de recepimento é ${d} dias`)
}
}else if(d >= 14 && d < 31 ){
    if(p == 0){ // Caso do Caso: nessa probabilidade o dinheiro é àvista
    // Saída 
    console.log(`
    -----------------------------------------
    O valor da compra é: ${c}
    -----------------------------------------
    A forma de pagamento é: parcelado
    -----------------------------------------
    O valor liquído é: ${liquido.toFixed(2)}
    -----------------------------------------
    A taxa é: ${juros.toFixed(2)}
    -----------------------------------------
    A data de recepimento é ${d} dias`)
    }else if(p > 0 && p <= 12){ // nessa probabilidade o dinheiro é a prazo
        // Saída 
        console.log(`
        --------------------------------------------
        O valor da compra é: ${c}
        --------------------------------------------
        A forma de pagamento é a vista em ${p} vezes
        --------------------------------------------
        O valor liquído é: ${liquido.toFixed(2)}
        --------------------------------------------
        A taxa é: ${juros.toFixed(2)}
        --------------------------------------------
        A data de recepimento é ${d} dias`)
    }
    }else if(d == 31){
        if(p == 0){ // Caso do Caso: nessa probabilidade é àvista
        // Saída 
        console.log(`
        -----------------------------------------
        O valor da compra é: ${c}
        -----------------------------------------
        A forma de pagamento é: parcelado
        -----------------------------------------
        O valor liquído é: ${liquido.toFixed(2)}
        -----------------------------------------
        A taxa é: ${juros.toFixed(2)}
        -----------------------------------------
        A data de recepimento é ${d} dias`)
        }else if(p > 0 && p <= 12){ // nessa probabilidade o dinheiro é a prazo
           // Saída
            console.log(`
            -----------------------------------------
            O valor da compra é: ${c}
            -----------------------------------------
            A forma de pagamento é: parcelado
            -----------------------------------------
            O valor liquído é: ${liquido.toFixed(2)}
            -----------------------------------------
            A taxa é: ${juros.toFixed(2)}
            -----------------------------------------
            A data de recepimento é ${d} dias`)

        }
        }else if(p > 12){ // Caso o usuário insira a variável parcelas maior que 12
            // Saída 
            console.log('Você inseriu uma parcela inválida')
        }else{ // Caso o usuário insira a variável dias maior que 31
            // Saída 
            console.log('Você inseriu um dia inválido')}
}gateway()