/* Para o cálculo de uma folha de pagamento, sabendo que os descontos são do Imposto de Renda, que
depende do salário bruto (conforme tabela abaixo) e 3% para o Sindicato e que o FGTS corresponde a
11% do salário bruto, mas não é descontado (é a empresa que deposita). O salário líquido corresponde
ao salário bruto menos os descontos. O programa deverá pedir ao usuário o valor da sua hora e a
quantidade de horas trabalhadas no mês.
Desconto do IR:
o Salário Bruto até R$ 900,00 (inclusive) - isento
o Salário Bruto até R$ 1.500,00 (inclusive) - desconto de 5%
o Salário Bruto até R$ 2.500,00 (inclusive) - desconto de 10%
o Salário Bruto acima de R$ 2.500,00 - desconto de 20%
Escreva na tela as informações, dispostas conforme o exemplo abaixo. No exemplo o valor da hora é 5 e
a quantidade de hora é 220.
Salário Bruto: (5 * 220) : R$ 1100,00
(-) IR (5%) : R$ 55,00
(-) INSS ( 10%) : R$ 110,00
FGTS (11%) : R$ 121,00
Total de descontos : R$ 165,00
Salário Liquido : R$ 935,00 */
const prompt = require('prompt-sync')()
function output(){
    // Entrada
    const h = Number(prompt('Quantidade de horas dadas: '))
    const v = Number(prompt('Qual valor da hora aula: '))
    const s = h * v
    const inss = s * 0.10
    const fgts = s * 0.11
 // Processamento
    let desconto

    if(s <= 900){ 
        // Caso 1
        console.log('Quantidade de horas x valor delas em R$:',h,'*',v)
        console.log('Salário Bruto: ',s)
        console.log('IR(0%): ',0)
        console.log('INSS(10%): ',inss)
        console.log('FGTS(11%): ',fgts)
        desconto =((inss)+fgts)
        console.log('Total Descontos:',desconto)
        console.log('Salário Liquido:',(s-desconto))
    }else if(s > 900 && s <= 1500){
        // Caso 2
        console.log('Quantidade de horas x valor delas:',h*v)
        console.log('Salário Bruto: ',s)
        console.log('IR(5%): ',s*0.05)
        console.log('INSS(10%): ',inss)
        console.log('FGTS(11%): ',fgts)
        desconto =((inss)+(fgts)+(s*0.05))
        console.log('Total Descontos:',desconto)
        console.log('Salário Liquido:',(s-desconto))
    }else if(s > 1500 & s >= 2500){
        // Caso 3
        console.log('Quantidade de horas x valor delas:',h*v)
        console.log('Salário Bruto: ',s)
        console.log('IR(10%): ',s*0.10)
        console.log('INSS(10%): ',inss)
        console.log('FGTS(11%): ',fgts)
        desconto =((inss)+(fgts)+(s*0.10))
        console.log('Total Descontos:',desconto)
        console.log('Salário Liquido:',(s-desconto))
    }else{
        // Caso 4
        console.log('Quantidade de horas x valor delas:',h*v)
        console.log('Salário Bruto: ',s)
        console.log('IR(20%): ',s*0.2)
        console.log('INSS(10%): ',inss)
        console.log('FGTS(11%): ',fgts)
        desconto =((inss)+(fgts)+(s*0.2))
        console.log('Total Descontos:',desconto)
        console.log('Salário Liquido:',(s-desconto))
    }
}output()