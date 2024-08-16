class QuoteModel {
  final String quote;
  final String author;
  final String type;

  QuoteModel({
    required this.quote,
    required this.author,
    required this.type,
  });

  Map<String, dynamic> toMap() {
    return {
      'quote': quote,
      'author': author,
      'type': type,
    };
  }

  factory QuoteModel.fromMap(Map<String, dynamic> map) {
    return QuoteModel(
      quote: map['quote'],
      author: map['author'],
      type: map['type'],
    );
  }
}
