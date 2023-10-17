
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class loading extends StatelessWidget {
  const loading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}