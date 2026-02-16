import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextfieldData extends StatelessWidget {
  final GestureTapCallback add;
  const TextfieldData({super.key, required this.add});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "  Search...",
                  hintStyle: const TextStyle(color: Colors.white),
                  fillColor: const Color.fromARGB(255, 41, 40, 40),
                  filled: true,
                  suffixIcon: Icon(CupertinoIcons.search, color: Colors.white),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 15),
                ),
              ),
            ),
          ),
          const SizedBox(width: 25),

          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 41, 40, 40),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.grey),
            ),
            child: GestureDetector(
              onTap: add,
              child: Icon(Icons.add, color: Colors.white, size: 25),
            ),
          ),
        ],
      ),
    );
  }
}
