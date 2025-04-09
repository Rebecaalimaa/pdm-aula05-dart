import 'dart:io';

class Paciente {
  // Atributos
  String nome;
  int idade;
  String sexo;

  // Método construtor
  Paciente(this.nome, this.idade, this.sexo);

  // Método toString
  @override
  String toString() {
    return '{nome: $nome, idade: $idade, sexo: $sexo}';
  }
}

void main() {
  String nome = '';
  int idade = 0;
  String sexo = '';

  
  while (nome.isEmpty) {
    print('Digite o nome do paciente: ');
    nome = stdin.readLineSync() ?? '';  
  }

  while (idade <= 0) {
    print('Digite a idade do paciente: ');
    String? idadeString = stdin.readLineSync();
    if (idadeString != null) {
      idade = int.tryParse(idadeString) ?? 0;  
    }
  }

  while (sexo.isEmpty) {
    print('Digite o sexo do paciente (masculino/feminino): ');
    sexo = stdin.readLineSync() ?? '';
  }

  if (sexo == 'masculino' && idade >= 14 && idade <= 50) {
    print('Você poderá tomar a vacina da dengue.');
  } else {
    print('Você não poderá tomar a vacina da dengue por causa da sua idade.');
  }

  if (sexo == 'feminino' && idade >= 20 && idade <= 40) {
    print('Você  poderá tomar a vacina da dengue.');
  } else {
    print('Você não poderá tomar a vacina da dengue por cauda da sua idade.');
  }
}
