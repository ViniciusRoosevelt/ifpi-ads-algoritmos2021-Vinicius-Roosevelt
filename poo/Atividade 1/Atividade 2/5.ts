function Greet(greeting: string, ...letras :string[]){
    return greeting+letras.join(",")
}
console.log(Greet("a"))
console.log(Greet("a,","b"))
console.log(Greet("a,","b","c"))
console.log(Greet("a,","b","c","d"))
