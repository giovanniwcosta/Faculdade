#include <vector>
#include <fstream>
#include <string>
#include <iostream>
#include <algorithm>

using Id = int;
using Coordenada = double;
using Valor = double;
using Densidade = double;
using File = std::ifstream;
using Peso = double;
using Local = std::string;
using Save = std::ofstream;

struct material{
	Id  id;
	Densidade ph;
	Valor preco;
};
struct peca{
	Id  id;
	Id materia;
	Coordenada x;
	Coordenada y;
	Coordenada z;
};
struct produto{
	Id pec;
	Id materia;
	Peso peso_total;
	Valor preco;
};

using Pecas = std::vector<peca>;
using Materiais = std::vector<material>;
using Produtos = std::vector<produto>;

Materiais load_material(Local nome);
Pecas load_peca(Local  nome);
material find_material(Id  id, Materiais materiais);
Produtos load_produto(Materiais mat, Pecas pecas);
Produtos load_all();

void sort_preco(Produtos &produtos);
void sort_peso(Produtos &produtos);
void sort_material(Produtos &produtos);
void save(Produtos produtos, Local nome);
void save_all_sorted(Produtos produtos);

int main(int, char*[]){
	
	save_all_sorted(load_all());
	
	return 0;
}


/*Lê os dados do arquivo e os insero em um vetor*/
Materiais load_material(Local nome){
	Materiais materiais; 
	File arquivo(nome);
	arquivo.exceptions(std::ios::badbit);
	material temp;
	while(arquivo >> temp.id ){
		arquivo >> temp.ph;
		arquivo >> temp.preco;
		materiais.push_back(temp);
	}
	return materiais;
}

/*Lê as peças do arquivo e os insere em um vetor*/
Pecas load_peca(Local nome){
	Pecas pecas;
	File arquivo(nome);
	arquivo.exceptions(std::ios::badbit);
	peca temp;
	while(arquivo >> temp.id ){
		arquivo >> temp.materia;
		arquivo >> temp.x;
		arquivo >> temp.y,
		arquivo >> temp.z;
		pecas.push_back(temp);
	}
	return pecas;
}

/*Cria um vetor de produtos com a partir dos vetores de peças e materiais*/
Produtos load_produto(Materiais mat, Pecas pecas){

	Produtos produtos;
	produto temp;

	for(auto pec : pecas){
		material mate = find_material(pec.materia,mat);
		temp.pec = pec.id;
		temp.materia = pec.materia;
		temp.peso_total = pec.x*pec.y*pec.z*mate.ph;
		temp.preco = temp.peso_total*mate.preco;
		produtos.push_back(temp);
	}

	return produtos;
}

/*Procura um materia em um vetor pelo Identificador*/
material find_material(Id id, Materiais materiais){

	material materia;

	for(auto mat : materiais)
		if(mat.id == id){
			materia = mat;
			break; 
		}

	return materia;
} 

/*Salva os dados de um vetor em um arquivo com  o nome específico*/
void save(Produtos produtos, Local nome){
	Save arquivo(nome);
	for(auto pro : produtos){
		arquivo << pro.pec <<" "<< pro.materia <<" "<< pro.peso_total <<" "<< pro.preco <<std::endl;
	}
}

/*Três forma de organizar os produtos*/
void sort_preco(Produtos &produtos){
	std::sort(begin(produtos), end(produtos), [] (produto const &x, produto const &y) { return x.preco < y.preco; });
}
void sort_peso(Produtos &produtos){
	std::sort(begin(produtos), end(produtos), [] (produto const &x, produto const &y) { return x.peso_total > y.peso_total; });
}
void sort_material(Produtos &produtos){
	std::sort(begin(produtos), end(produtos), [] (produto const &x, produto const &y) { return x.materia < y.materia; });
}

/*Carrega todo o estoque de uma única vez*/
Produtos load_all(){
	return load_produto(load_material("materiais.txt"), load_peca("pecas.txt"));
}

/*Salva todos os produtos organizados de uma única vez*/
void save_all_sorted(Produtos produtos){
	sort_preco(produtos);
	save(produtos,"por_preco.txt");
	sort_material(produtos);
	save(produtos,"por_material.txt");
	sort_peso(produtos);
	save(produtos,"por_peso.txt");
}