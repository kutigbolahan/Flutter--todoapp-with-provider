import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoappwithprovider/providers/todos_model.dart';
import 'package:todoappwithprovider/widgets/task_list.dart';

class CompletedTaskstab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<TodosModel>(
        builder: (context, todos, child) => TaskList(
          tasks: todos.completedTasks,
        ),
      )
    );
  }
}