import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  Search({Key? key}) : super(key: key);
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: TextField(
          controller: controller,
        ),
      ),
    );
  }
}
