// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quote_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetQuoteModelCollection on Isar {
  IsarCollection<QuoteModel> get quoteModels => this.collection();
}

const QuoteModelSchema = CollectionSchema(
  name: r'QuoteModel',
  id: 7683860720290120396,
  properties: {
    r'content': PropertySchema(
      id: 0,
      name: r'content',
      type: IsarType.string,
    ),
    r'isFavorite': PropertySchema(
      id: 1,
      name: r'isFavorite',
      type: IsarType.bool,
    ),
    r'isMine': PropertySchema(
      id: 2,
      name: r'isMine',
      type: IsarType.bool,
    )
  },
  estimateSize: _quoteModelEstimateSize,
  serialize: _quoteModelSerialize,
  deserialize: _quoteModelDeserialize,
  deserializeProp: _quoteModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'author': LinkSchema(
      id: 6131400814256040871,
      name: r'author',
      target: r'AuthorModel',
      single: true,
    ),
    r'quoteTypeModel': LinkSchema(
      id: 3139228818604851591,
      name: r'quoteTypeModel',
      target: r'QuoteTypeModel',
      single: false,
    )
  },
  embeddedSchemas: {},
  getId: _quoteModelGetId,
  getLinks: _quoteModelGetLinks,
  attach: _quoteModelAttach,
  version: '3.1.0',
);

int _quoteModelEstimateSize(
  QuoteModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.content.length * 3;
  return bytesCount;
}

void _quoteModelSerialize(
  QuoteModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.content);
  writer.writeBool(offsets[1], object.isFavorite);
  writer.writeBool(offsets[2], object.isMine);
}

QuoteModel _quoteModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = QuoteModel(
    content: reader.readString(offsets[0]),
    isFavorite: reader.readBoolOrNull(offsets[1]) ?? false,
    isMine: reader.readBoolOrNull(offsets[2]) ?? false,
  );
  object.id = id;
  return object;
}

P _quoteModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 2:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _quoteModelGetId(QuoteModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _quoteModelGetLinks(QuoteModel object) {
  return [object.author, object.quoteTypeModel];
}

void _quoteModelAttach(IsarCollection<dynamic> col, Id id, QuoteModel object) {
  object.id = id;
  object.author.attach(col, col.isar.collection<AuthorModel>(), r'author', id);
  object.quoteTypeModel.attach(
      col, col.isar.collection<QuoteTypeModel>(), r'quoteTypeModel', id);
}

extension QuoteModelQueryWhereSort
    on QueryBuilder<QuoteModel, QuoteModel, QWhere> {
  QueryBuilder<QuoteModel, QuoteModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension QuoteModelQueryWhere
    on QueryBuilder<QuoteModel, QuoteModel, QWhereClause> {
  QueryBuilder<QuoteModel, QuoteModel, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<QuoteModel, QuoteModel, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<QuoteModel, QuoteModel, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<QuoteModel, QuoteModel, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<QuoteModel, QuoteModel, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension QuoteModelQueryFilter
    on QueryBuilder<QuoteModel, QuoteModel, QFilterCondition> {
  QueryBuilder<QuoteModel, QuoteModel, QAfterFilterCondition> contentEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteModel, QuoteModel, QAfterFilterCondition>
      contentGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteModel, QuoteModel, QAfterFilterCondition> contentLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteModel, QuoteModel, QAfterFilterCondition> contentBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'content',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteModel, QuoteModel, QAfterFilterCondition> contentStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteModel, QuoteModel, QAfterFilterCondition> contentEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteModel, QuoteModel, QAfterFilterCondition> contentContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'content',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteModel, QuoteModel, QAfterFilterCondition> contentMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'content',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<QuoteModel, QuoteModel, QAfterFilterCondition> contentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'content',
        value: '',
      ));
    });
  }

  QueryBuilder<QuoteModel, QuoteModel, QAfterFilterCondition>
      contentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'content',
        value: '',
      ));
    });
  }

  QueryBuilder<QuoteModel, QuoteModel, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<QuoteModel, QuoteModel, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<QuoteModel, QuoteModel, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<QuoteModel, QuoteModel, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<QuoteModel, QuoteModel, QAfterFilterCondition> isFavoriteEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isFavorite',
        value: value,
      ));
    });
  }

  QueryBuilder<QuoteModel, QuoteModel, QAfterFilterCondition> isMineEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isMine',
        value: value,
      ));
    });
  }
}

extension QuoteModelQueryObject
    on QueryBuilder<QuoteModel, QuoteModel, QFilterCondition> {}

