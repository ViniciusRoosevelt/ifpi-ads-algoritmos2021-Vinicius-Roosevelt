const prompt = require('prompt-sync')
function credito(){
    let c = Number(prompt('Qual empréstimo deseja:41000 , 60000 ou 81000  : '))
    const p = Number(prompt('Qual parcela deseja: 1000,1200,1500: '))
    let t = 1
    let montate = p * Math.pow((1), t)
    if(montate <= c){
        for((montate =p * Math.pow((1), t));(montate < c);(t++)){
            c = ((c-p)*1.01)
            let juros = c * 0.01
            console.log(`${t}° mês saldo devedor ${Math.round(c)}`)
            console.log(`${juros} do mês ${t}°`)
        }
    }
}credito()