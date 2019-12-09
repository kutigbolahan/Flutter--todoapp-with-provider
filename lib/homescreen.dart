import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoappwithprovider/add_tasks_screen.dart';
import 'package:todoappwithprovider/providers/theme_provider.dart';
import 'package:todoappwithprovider/tabs/all_tasks.dart';
import 'package:todoappwithprovider/tabs/completed_tasks.dart';
import 'package:todoappwithprovider/tabs/incomplete_tasks.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController controller;
  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      
      appBar: AppBar(
        title: Text('Todo App'),
        actions: <Widget>[
          Switch(
            value: themeProvider.isLightTheme,
            onChanged: (val){
              setState(() {
                themeProvider.setThemeData= val;
              });
              //themeProvider.setThemeData = val;
            },
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => AddTaskScreen(),
              ));
            },
          )
        ],
        bottom: TabBar(
          controller: controller,
          tabs: <Widget>[
            Tab(text: 'All'),
            Tab(text: 'Incomplete'),
            Tab(text: 'Complete'),
          ],
        ),
        
      ),
      body: TabBarView(
        controller: controller,
        children: <Widget>[
          AllTasksTab(),
          IncompleteTasksTab(),
          CompletedTaskstab(),
         
        ],
         
        
      ),
      
    );
  }
}
