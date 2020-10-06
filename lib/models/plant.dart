class Plant {
  String uid;
  String nomeComum;
  String nomeCientifico;
  String quantiaAgua;
  String quantiaSol;
  String temperatura;
  bool ativo;

  Map<String, dynamic> toJson() {
    return {
      'nomeComum': nomeComum,
      'nomeCientifico': nomeCientifico,
      'quantiaAgua': quantiaAgua,
      'quantiaSol': quantiaSol,
      'temperatura': temperatura,
      'ativo': ativo
    };
  }

  fromJson(Map<String, dynamic> map, uid) {
    nomeComum = map['nomeComum'];
    nomeCientifico = map['nomeCientifico'];
    quantiaAgua = map['quantiaAgua'];
    quantiaSol = map['quantiaSol'];
    temperatura = map['temperatura'];
    ativo = map['ativo'];
    this.uid = uid;

    return this;
  }
}
