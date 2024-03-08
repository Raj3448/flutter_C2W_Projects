// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExpenseDetailsModel _$ToDoModelFromJson(Map<String, dynamic> json) =>
    ExpenseDetailsModel(
      id: json['id'].toString(),
      title: json['title'] as String,
      description: json['description'] as String,
      datetime: json['datetime'] as String,
      amount: json['amount'] as String,
      storedImage: json['storedImage'] as String? ?? 'assets',
    );

Map<String, dynamic> _$ToDoModelToJson(ExpenseDetailsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'datetime': instance.datetime,
      'storedImage': instance.storedImage,
      'amount': instance.amount,
    };
