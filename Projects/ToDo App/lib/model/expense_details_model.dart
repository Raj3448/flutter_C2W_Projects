import 'package:json_annotation/json_annotation.dart';
part 'expense_details_model.g.dart';

@JsonSerializable()
class ExpenseDetailsModel {
  @JsonKey(name: "id")
  String id;
  @JsonKey(name: "title")
  String title;
  @JsonKey(name: "description")
  String description;
  @JsonKey(name: "datetime")
  String datetime;
  @JsonKey(name: "storedImage")
  String storedImage;
  @JsonKey(name: "amount")
  String amount;

  ExpenseDetailsModel({
    required this.id,
    required this.title,
    required this.description,
    required this.datetime,
    required this.amount,
    this.storedImage = 'assets',
  });

  @override
  String toString() {
    return '{$id, $title , $description ,$datetime ,$amount}';
  }

  factory ExpenseDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$ExpenseDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExpenseDetailsModelToJson(this);
}
