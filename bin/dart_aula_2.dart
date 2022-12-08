void main() {
  String nome = "Laranja";
  double peso = 122.45;
  String cor = "Verde e Laranja";
  String sabor = "Doce e citrico";
  int diasDesdeColheita = 50;
  bool isMadura = funcIsMadura(diasDesdeColheita);

  Frutas fruta1 = Frutas(nome, peso, cor, sabor, diasDesdeColheita);
  Frutas maca =
      Frutas("maça", 80, "vermelho amarelado", "levemente adocicada", 40);

  Legumes mandioca = Legumes('macaxeira', 1200, 'marrom', true);
  Citricas limao = Citricas('limão', 45, 'verde', 'azedo', 12, 8);
  Nozes castanha = Nozes(
      'Castanha do pará', 8, 'Branco amarronzado', 'levemente doce', 80, 50);

  castanha.mostraAlimento();
  limao.mostraAlimento();
  mandioca.mostraAlimento();
  maca.mostraAlimento();

  limao.existeRefri(true);
  limao.fazerSuco();
  mandioca.cozinhar();

  castanha.fazerMassa();
}

class Frutas extends Alimentos implements Bolo {
  String sabor;
  int diasDesdeColheita;
  bool? isMadura;

  Frutas(
      String nome, double peso, String cor, this.sabor, this.diasDesdeColheita)
      : super(cor: cor, nome: nome, peso: peso);

  estaMadura(int diasAmadurecer) {
    if (diasDesdeColheita >= diasAmadurecer) {
      isMadura = true;
      print(
          'Sua $nome foi colhida a $diasDesdeColheita dias, e precisa de $diasAmadurecer dias. sua fruta esta madura? $isMadura');
    } else {
      isMadura = false;
      print(
          'Sua $nome foi colhida a $diasDesdeColheita dias, e precisa de $diasAmadurecer dias. sua fruta esta madura? $isMadura. faltam ${diasAmadurecer - diasDesdeColheita} dias para que ela fique boa para consumo.');
    }
  }

  fazerSuco() {
    print('Voce fez um otimo suco de $nome');
  }

  @override
  void assar() {
    print('Colocando no forno...');
  }

  @override
  void fazerMassa() {
    print('Misturando a massa...');
  }

  @override
  void separarIngredientes() {
    print('selecionando as melhores $nome...');
  }
}

class Alimentos {
  String nome;
  double peso;
  String cor;

  Alimentos({required this.nome, required this.peso, required this.cor});

  mostraAlimento() {
    print('Este(a) $nome, tem peso de $peso, e sua cor é $cor');
  }
}

class Legumes extends Alimentos implements Bolo {
  bool isPrecisaCozinhar;
  Legumes(String nome, double peso, String cor, this.isPrecisaCozinhar)
      : super(cor: cor, nome: nome, peso: peso);

  cozinhar() {
    if (isPrecisaCozinhar) {
      print('Pronto, o $nome está cozinhando');
    } else {
      print('Não precisa cozinhar!');
    }
  }

  @override
  void assar() {
    // TODO: implement assar
  }

  @override
  void fazerMassa() {
    // TODO: implement fazerMassa
  }

  @override
  void separarIngredientes() {
    // TODO: implement separarIngredientes
  }
}

class Citricas extends Frutas {
  double nivelAzedo;

  Citricas(String nome, double peso, String cor, String sabor,
      int diasDesdeColheita, this.nivelAzedo)
      : super(nome, peso, cor, sabor, diasDesdeColheita);

  existeRefri(bool existe) {
    if (existe) {
      print('Existe refrigerande de $nome');
    } else {
      print('Não existe refrigerante de $nome');
    }
  }
}

class Nozes extends Frutas {
  double porcentagemOleoNatural;

  Nozes(String nome, double peso, String cor, String sabor,
      int diasDesdeColheita, this.porcentagemOleoNatural)
      : super(nome, peso, cor, sabor, diasDesdeColheita);

  @override
  void fazerMassa() {
    print('Amaasando nozes');
    super.fazerMassa();
  }
}

abstract class Bolo {
  void separarIngredientes();
  void fazerMassa();
  void assar();
}

diasParaMadura({required int dias, required String nome, required peso}) {
  int diasParaAmadurecer = 30;
  int faltaParaAmadurecer = diasParaAmadurecer - dias;
  if (faltaParaAmadurecer > 0) {
    print(
        'nome: $nome\n peso: $peso\n dias desde a coleta: $dias\n esta madura? ${funcIsMadura(dias)}\n falta para amadurecer: $faltaParaAmadurecer');
  } else {
    print('Esta madura. pode comer!!');
  }
}

bool funcIsMadura(int dias) {
  if (dias >= 30) {
    return true;
  } else {
    return false;
  }
}
