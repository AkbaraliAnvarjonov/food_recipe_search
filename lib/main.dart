import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipe/app/app.dart';
import 'package:food_recipe/app/bloc_observer.dart';
import 'package:food_recipe/get_it/get_it_meals.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  Bloc.observer = AppBlocObserver();
  runApp(const App());
}
