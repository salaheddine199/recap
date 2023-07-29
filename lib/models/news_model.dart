class NewsModel {
  // articles totalResults status
  final String status;
  final int totalResults;
  final List<Map<String, dynamic>> articles;

  NewsModel({
    this.status = "Error",
    this.totalResults = 0,
    this.articles = const [],
  });
}
