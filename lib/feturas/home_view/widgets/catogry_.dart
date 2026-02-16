// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:firebase/feturas/shared/custom_text.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Catogry extends StatefulWidget {
  Catogry({
    required this.catogry,
    required this.selectedindex,
    required Function(dynamic index) onCategorySelected,
    super.key,
  });

  late int selectedindex;
  final List catogry;

  @override
  State<Catogry> createState() => _CatogryState();
}

class _CatogryState extends State<Catogry> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(widget.catogry.length, (int index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                widget.selectedindex = index;
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              margin: const EdgeInsets.only(right: 0),
              decoration: BoxDecoration(
                color: widget.selectedindex == index
                    ? const Color.fromARGB(194, 255, 111, 0)
                    : const Color.fromARGB(255, 41, 40, 40),
                borderRadius: BorderRadius.circular(15),
              ),
              child: CustomText(
                text: widget.catogry[index],
                weight: FontWeight.w400,
                color: widget.selectedindex == index
                    ? Colors.white
                    : Colors.white,
                size: 12,
              ),
            ),
          );
        }),
      ),
    );
  }
}
