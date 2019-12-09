import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:todoappwithprovider/models/task.dart';


class TodosModel extends ChangeNotifier{
  final List<Task> _tasks = [
    Task(title: 'Buy a Console'),
    Task(title: 'Write a medium blod post'),
    Task(title: 'connect more with God'),
  ];

  UnmodifiableListView<Task> get allTasks => UnmodifiableListView(_tasks);
  UnmodifiableListView<Task> get incompleteTasks => UnmodifiableListView(_tasks.where((todo) => !todo.completed));
  UnmodifiableListView<Task> get completedTasks => UnmodifiableListView(_tasks.where((todo)=> todo.completed));

  void addTodo(Task task){
    _tasks.add(task);
    notifyListeners();
  }

  void toggleTodo(Task task){
    final taskIndex = _tasks.indexOf(task);
    _tasks[taskIndex].toggleCompleted();
    notifyListeners();
  }

  void deleteTodo(Task task){
   _tasks.remove(task) ;
   notifyListeners();
  }
}