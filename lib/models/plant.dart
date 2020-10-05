class Plant {
  String nomeComum;
  String nomeCientifico;
  String quantiaAgua;
  String quantiaSol;
  String temperatura;

  Map<String, dynamic> toJson() {
    return {
      'nomeComum': nomeComum,
      'nomeCientifico': nomeCientifico,
      'quantiaAgua': quantiaAgua,
      'quantiaSol': quantiaSol,
      'temperatura': temperatura
    };
  }

  fromJson(Map<String, dynamic> map) {
    nomeComum = map['nomeComum'];
    nomeCientifico = map['nomeCientifico'];
    quantiaAgua = map['quantiaAgua'];
    quantiaSol = map['quantiaSol'];
    temperatura = map['temperatura'];
    return this;
  }
}
