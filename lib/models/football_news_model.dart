class FootballNewsModel {
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final DateTime publishedAt;

  FootballNewsModel({
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
  });

  factory FootballNewsModel.fromJson(Map<String, dynamic> json) {
    return FootballNewsModel(
      title: json['title'],
      description: json['description'],
      url: json['url'],
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'],
    );
  }
}

List<FootballNewsModel> newsList = [
  FootballNewsModel(
    title:
        'Ruud van Nistelrooy could make instant return to English football after Man United exit',
    description: 'Description 1',
    url: 'https://www.google.com',
    urlToImage: 'assets/news/news1.jpeg',
    publishedAt: DateTime.parse('2022-01-01'),
  ),
  FootballNewsModel(
    title:
        'Liverpool ‘Already in Talks’ to Sign €60m Forward Ahead of January Window',
    description: 'Description 2',
    url: 'https://www.google.com',
    urlToImage: 'assets/news/news2.jpeg',
    publishedAt: DateTime.parse('2022-01-02'),
  ),
  FootballNewsModel(
    title:
        'emerges appearing to show Premier League referee David Coote \'snorting powder\'',
    description: 'Description 3',
    url: 'https://www.google.com',
    urlToImage: 'assets/news/news3.jpeg',
    publishedAt: DateTime.parse('2022-01-03'),
  ),
  FootballNewsModel(
    title:
        'Mohamed Salah makes vow over Liverpool future and admits Roberto Firmino inspiration',
    description: 'Description 4',
    url: 'https://www.google.com',
    urlToImage: 'assets/news/news4.jpeg',
    publishedAt: DateTime.parse('2022-01-04'),
  ),
];
