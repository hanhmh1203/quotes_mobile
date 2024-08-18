import 'package:quotes_mobile/data/models/quote_model.dart';

class QuoteMineViewModel {
  final String quote;
  final String author;
  final String type;

  QuoteMineViewModel({
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

  factory QuoteMineViewModel.fromMap(Map<String, dynamic> map) {
    return QuoteMineViewModel(
      quote: map['quote'],
      author: map['author'],
      type: map['type'],
    );
  }

  factory QuoteMineViewModel.quoteModel(QuoteModel quote) {
    return QuoteMineViewModel(
      quote: quote.content,
      author: quote.author.value?.name ?? '',
      type: quote.quoteTypeModel.firstOrNull?.type ?? '',
    );
  }
}
