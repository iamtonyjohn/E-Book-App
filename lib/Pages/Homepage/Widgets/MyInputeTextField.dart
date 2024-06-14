
import 'package:ebook/Pages/Homepage/Widgets/SearchScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class MyInputTextField extends StatelessWidget {
  const MyInputTextField({Key? key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.background,
        ),
        child: GestureDetector(
          onTap: () {
            Get.to(SearchScreen()); 
          },
          child: Row(
            children: [
              const SizedBox(width: 20),
              InkWell(
                child: SvgPicture.asset("Assets/Icons/search.svg"),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: "Search here . .",
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

