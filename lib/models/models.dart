class DataModel {
  final int id;
  final String title;
  final String description;
  final String imageName;
  DataModel(
    this.id,
    this.title,
    this.description,
    this.imageName,
  );
}

List<DataModel> dataList = [
  DataModel(1, "Agricultura Básica", "Prepare-se para uma jornada de aprendizado aprofundada sobre os fundamentos da agricultura.","assets/cards/card1.png"),
  DataModel(2, "Técnicas de Plantio", "Vamos explorar uma variedade de técnicas de plantio que abrangem desde métodos tradicionais até inovações de última geração.","assets/cards/card2.png"),
  DataModel(3, "Rotação de Culturas.", "Vamos adentrar no conceito e na prática da rotação de culturas.","assets/cards/card3.png"),
];
