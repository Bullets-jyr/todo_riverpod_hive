import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:todo_riverpod_hive/pages/widgets/filter_todo.dart';
import 'package:todo_riverpod_hive/pages/widgets/search_todo.dart';

import 'widgets/new_todo.dart';
import 'widgets/show_todos.dart';
import 'widgets/todo_header.dart';

class TodosPage extends StatelessWidget {
  const TodosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: LoaderOverlay(
          useDefaultLoading: false,
          overlayWidget: const Center(
            child: SpinKitFadingCircle(
              color: Colors.grey,
            ),
          ),
          overlayColor: Colors.grey.withOpacity(0.4),
          child: const Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                TodoHeader(),
                NewTodo(),
                SizedBox(height: 20),
                SearchTodo(),
                SizedBox(height: 10),
                FilterTodo(),
                SizedBox(height: 10),
                Expanded(child: ShowTodos()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
