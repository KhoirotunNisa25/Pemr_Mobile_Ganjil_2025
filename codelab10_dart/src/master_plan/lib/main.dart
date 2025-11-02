import 'package:flutter/material.dart';
import './provider/plan_provider.dart';
import './models/data_layer.dart';
import './views/plan_creator_screen.dart';

void main() => runApp(MasterPlanApp());

class MasterPlanApp extends StatelessWidget {
  const MasterPlanApp({super.key});

  @override
  Widget build(BuildContext context) {
    final initialPlans = <Plan>[
      Plan(name: 'My Plan', tasks: <Task>[])
    ];
    
    return PlanProvider(
      notifier: ValueNotifier<List<Plan>>(initialPlans),
      child: MaterialApp(
        title: 'State management app Nisa',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const PlanCreatorScreen(),
      ),
    );
  }
}
