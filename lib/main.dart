import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notaadepi/presentation/manager/cubit/task_cubit.dart';
import 'package:notaadepi/presentation/views/main_view.dart';

void main() {
  runApp(const NotaDepi());
}

class NotaDepi extends StatelessWidget {
  const NotaDepi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(create: (context) => TaskCubit(), child: MainView()),
    );
  }
}
