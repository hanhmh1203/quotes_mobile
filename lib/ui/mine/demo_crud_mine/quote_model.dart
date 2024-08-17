import 'package:quotes_mobile/data/models/quote_model.dart';

class QuoteMineModel {
  final String quote;
  final String author;
  final String type;

  QuoteMineModel({
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

  factory QuoteMineModel.fromMap(Map<String, dynamic> map) {
    return QuoteMineModel(
      quote: map['quote'],
      author: map['author'],
      type: map['type'],
    );
  }

  factory QuoteMineModel.quoteModel(QuoteModel quote) {
    return QuoteMineModel(
      quote: quote.content,
      author: quote.author.value?.name ?? '',
      type: quote.quoteTypeModel.firstOrNull?.type ?? '',
    );
  }
}
