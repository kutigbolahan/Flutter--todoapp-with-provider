import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoappwithprovider/homescreen.dart';
import 'package:todoappwithprovider/providers/theme_provider.dart';
import 'package:todoappwithprovider/providers/todos_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final themeProvider = Provider.of<ThemeProvider>(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: TodosModel(),
        ),
        ChangeNotifierProvider.value(
          value: ThemeProvider(isLightTheme: true),
        )
      ],
      child: MaterialApp(
        title: 'Todo App',
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
