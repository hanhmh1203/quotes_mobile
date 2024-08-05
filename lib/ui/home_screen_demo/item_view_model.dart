import 'package:quotes_mobile/data/models/quote_model.dart';

class QuoteViewModel {
  String type = '';
  String content =
      '"\nWhere I am, I don\'t know, I\'ll never know, in the silence you don\'t know, you must go on, I can\'t go on, I\'ll go on."';
  bool isFav = false;
  String author = 'author';



  QuoteViewModel();

  factory QuoteViewModel.fromQuoteModel(QuoteModel quote) {
    QuoteViewModel quoteViewModel = QuoteViewModel();
    quoteViewModel.type =
        '${quote.tempQuoteTypes.map((type) => type.type).join(', ')}';
    quoteViewModel.content = quote.content;
    quoteViewModel.isFav = quote.isFavorite;
    quoteViewModel.author= quote.author.value?.name??"author";
    return quoteViewModel;
  }
}
