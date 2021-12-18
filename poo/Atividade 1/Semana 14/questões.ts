// Q1 - Eu não consigo acessar diretamente colocando c1. mas ao colocar o nome do atributo é me dado o valor dele
class Calculadora {
	// Atributos
	private Operando01 : number;
	private Operando02 : number ;
	public a : number;
	public b: number;
	// Metodos
	// constructor
	constructor(a: number,b: number,Operando01 : number, Operando02: number){
		this.a = a
		this.b = b
		this.Operando01 = Operando01
		this.Operando02 = Operando02
	}
	public somar(a : number , b : number) : number {
		return this.a+this.b;
	}
	public subtrair(a: number,b: number) : number {
		if(a > b){
			return this.a-this.b;
		}
		else{
			return this.b-this.a;
		}
	}
}
let c1 : Calculadora = new Calculadora(1,2,3,4);
// console.log(c1.Operando01)
// console.log(c1.Operando02)
// console.log(c1.a)
// console.log(c1.b)
// console.log(c1.subtrair());
// Q2
class Hora {
// Atributos
private hora: number;
private minutos : number;
private segundos : number;
// Metodos
public lerhora(hora: number) : number {
	console.log(`Hora(s): ${this.hora}`)

}
public lerminutos(minutos : number): number{
	console.log(`Minuto(s): ${this.minutos}`)
}
public lersegundos(segundos : number) : number{
	console.log(`Segundo(s): ${this.segundos}`)
}
// Construtor
constructor(hora : number,minutos : number,segundos : number){
	this.hora = hora
	this.minutos = minutos
	this.segundos = segundos
}
public horaCompleta(hora:number,minutos: number,segundos: number) : void {
	console.log(`HoraCompleta: ${this.hora} : ${this.minutos} : ${this.segundos} `)
	
}
}
let h1 : Hora = new Hora(1,2,3)
h1.lerhora()
h1.horaCompleta()
h1.lerminutos()
h1.lersegundos()
// Q3
class Banco {
	private contas: Conta[] = [];
	public inserir(cota : Conta) : void {
		if(!this.consultar(conta.num_conta)){
			this.contas.push(conta);
			console.log("Inserção concluída")
		}
		else{
			console.log("Conta já possui um id existente")
		}
	}
	
	public consultar(numero: String): Conta {
		let contaConsultada: Conta;
		for (let conta of this.contas) {
			if (conta.numero == numero) {
				contaConsultada = conta;
				break;
			}
		}
		return contaConsultada;
	}

	private consultarPorIndice(numero: String): number {
		let indice: number = -1;
		for (let i: number = 0; i < this.contas.length; i++) {
			if (this.contas[i].numero == numero) {
				indice = i;
				break;
			}
		}
		return indice;
	}

	public alterar(conta: Conta): void {
		let indice: number = this.consultarPorIndice(conta.numero);
		if (indice != -1) {
			this.contas[indice] = conta;
		}
	}

	public excluir(numero: string): void {
		let indice: number = this.consultarPorIndice(numero);
		
		if (indice != -1) {
			for (let i: number = indice; i < this.contas.length; i++) {
				this.contas[i] = this.contas[i+1];
			}

			this.contas.pop();
		} 
	}

	public depositar(numero: String, valor: number): void {
		let contaConsultada = this.consultar(numero);

		if (contaConsultada != null) {
			contaConsultada.depositar(valor);
		}
	}

    public sacar(numero: String, valor: number): void {
        let contaConsultada = this.consultar(numero);

        if (contaConsultada != null) {
            contaConsultada.sacar(valor);
        }
    }

    public transferir(numeroCredito: string, numeroDebito: string, valor: number){
        let contaCredito: Conta = this.consultar(numeroCredito);
        let contaDebito: Conta = this.consultar(numeroDebito);

        if (contaCredito != null && contaDebito != null) {
            contaDebito.transferir(contaCredito, valor);
        }
    }

    public calcularQuantidadeContas(): number {
        return this.contas.length;
    }

    public calcularTotalSaldos(): number {
        let totalSaldo: number = 0;
        for (conta of this.contas) {
            totalSaldo += conta.saldo;
        }

        return totalSaldo;
    }

    public calcularMediaSaldos() {
        return this.calcularTotalSaldos()/this.calcularQuantidadeContas();
    }
}
// Q4 -
class Conta {
	public numero: String;
	public get saldo(): number{
		return this.saldo
	}
	public get num_conta(){
		return this.numero
	}

    constructor(numero: String, saldoInicial: number) {
		this.numero = numero;
		this.saldo = saldoInicial;
	}

	public sacar(valor: number): void {
		if (this.saldo >= valor) {
			this.saldo = this.saldo - valor;
		}
	}

	public depositar(valor: number): void {
		this.saldo = this.saldo + valor;
	}

	public transferir(contaDestino: Conta, valor: number): void {
		this.sacar(valor);
		contaDestino.depositar(valor);
	}
}
let a1: Conta = new Conta("1",100);
console.log(`numero da conta: ${a1.numero} saldo:${a1.saldo}`)
let banco: Banco = new Banco();
banco.inserir(a1);
console.log(banco.consultar("1").Saldo);