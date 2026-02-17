import 'package:flutter/material.dart';
import 'package:notaadepi/data/models/task_item_model.dart';
import 'package:notaadepi/presemtaion/manager/task_item_provider.dart';
import 'package:notaadepi/presemtaion/views/widgets/custom_text_feild.dart';

class BuildModelBottomSheet extends StatefulWidget {
  const BuildModelBottomSheet({super.key, required this.taskItemProvider});

  final TaskItemProvider taskItemProvider;

  @override
  State<BuildModelBottomSheet> createState() => _BuildModelBottomSheetState();
}

class _BuildModelBottomSheetState extends State<BuildModelBottomSheet> {
  String? title;
  DateTime? data;

  final TextEditingController titleController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 36),
          CustomTextFeild(
            hint: 'title',
            onChanged: (value) {
              title = value;
            },
            controller: titleController,
          ),

          SizedBox(height: 36),
          CustomTextFeild(
            icon: Icons.calendar_month_outlined,
            hint: 'data',
            controller: dateController,

            onPressed: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now().toUtc(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
                cancelText: "Cancel",
                confirmText: "Ok",
                helpText: "اختر التاريخ المناسب",
                initialEntryMode: DatePickerEntryMode.calendar,
              );
              if (pickedDate != null) {
                data = pickedDate;
                dateController.text = pickedDate.toString();
              }
            },
          ),
          SizedBox(height: 36),
          SizedBox(
            height: 48,
            width: double.infinity,
            child: TextButton(
              onPressed: () {
                widget.taskItemProvider.addNewTask(
                  TaskModelItem(
                    title: title ?? 'no tilte',
                    data: '${data ?? 'no date'}',
                  ),
                );
                dateController.clear();
                titleController.clear();
                Navigator.pop(context);
              },
              style: TextButton.styleFrom(
                backgroundColor: Color(0xff171717),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(12),
                ),
              ),
              child: Center(
                child: Text(
                  'Save',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 36),
        ],
      ),
    );
  }
}
