import 'package:flutter/material.dart';
import 'package:notaadepi/presentation/manager/task_item_provider.dart';
import 'package:notaadepi/presentation/views/widgets/custom_task_header.dart';
import 'package:notaadepi/presentation/views/widgets/task_item.dart';
import 'package:provider/provider.dart';

class NotCompletedNotesSec extends StatelessWidget {
  const NotCompletedNotesSec({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(height: 24),
              CustomTaskHeader(
                title: 'Pending',
                icon: Icons.alarm,

                iconBackgoundColor: Colors.deepOrangeAccent,
              ),
              SizedBox(height: 36),
              Expanded(
                child: Consumer<TaskItemProvider>(
                  builder: (context, state, child) {
                    final tasks = state.notCompletedList;

                    return ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.only(bottom: 12),
                        child: TaskItem(item: tasks[index]),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
