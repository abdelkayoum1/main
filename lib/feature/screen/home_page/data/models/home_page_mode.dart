class HomePageModel {
  final String id, image;

  HomePageModel({required this.id, required this.image});
}

List<HomePageModel> list = [
  HomePageModel(id: "1", image: 'assets/card_background.png'),
  HomePageModel(id: "2", image: 'assets/card_background.png'),
  HomePageModel(id: "3", image: 'assets/card_background.png'),
];
