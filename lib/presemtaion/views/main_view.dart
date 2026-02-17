import 'package:flutter/material.dart';
import 'package:notaadepi/presemtaion/views/widgets/all_notes_secs.dart';
import 'package:notaadepi/presemtaion/views/widgets/completed_notes_sec.dart';
import 'package:notaadepi/presemtaion/views/widgets/not_completed_notes_sec.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentInd = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentInd,
        onTap: (value) {
          currentInd = value;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.checklist), label: 'All'),
          BottomNavigationBarItem(icon: Icon(Icons.alarm), label: 'Pending'),
          BottomNavigationBarItem(
            icon: Icon(Icons.done_all),
            label: 'Completed',
          ),
        ],
      ),
      body: IndexedStack(
        index: currentInd,
        children: [AllNotesSecs(), NotCompletedNotesSec(), CompletedNotesSec()],
      ),
    );
  }
}
