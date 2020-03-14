import 'package:aula140320/ui/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MaterialApp(
    title: "Meu App",
    debugShowCheckedModeBanner: false,
    home: new HomePage(),
  ));
}
