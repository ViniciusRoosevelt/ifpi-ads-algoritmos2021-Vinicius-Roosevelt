// 1 -
console.log("Questão 1")
let numeros : number[] = [1,2,3,4,5,];
let soma = 0;
for (let i : number = 0; i < numeros.length;i++){ // Laço de pecorrer elementos
    soma = soma+numeros[i]; // Atualizo com valor anterior de soma e adiciono com o novo
}
console.log(soma); // Saída da soma
console.log("Questão 2")
/* 2 - Atravé desse laço de repetição é mostrado todos os elementos do array até que chegue a posição
 5 que não foi definida */
let a : number[] = [1,2,3,4,5];
for (let i : number = 0; i <= a.length; i++) {
console.log(a[i]);
}
// 3 - 
console.log("Questão 3")
let array : Array<number> = [1,2,3,4,5,6,7,8,9,10];
console.log(array.reverse())
console.log(array.sort())
// 4 -
console.log("Questão 4");
let instituto : string = "Instituto Federal do Piauí"
console.log(instituto.toLocaleUpperCase()) // Coloca em maisculo todas as letras
console.log(instituto[10]) // Mostra elemento da posição 10
console.log(instituto.indexOf('o',1)) // Procura a ultima pósição da letra o
console.log(instituto.split(' ')) // Quebra os espaço e mostra separadamente