// Q1 -
class Veiculo{
	constructor(private placa : string,private ano : number){}
	get Placas(): string{
		return this.placa;
	}
	get Anos() : number{
		return this.ano;
	}
}
class Carro extends Veiculo{
	constructor(placa : string,ano :number,private modelo : string){
		super(placa,ano);}
		get Modelo(): string{
			return this.modelo
		}

}
class CarEletric extends Carro{
	// Construtor
	constructor(placa : string,ano:number,modelo:string,private autonomiaBateria: number)
	{
		super(placa,ano,modelo)
	}
	get AutonomiaBateria() : number {
		return this.autonomiaBateria
	}
	
}
let Porshe:Carro = new Carro("PIK-1010",2021,"Porshe Panamera");
let BMW:CarEletric = new CarEletric("LVW-2021",2021,"I8",200);
// console.log(BMW.AutonomiaBateria) // 200
// console.log(Porshe.Placas) // PIK-1010
// Q2 -
class Calculadora {
	// Construtor
	constructor(private op1: number,private op2: number){}
	// Metodos
	somar() : void{
		console.log(`Soma igual à: ${this.op1+this.op2}`);
	}
	diminuir() : void{
		console.log(`Subtração é igual à : ${this.op1 - this.op2}`)
	}
	adicionar(): number{
		return this.op1 + this.op2
	}
}
let c1 : Calculadora = new Calculadora(1,2)
// c1.somar()
//c1.diminuir()
// console.log(c1.adicionar())
// Q3 - 
class Calculadora_Cientifica extends Calculadora {
constructor(op1 : number,op2: number) {
super(op1, op2);
}
elevaraoexpoente() : void{
	var resultado = Math.pow(this.op1,this.op2);
	console.log(`O primeiro elevado ao segundo é igual à: ${resultado}`)
}
}
let calculator_cience : Calculadora_Cientifica = new Calculadora_Cientifica(1,2);
calculator_cience.elevaraoexpoente();
// Q4 -
class Conta {
	public numero: String;
	private _saldo: number
	public get saldo(): number{
		return this._saldo
	}
	public get num_conta(){
		return this.numero
	}

    constructor(numero: String, saldoInicial: number) {
		this.numero = numero;
		this._saldo = saldoInicial;
	}

	public sacar(valor: number): void {
		if (this.saldo >= valor) {
			this._saldo = this._saldo - valor;
		}
	}

	public depositar(valor: number): void {
		this._saldo = this.saldo + valor;
	}

	public transferir(contaDestino: Conta, valor: number): void {
		this.sacar(valor);
		contaDestino.depositar(valor);
	}
} // Poupança da Q4
class Poupanca extends Conta{
	constructor(numero : string,saldo:number,private taxajuros: number){
		super(numero,saldo);
	}
	public renderJuros(): void{
		this.depositar(this.saldo * this.taxajuros/100)
	}
	get _taxajuros() : number{
		return this.taxajuros;
	}
}
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
	public renderJuros(numero: string){
		let contaConsultada = this.consultar(numero); // a da q4
		if(contaConsultada instanceof Poupanca){ // b da q4
			let Poupanca : Poupanca = <Poupanca> contaConsultada;
			Poupanca.renderJuros(); // c da q4
		}
	}
}
let banco : Banco = new Banco();
banco.inserir(new conta("1",200))
banco.inser(new Poupanca("2",500,0,2));
banco.renderJuros("3");
console.log(banco.consultar("2").saldo);
class Produto{
	constructor(private id : number,quantidade: number,descricao : string,valor :number){}
	get Id() : number{
		return this.id;
	}
	get Quantidade(): number{
		return this.quantidade
	}
	// quantidade a = Repor(adicionar), quantidade b = dar baixa(diminuir)
	repor(quantidadeA:number) : number{
		return this.quantidade = this.Quantidade + quantidadeA
	}
	DarBaixa(quantidadeb: number): number{
		return this.quantidade = this.Quantidade - quantidadeb
	}
}
class ProdutoPerecivel extends Produto {
	constructor(id : number,quantidade : number,descricao: number,valor:number,private data_validade : Date){
		super(id,quantidade,descricao,valor)
	}
	get DataValidade() :Date{
		return this.data_validade;
	}
	Valido(): number{
		return this.DataValidade < new Date()? 1:0
	}
}
class Estoque{
	private produto:ProdutoPerecivel[] = []
	get Produtos(){
		return this.produto
	}
	public inserir(Newproduto: ProdutoPerecivel){
	const Serial = Newproduto;
	const pos = this.obterPosicao(Serial)
	if(pos != -1){
		console.log("Serial Existente")
	}
	else{
		this.Produtos.push(NewProduto);
	}
}
private obterPosicao(id:number):number{
	let indice : number = -1;
	for(let i : number = 0;i<this.produto.length;i++){
		if(this.produto[i].Serial == id){
			indice = i;
			break;
		}
	}
	return indice
}
public consultar(id:number){
	const idproduto : number = this.obterPosicao(id);
	console.log(this.produto[idproduto])
}
public excluir(id: number): void{
	let indice : number = this.obterPosicao(id);
	if(indice != -1){
		for(let i : number = indice; i < this.produto.length;i++){
			this.produtos[i] = this.produto[i+1]
		}
		this.produto.pop();
	}
}
public ListaPereciveis(): void{
	for(let pd of this.produto){
		if(pd.Valido()== 1){
			console.log(pd)
		}
	}
}
public Repor(quantidadeA: number,id:number){
	let indice : number = this.obterPosicao(id);
	this.produto[indice].repor(quantidadeA)
}
public DarBaixa(quantidadeb:number,id:number){
	let indice : number = this.obterPosicao[id]
	this.produto[indice].DarBaixa(quantidadeb)
}
}
let Ventilador : Produto = new Produto(2,100,"Max eletronica",500)
ventilador.DarBaixa(50)
cosole.log(ventilador)
let arroz: ProdutoPerecivel = new ProdutoPerecivel(1,100,"Arroz Maria",3.50,new Data("2021/06/23"))
let estoque = new Estoque()
estoque.inserir(arroz)
estoque.excluir(1)
console.log(estoque)
estoque.consultar(1)
estoque.ListaPereciveis()