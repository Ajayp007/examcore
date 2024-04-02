import 'package:exam/screens/details/details_screen.dart';
import 'package:exam/screens/edit/edit_screen.dart';
import 'package:exam/screens/home/home_screen.dart';
import 'package:flutter/cupertino.dart';

Map<String, WidgetBuilder> screenRouts = {

  '/': (context) => const HomeScreen(),
  'edit':(context) => const EditScreen(),
  'details':(context) => const DetailsScreen(),
};