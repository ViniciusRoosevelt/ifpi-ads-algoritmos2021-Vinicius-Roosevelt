function Greet(greeting) {
    var letras = [];
    for (var _i = 1; _i < arguments.length; _i++) {
        letras[_i - 1] = arguments[_i];
    }
    return greeting + letras.join(",");
}
console.log(Greet("a"));
console.log(Greet("a,", "b"));
console.log(Greet("a,", "b", "c"));
console.log(Greet("a,", "b", "c", "d"));
