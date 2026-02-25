import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notaadepi/presentation/manager/cubit/task_cubit.dart';
import 'package:notaadepi/presentation/views/widgets/build_model_buttom_sheet.dart';
import 'package:notaadepi/presentation/views/widgets/custom_task_header.dart';
import 'package:notaadepi/presentation/views/widgets/custom_text_feild.dart';
import 'package:notaadepi/presentation/views/widgets/task_item.dart';
import 'package:provider/provider.dart';

class AllNotesSecs extends StatelessWidget {
  const AllNotesSecs({super.key});

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
                icon: Icons.add,
                onPressed: () {
                  final taskCubit = context.read<TaskCubit>();
                  showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(16),
                    ),
                    context: context,
                    builder: (context) =>
                        BuildModelBottomSheet(taskCubit: taskCubit),
                  );
                },

                iconBackgoundColor: Colors.black,
              ),

              SizedBox(height: 24),
              CustomTextFeild(
                hint: 'search',
                onChanged: (value) {
                  context.read<TaskCubit>().search(value);
                },
              ),
              SizedBox(height: 32),
              Expanded(
                child: BlocBuilder<TaskCubit, TaskState>(
                  builder: (context, state) {
                    final tasks = context.watch<TaskCubit>().displayedList;

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
