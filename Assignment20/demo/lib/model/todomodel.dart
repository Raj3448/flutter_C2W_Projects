class ToDoModel {
  String id;
  String title;
  String description;
  String datetime;
  String storedImage;
  ToDoModel({
    required this.id,
    required this.title,
    required this.description,
    required this.datetime,
    this.storedImage = 'assets/images/profile-pic (22).png',
  });
}
