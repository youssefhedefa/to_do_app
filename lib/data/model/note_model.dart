import 'package:hive/hive.dart';

part 'note_model.g.dart';

@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String date;
  @HiveField(2)
  String note;
  @HiveField(3)
  final int id;

  NoteModel({required this.id,required this.title, required this.date, required this.note});
}