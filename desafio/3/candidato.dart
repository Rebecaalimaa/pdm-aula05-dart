import 'dart:io';

class Candidato {
  int id;
  String nome;
  int votos;

  Candidato(this.id, this.nome, this.votos);

  @override
  String toString() {
    return '{id: $id, nome: $nome, votos: $votos}';
  }
}

void main() {
  List<Candidato> candidatos = [];
  int id = 1; 

  while (true) {
    print('1 - Adicionar candidato');
    print('2 - Excluir candidato');
    print('3 - Mostrar porcentagem de votos');
    print('4 - Sair');

    String? opcao = stdin.readLineSync();

    if (opcao == '1') {
      
      print('Digite o nome do candidato: ');
      String nome = stdin.readLineSync()!;
      
      print('Digite a quantidade de votos: ');
      int votos = int.parse(stdin.readLineSync()!);

      candidatos.add(Candidato(id++, nome, votos));
    } 
    else if (opcao == '2') {
    
      print('Digite o nome do candidato a excluir: ');
      String nomeExcluir = stdin.readLineSync()!;
      
      candidatos.removeWhere((candidato) => candidato.nome == nomeExcluir);
    } 
    else if (opcao == '3') {
  
      if (candidatos.isEmpty) {
        print('Nenhum candidato registrado.');
        continue;
      }

      int totalVotos = candidatos.fold(0, (sum, candidato) => sum + candidato.votos);
      print('Candidatos      Votos   Porcentagem');


      Candidato primeiroCandidato = candidatos.reduce((a, b) => a.votos > b.votos ? a : b);
      double porcentagemPrimeiroCandidato = (primeiroCandidato.votos / totalVotos) * 100;

  
      for (var candidato in candidatos) {
        double porcentagem = (candidato.votos / totalVotos) * 100;
        print('${candidato.nome.padRight(15)} ${candidato.votos.toString().padLeft(7)} ${porcentagem.toStringAsFixed(2).padLeft(10)}%');
      }

      if (porcentagemPrimeiroCandidato > 50) {
        print('O candidato ${primeiroCandidato.nome} foi eleito no primeiro turno!');
      } else {
        print('Haverá segundo turno.');
      }
    } 
    else if (opcao == '4') {
      // Sair
      print('Saindo...');
      break;
    } 
    else {
      print('Opção inválida, tente novamente.');
    }
  }}