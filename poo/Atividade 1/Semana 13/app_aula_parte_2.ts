/* Q1
a - F
b - V
c - V
d - F
e - F
f - V
g - V
h - V
/* Questão 2 */
class Triangulo {
    a : number;
    b : number;
    c : number;
	


	constructor(a: number,b:number,c:number) {
		this.a = a
		this.b = b
		this.c = c
	}


    ehtriangulo(a: number,b:number,c:number){
        if((b-c) < a && (b+c) > a){
            return true;
        }
        else if((c-b) < a && (b+c) > a){
            return true;
        }
        else{
            return false;
        }
    }
    ehisoceles(a: number,b: number,c:number){
        if(this.ehtriangulo(a,b,c) == false){
            return false
        }
        else if(a == b || a == c || b == c){
            return true
        }
        else{
            return false
        }

    }
    ehequilatero(a: number,b: number,c:number){
        if(this.ehtriangulo(a,b,c) == false){
            return false
        }
        else if(a == b && b == c){
            return true
        }
    }
    ehescaleno(a: number,b:number,c:number){
        if(this.ehtriangulo(a,b,c) == false){
            return false
        }
        else if(a != b && a!=c && b!=c ){
            return false
        }
    }
}
let triangulo2 : Triangulo[] = []
let t1 : Triangulo = new Triangulo(1,2,3)
triangulo2[0] = t1
console.log(t1.ehtriangulo())

/* Questão 3 */
class Conta {
	numero: String;
	saldo: number;

	constructor(numero: String, saldoInicial: number) {
		this.numero = numero;
		this.saldo = saldoInicial;
	}

	sacar(valor: number): void {
		this.saldo = this.saldo - valor;
	}

	depositar(valor: number): void {
		this.saldo = this.saldo + valor;
	}

	transferir(contaDestino: Conta, valor: number): void {
		this.sacar(valor);
		contaDestino.depositar(valor);
	}

}



let contas2: Conta[] = [];
let c1: Conta = new Conta("1",100);
contas2[0] = c1;
console.log(contas2[0].saldo);
//console.log(contas[1].saldo); undefined

contas2[1] = new Conta("2", 200);
console.log(contas2[1].saldo);
contas2.push(new Conta("3", 300));
console.log(contas2[2].saldo);


class Banco {
	contas: Conta[] = [];
	
	inserir(conta: Conta): void {
		if(!this.consultar(conta.numero)){
		  this.contas.push(conta);
		  console.log("Inserido com sucesso");
		}else{
		  console.log("conta já existente")
		}
		}
	
	consultar(numero: String): Conta {
		let contaConsultada: Conta;
		for (let conta of this.contas) {
			if (conta.numero == numero) {
				contaConsultada = conta;
				break;
			}
		}
		return contaConsultada;
	}

	consultarPorIndice(numero: String): number {
		let indice: number = -1;
		for (let i: number = 0; i < this.contas.length; i++) {
			if (this.contas[i].numero == numero) {
				indice = i;
				break;
			}
		}
		return indice;
	}

	alterar(conta: Conta): void {
		let indice: number = this.consultarPorIndice(conta.numero);
		if (indice != -1) {
			this.contas[indice] = conta;
		}
	}

	excluir(numero: string): void {
		let indice: number = this.consultarPorIndice(numero);
		
		if (indice != -1) {
			for (let i: number = indice; i < this.contas.length; i++) {
				this.contas[i] = this.contas[i+1];
			}

			this.contas.pop();
		} 
	}

	depositar(numero: String, valor: number): void {
		let contaConsultada = this.consultar(numero);

		if (contaConsultada != null) {
			contaConsultada.depositar(valor);
		}
	}
	transferencia(x : string , x2 : string , valor: number): void{
		let conta_saida = this.consultar(x); // Saída o dinheiro
		let conta_entrada = this.consultar(x2); // Entra dinheiro
		if(conta_saida != null && conta_entrada != null){
			conta_saida.transferir(conta_entrada,valor);
		}
	}
	sacar(numero : String, valor: number){
		let contaConsultada = this.consultar(numero);

		if(contaConsultada != null){
			contaConsultada.sacar(valor);
		}
	}
	totaldecontas(): number{
		let valor : number = 0
		for(let conta of this.contas){valor++
		return valor}
	}
	totaldinheiro() : number{
		let valor : number = 0
		for(let conta of this.contas){valor += conta.saldo
		return valor}
	}
	media() : number{
		return this.totaldinheiro() / this.totaldecontas()
	}
}


let banco: Banco = new Banco();
banco.inserir(c1);
banco.inserir(new Conta("2",200));
banco.inserir(new Conta("3",300));

console.log(banco.consultar("2").saldo);
console.log(banco.consultar("1").saldo);

banco.alterar(new Conta("3", 3300));
console.log(banco.consultar("3").saldo);
banco.excluir("1");

banco.depositar("3", 50);
console.log(banco.consultar("3").saldo);
/* Questão 4 */
class Postagem {
	construtor(public id : number,public texto : string,public likes : number){}
	curtir() : void {
	this.likes++
}
toString() : string{
	return `id: ${this.id} texto : ${this.texto} Likes: ${this.likes}`
}
}

class Microbloc{
 constructor(
	public postagens : Postagem[] = []
){}
postar(postagem : Postagem) : void{
	this.postagens.push(postagem);
}
excluir(id : number) : void{
	let indice : number = this.indice(id);
	if(indice != -1){
		for(let i : number = indice; i < this.postagens.length); i++){
			this.postagens[i] = this.postagens[i+1]
		}
		this.postagens.pop()
	}
}
indice(id : number ) : number{
	for(let i : number = 0; i < this.postagens.length;i++){
		if(this.postagens[i].id == id){
		return i
	}
}
return -1
}

maislike() : Postagem{
	let mais_like : Postagem = this.postagens[0];
	for(let i : number = 0 ; i < this.postagens.length, i++){
		if(this.postagens[i].likes > mais_like.likes){
			mais_like = this.postagens[i]
		}
	}
	return mais_like
}
curitr(id : number) : void{
	let indice : number = this.indice(id);
	if(indice != -1){
		this.postagens[indice].curtir();
	}
}
toString() : string{
	let texto : string = "";
	for(let i : number = 0; i < this.postagens.length;i++){
		texto += this.postagens[i].toString() + "\n";
	}
	return texto
}
}
