import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/data/model/note_model.dart';
import 'package:to_do_app/to_do_app.dart';
import 'package:to_do_app/utils/constances/box_constance.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(AppBoxsConstance.noteBox);
  runApp(const MyApp());
}

