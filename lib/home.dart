import 'package:flutter/material.dart';
import 'package:flutter_hive/PersonController.dart';
import 'package:flutter_hive/PersonRepo.dart';
import 'package:flutter_hive/loadingScreen.dart';
import 'package:flutter_hive/model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  @override
  Widget build(BuildContext context) {
    final load = ref.watch(localHiveControllerProvider);
    final s = ref.watch(localHiveControllerProvider.notifier);
    return Scaffold(
        body: load?const loading():Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                s.addPerson(Person(name: "Haamid", rollno: 123));
              },
              child: const Text("add")),
          ElevatedButton(
              onPressed: () {
                s.deleteall();
              },
              child: const Text("delete all")),
          Container(
              height: 200,
              width: 200,
              alignment: Alignment.center,
              child: ValueListenableBuilder(
                  valueListenable: ref.watch(boxstaticProvider).listenable(),
                  builder: (context, box, child) {
                    return ListView.builder(
                        itemCount: ref.watch(boxstaticProvider).length,
                        itemBuilder: (context, index) {
                          final person =
                              ref.watch(boxstaticProvider).getAt(index) as Person;
                          return Text(person.name);
                        });
                  })),
        ],
      ),
    ));
  }
}
