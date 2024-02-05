import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_riverpod_hive/pages/providers/todo_filter/todo_filter_provider.dart';

import '../../models/todo_model.dart';

class FilterTodo extends StatelessWidget {
  const FilterTodo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FilterButton(filter: Filter.all),
        FilterButton(filter: Filter.active),
        FilterButton(filter: Filter.completed),
      ],
    );
  }
}

class FilterButton extends ConsumerWidget {
  final Filter filter;

  const FilterButton({
    super.key,
    required this.filter,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentFilter = ref.watch(todoFilterProvider);

    return TextButton(
      onPressed: () {
        ref.read(todoFilterProvider.notifier).changeFilter(filter);
      },
      child: Text(
        filter == Filter.all
            ? 'All'
            : filter == Filter.active
                ? 'Active'
                : 'Completed',
        style: TextStyle(
          fontSize: 18.0,
          color: currentFilter == filter ? Colors.blue : Colors.grey,
        ),
      ),
    );
  }
}
