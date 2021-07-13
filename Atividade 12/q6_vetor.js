const { obter_numero, maior_menor, media_calcular, positivo_negativo, repetidos } = require("./utils")

function main(){
    const números = obter_numero('Quantos números: ')

    const vetor = unir_numeros(números)
    const media = media_calcular(vetor, n)
    const maior_e_menor = maior_menor(vetor, números)
    const posi_negati = positivo_negativo(vetor, números)
    const reapet = repetidos(vetor)

    console.log('n:', media,'n:', maior_e_menor,'n:', posi_negati, 'n:', reapet)
}

function juntar_numeros(n) {
    const vetor = Array(n)

    for (let i = 0; i < n; i++){
        vetor[i] = obter_numero(`Elemento ${i}: `)
    }

    return vetor
}


main()