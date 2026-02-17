import 'package:flutter/material.dart';
import 'package:notaadepi/presemtaion/manager/task_item_provider.dart';
import 'package:notaadepi/presemtaion/views/widgets/custom_task_header.dart';
import 'package:notaadepi/presemtaion/views/widgets/task_item.dart';
import 'package:provider/provider.dart';

class CompletedNotesSec extends StatelessWidget {
  const CompletedNotesSec({super.key});

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
                title: 'Tasks',
                icon: Icons.done,
                iconBackgoundColor: Colors.blueAccent,
              ),
              SizedBox(height: 36),
              Expanded(
                child: Consumer<TaskItemProvider>(
                  builder: (context, state, child) {
                    final tasks = state.completedList;

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
