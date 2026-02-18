import 'package:flutter/material.dart';
import 'package:notaadepi/presentation/manager/task_item_provider.dart';
import 'package:notaadepi/presentation/views/main_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const NotaDepi());
}

class NotaDepi extends StatelessWidget {
  const NotaDepi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (context) =>TaskItemProvider() ,
        child:    MainView()
        
      ),
    );
  }
}
