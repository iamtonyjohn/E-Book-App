
import 'package:ebook/Controller/AuthController.dart';
import 'package:ebook/Pages/Homepage/Widgets/dashboard.dart';
import 'package:ebook/Pages/ProfilePage/ProfilePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

@override
Widget build(BuildContext context) {
  AuthController authController=Get.put(AuthController());

  return Padding(
    padding: EdgeInsets.only(left: 5,right: 5 ,top:5), // Adjust the value as needed
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children:[ 
        InkWell(onTap: () {
          Get.to(dashboard());
        },  child: SvgPicture.asset("Assets/Icons/dashboard.svg")),
        Text("E-BOOK",style: Theme.of(context).textTheme.headlineMedium
          ?.copyWith(color: Theme.of(context).colorScheme.background),),
        InkWell(
          onTap: (){
            Get.to(ProfilePage());
          },
          child: ClipRRect(
            child: CircleAvatar(
              child: Image.network("${authController.auth.currentUser!.photoURL }"),
              ),
              borderRadius: BorderRadius.circular(100),
          ),

          ),],
    ),);
  
  
}
}