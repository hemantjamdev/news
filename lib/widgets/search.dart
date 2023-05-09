import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  final Function(String search) onSearch;
  Search({Key? key,required this.onSearch}) : super(key: key);
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            hintText: "Search News",
            labelText: "Search News"),
        onChanged: onSearch,
      ),
    );
  }
}
