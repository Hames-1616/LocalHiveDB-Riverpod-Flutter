import 'package:flutter_hive/model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

final boxstaticProvider = Provider((ref) => Hive.box("personBox"));
final hiverepoProvider = Provider((ref) => localhive(cref: ref));

class localhive {
  final Ref ref;
  localhive({required Ref cref}) : ref = cref;

  void addPerson(Person p) {
    ref.watch(boxstaticProvider).add(p);
  }

  void deleteAll() {
    ref.watch(boxstaticProvider).clear();
  }
}
