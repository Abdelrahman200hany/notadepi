import 'package:flutter/material.dart';
import 'package:notaadepi/presemtaion/manager/task_item_provider.dart';
import 'package:notaadepi/presemtaion/views/widgets/build_model_buttom_sheet.dart';
import 'package:notaadepi/presemtaion/views/widgets/custom_task_header.dart';
import 'package:notaadepi/presemtaion/views/widgets/task_item.dart';
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
                  final taskProvider = context.read<TaskItemProvider>();
                  showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(16),
                    ),
                    context: context,
                    builder: (context) =>
                        BuildModelBottomSheet(taskItemProvider: taskProvider),
                  );

                  //  DateTime? pickedDate = await showDatePicker(

                  //     context: context,
                  //     initialDate: DateTime.now().toUtc(),          // التاريخ اللي هيظهر أول ما تفتح
                  //     firstDate: DateTime(2000),            // الحد الأدنى
                  //     lastDate: DateTime(2100),             // الحد الأقصى
                  //     cancelText: "Cancel",                  // نص زر الإلغاء
                  //     confirmText: "Ok",                 // نص زر التأكيد
                  //     helpText: "اختر التاريخ المناسب",    // عنوان أعلى الـ Dialog
                  //     initialEntryMode: DatePickerEntryMode.calendar, // Calendar view أول ما يظهر
                  //   );
                  //    if (pickedDate != null) {
                  //     print("التاريخ المختار: $pickedDate");
                  //   }

                  //               // showDatePicker(context: context, firstDate: DateTime(200), lastDate: DateTime(300));
                },

                iconBackgoundColor: Colors.black,
              ),
              SizedBox(height: 32),
              Expanded(
                child: Consumer<TaskItemProvider>(
                  builder: (context, state, child) {
                    final tasks = state.allList;

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
