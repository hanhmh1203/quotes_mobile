class QuoteJsonModel {
  final String author;
  final String content;
  final String topic;

  QuoteJsonModel({
    required this.author,
    required this.content,
    required this.topic,
  });

  factory QuoteJsonModel.fromJson(Map<String, dynamic> json) {
    return QuoteJsonModel(
      author: json['author'],
      content: json['content'],
      topic: json['topic'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'author': author,
      'content': content,
      'topic': topic,
    };
  }

}
class QuotesResponse {
  final List<QuoteJsonModel> data;

  QuotesResponse({required this.data});

  factory QuotesResponse.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    List<QuoteJsonModel> quotesList = list.map((i) => QuoteJsonModel.fromJson(i)).toList();

    return QuotesResponse(data: quotesList);
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.map((quote) => quote.toJson()).toList(),
    };
  }
}
