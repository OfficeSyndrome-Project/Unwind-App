import 'package:get_it/get_it.dart';
import 'package:unwind_app/database/db_helper.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  //database helper
  serviceLocator.registerSingleton<DatabaseHelper>(DatabaseHelper());
}