extension QuoteModelQueryLinks
    on QueryBuilder<QuoteModel, QuoteModel, QFilterCondition> {
  QueryBuilder<QuoteModel, QuoteModel, QAfterFilterCondition> author(
      FilterQuery<AuthorModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'author');
    });
  }

  QueryBuilder<QuoteModel, QuoteModel, QAfterFilterCondition> authorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'author', 0, true, 0, true);
    });
  }

  QueryBuilder<QuoteModel, QuoteModel, QAfterFilterCondition> quoteTypeModel(
      FilterQuery<QuoteTypeModel> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'quoteTypeModel');
    });
  }

  QueryBuilder<QuoteModel, QuoteModel, QAfterFilterCondition>
      quoteTypeModelLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'quoteTypeModel', length, true, length, true);
    });
  }

  QueryBuilder<QuoteModel, QuoteModel, QAfterFilterCondition>
      quoteTypeModelIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'quoteTypeModel', 0, true, 0, true);
    });
  }

  QueryBuilder<QuoteModel, QuoteModel, QAfterFilterCondition>
      quoteTypeModelIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'quoteTypeModel', 0, false, 999999, true);
    });
  }

  QueryBuilder<QuoteModel, QuoteModel, QAfterFilterCondition>
      quoteTypeModelLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'quoteTypeModel', 0, true, length, include);
    });
  }

  QueryBuilder<QuoteModel, QuoteModel, QAfterFilterCondition>
      quoteTypeModelLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'quoteTypeModel', length, include, 999999, true);
    });
  }

  QueryBuilder<QuoteModel, QuoteModel, QAfterFilterCondition>
      quoteTypeModelLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'quoteTypeModel', lower, includeLower, upper, includeUpper);
    });
  }
}

extension QuoteModelQuerySortBy
    on QueryBuilder<QuoteModel, QuoteModel, QSortBy> {
  QueryBuilder<QuoteModel, QuoteModel, QAfterSortBy> sortByContent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'content', Sort.asc);
    });
  }

  QueryBuilder<QuoteModel, QuoteModel, QAfterSortBy> sortByContentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'content', Sort.desc);
    });
  }

  QueryBuilder<QuoteModel, QuoteModel, QAfterSortBy> sortByIsFavorite() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.asc);
    });
  }

  QueryBuilder<QuoteModel, QuoteModel, QAfterSortBy> sortByIsFavoriteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.desc);
    });
  }

  QueryBuilder<QuoteModel, QuoteModel, QAfterSortBy> sortByIsMine() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isMine', Sort.asc);
    });
  }

  QueryBuilder<QuoteModel, QuoteModel, QAfterSortBy> sortByIsMineDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isMine', Sort.desc);
    });
  }
}

extension QuoteModelQuerySortThenBy
    on QueryBuilder<QuoteModel, QuoteModel, QSortThenBy> {
  QueryBuilder<QuoteModel, QuoteModel, QAfterSortBy> thenByContent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'content', Sort.asc);
    });
  }

  QueryBuilder<QuoteModel, QuoteModel, QAfterSortBy> thenByContentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'content', Sort.desc);
    });
  }

  QueryBuilder<QuoteModel, QuoteModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<QuoteModel, QuoteModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<QuoteModel, QuoteModel, QAfterSortBy> thenByIsFavorite() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.asc);
    });
  }

  QueryBuilder<QuoteModel, QuoteModel, QAfterSortBy> thenByIsFavoriteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFavorite', Sort.desc);
    });
  }

  QueryBuilder<QuoteModel, QuoteModel, QAfterSortBy> thenByIsMine() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isMine', Sort.asc);
    });
  }

  QueryBuilder<QuoteModel, QuoteModel, QAfterSortBy> thenByIsMineDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isMine', Sort.desc);
    });
  }
}

extension QuoteModelQueryWhereDistinct
    on QueryBuilder<QuoteModel, QuoteModel, QDistinct> {
  QueryBuilder<QuoteModel, QuoteModel, QDistinct> distinctByContent(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'content', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<QuoteModel, QuoteModel, QDistinct> distinctByIsFavorite() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isFavorite');
    });
  }

  QueryBuilder<QuoteModel, QuoteModel, QDistinct> distinctByIsMine() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isMine');
    });
  }
}

extension QuoteModelQueryProperty
    on QueryBuilder<QuoteModel, QuoteModel, QQueryProperty> {
  QueryBuilder<QuoteModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<QuoteModel, String, QQueryOperations> contentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'content');
    });
  }

  QueryBuilder<QuoteModel, bool, QQueryOperations> isFavoriteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isFavorite');
    });
  }

  QueryBuilder<QuoteModel, bool, QQueryOperations> isMineProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isMine');
    });
  }
}
