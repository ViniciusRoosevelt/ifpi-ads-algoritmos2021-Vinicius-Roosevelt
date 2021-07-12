const prompt = require('prompt-sync')()
function credito(){
    // Entrada dos Dados -
    let c = Number(prompt('Qual empréstimo deseja:41000 , 60000 ou 81000  : ')) // Dado dos empréstimos
    const p = Number(prompt('Qual parcela deseja: 1000,1200,1500: ')) // Dado das parcelas
    let t = 1
    let montate = p * Math.pow((1), t) // Uso juros composto para um montate de cada mês
    if(montate <= c){ // Condiciono a existência do montante
        while(montate <= c || (montate - c) < 0) { // Condiciono o montante em relação em c para ele sempre calcular o novo montante e o novo saldo devedor
            console.log(`Extrato do mês ${t}° novo saldo: ${Math.round(c-p)}`) // Saída do novo Saldo
            console.log(`Saldo Anterior: ${Math.round(c)}`) // Saída do Saldo Antigo
            let juros = (c - p) * 0.01 // Formulá do Juros
            c = ((c-p)*1.01) // Formula do novo valor do Emprestimo - Parcela * juros
        console.log(`Juros: ${Math.round(juros)}`) // Saída do Juros do Mês
        console.log(`Parcela: ${p}`) // Parcela fixa do mês
        
    t++
    }    
}
}credito()