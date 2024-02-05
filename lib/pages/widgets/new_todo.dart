import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_riverpod_hive/models/todo_model.dart';
import 'package:todo_riverpod_hive/pages/providers/todo_list/todo_list_provider.dart';

class NewTodo extends ConsumerStatefulWidget {
  const NewTodo({super.key});

  @override
  ConsumerState<NewTodo> createState() => _NewTodoState();
}

class _NewTodoState extends ConsumerState<NewTodo> {
  final newTodoController = TextEditingController();
  Widget prevWidget = const SizedBox.shrink();

  @override
  void dispose() {
    newTodoController.dispose();
    super.dispose();
  }

  bool enableOrNot(AsyncValue<List<Todo>> state) {
    return state.when(
      data: (_) {
        prevWidget = Container();
        return true;
      },
      error: (_, __) => prevWidget is SizedBox ? false : false,
      loading: () => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final todoListState = ref.watch(todoListProvider);

    return TextField(
      controller: newTodoController,
      decoration: const InputDecoration(labelText: 'What to do?'),
      enabled: enableOrNot(todoListState),
      onSubmitted: (String? desc) {
        if (desc != null && desc.trim().isNotEmpty) {
          ref.read(todoListProvider.notifier).addTodo(desc);
          newTodoController.clear();
        }
      },
    );
  }
}
