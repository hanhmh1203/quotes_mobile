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
    r'authorId': PropertySchema(
      id: 0,
      name: r'authorId',
      type: IsarType.long,
    ),
    r'content': PropertySchema(
      id: 1,
      name: r'content',
      type: IsarType.string,
    ),
    r'isFavorite': PropertySchema(
      id: 2,
      name: r'isFavorite',
      type: IsarType.bool,
    ),
    r'isMine': PropertySchema(
      id: 3,
      name: r'isMine',
      type: IsarType.bool,
    ),
    r'quoteTypeId': PropertySchema(
      id: 4,
      name: r'quoteTypeId',
      type: IsarType.long,
    )
  },
  estimateSize: _quoteModelEstimateSize,
  serialize: _quoteModelSerialize,
  deserialize: _quoteModelDeserialize,
  deserializeProp: _quoteModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
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
  writer.writeLong(offsets[0], object.authorId);
  writer.writeString(offsets[1], object.content);
  writer.writeBool(offsets[2], object.isFavorite);
  writer.writeBool(offsets[3], object.isMine);
  writer.writeLong(offsets[4], object.quoteTypeId);
}

QuoteModel _quoteModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = QuoteModel(
    authorId: reader.readLong(offsets[0]),
    content: reader.readString(offsets[1]),
    isFavorite: reader.readBoolOrNull(offsets[2]) ?? false,
    isMine: reader.readBoolOrNull(offsets[3]) ?? false,
    quoteTypeId: reader.readLong(offsets[4]),
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
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 3:
      return (reader.readBoolOrNull(offset) ?? false) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _quoteModelGetId(QuoteModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _quoteModelGetLinks(QuoteModel object) {
  return [];
}

void _quoteModelAttach(IsarCollection<dynamic> col, Id id, QuoteModel object) {
  object.id = id;
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
  QueryBuilder<QuoteModel, QuoteModel, QAfterFilterCondition> authorIdEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'authorId',
        value: value,
      ));
    });
  }

  QueryBuilder<QuoteModel, QuoteModel, QAfterFilterCondition>
      authorIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'authorId',
        value: value,
      ));
    });
  }

  QueryBuilder<QuoteModel, QuoteModel, QAfterFilterCondition> authorIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'authorId',
        value: value,
      ));
    });
  }

  QueryBuilder<QuoteModel, QuoteModel, QAfterFilterCondition> authorIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'authorId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

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

  QueryBuilder<QuoteModel, QuoteModel, QAfterFilterCondition>
      quoteTypeIdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quoteTypeId',
        value: value,
      ));
    });
  }

  QueryBuilder<QuoteModel, QuoteModel, QAfterFilterCondition>
      quoteTypeIdGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'quoteTypeId',
        value: value,
      ));
    });
  }

  QueryBuilder<QuoteModel, QuoteModel, QAfterFilterCondition>
      quoteTypeIdLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'quoteTypeId',
        value: value,
      ));
    });
  }

  QueryBuilder<QuoteModel, QuoteModel, QAfterFilterCondition>
      quoteTypeIdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'quoteTypeId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension QuoteModelQueryObject
    on QueryBuilder<QuoteModel, QuoteModel, QFilterCondition> {}

extension QuoteModelQueryLinks
    on QueryBuilder<QuoteModel, QuoteModel, QFilterCondition> {}

extension QuoteModelQuerySortBy
    on QueryBuilder<QuoteModel, QuoteModel, QSortBy> {
  QueryBuilder<QuoteModel, QuoteModel, QAfterSortBy> sortByAuthorId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'authorId', Sort.asc);
    });
  }

  QueryBuilder<QuoteModel, QuoteModel, QAfterSortBy> sortByAuthorIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'authorId', Sort.desc);
    });
  }

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

  QueryBuilder<QuoteModel, QuoteModel, QAfterSortBy> sortByQuoteTypeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quoteTypeId', Sort.asc);
    });
  }

  QueryBuilder<QuoteModel, QuoteModel, QAfterSortBy> sortByQuoteTypeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quoteTypeId', Sort.desc);
    });
  }
}

extension QuoteModelQuerySortThenBy
    on QueryBuilder<QuoteModel, QuoteModel, QSortThenBy> {
  QueryBuilder<QuoteModel, QuoteModel, QAfterSortBy> thenByAuthorId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'authorId', Sort.asc);
    });
  }

  QueryBuilder<QuoteModel, QuoteModel, QAfterSortBy> thenByAuthorIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'authorId', Sort.desc);
    });
  }

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

  QueryBuilder<QuoteModel, QuoteModel, QAfterSortBy> thenByQuoteTypeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quoteTypeId', Sort.asc);
    });
  }

  QueryBuilder<QuoteModel, QuoteModel, QAfterSortBy> thenByQuoteTypeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quoteTypeId', Sort.desc);
    });
  }
}

extension QuoteModelQueryWhereDistinct
    on QueryBuilder<QuoteModel, QuoteModel, QDistinct> {
  QueryBuilder<QuoteModel, QuoteModel, QDistinct> distinctByAuthorId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'authorId');
    });
  }

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

  QueryBuilder<QuoteModel, QuoteModel, QDistinct> distinctByQuoteTypeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quoteTypeId');
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

  QueryBuilder<QuoteModel, int, QQueryOperations> authorIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'authorId');
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

  QueryBuilder<QuoteModel, int, QQueryOperations> quoteTypeIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quoteTypeId');
    });
  }
}
