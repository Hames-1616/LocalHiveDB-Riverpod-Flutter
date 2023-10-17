import 'package:flutter_hive/PersonRepo.dart';
import 'package:flutter_hive/model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final localHiveControllerProvider =
    StateNotifierProvider<localHiveController, bool>(
        (ref) => localHiveController(chivedb: ref.watch(hiverepoProvider)));

class localHiveController extends StateNotifier<bool> {
  final localhive hivedb;

  localHiveController({required localhive chivedb})
      : hivedb = chivedb,
        super(false);

  void addPerson(Person p) {
    state = true;
    hivedb.addPerson(p);
    state = false;
  }

  void deleteall() {
    state = true;
    hivedb.deleteAll();
    state = false;
  }
}
