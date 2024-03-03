class ToDoModel {
  String id;
  String title;
  String description;
  String datetime;
  String storedImage;
  String amount;
  ToDoModel({
    required this.id,
    required this.title,
    required this.description,
    required this.datetime,
    required this.amount,
    this.storedImage = 'assets/images/profile-pic (22).png',
  });
}
