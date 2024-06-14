import 'package:ebook/Config/Colors.dart';
import 'package:ebook/Pages/BookPage/BookPage.dart';
import 'package:ebook/Pages/TextToSpeechPage/TextToSpeech.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class BookActionBtn extends StatelessWidget {
  final String bookUrl;
  final String title;
  const BookActionBtn({super.key, required this.bookUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    return   Container(
          height: 60,
          padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
          decoration: BoxDecoration(color: primaryColor,borderRadius: BorderRadius.circular(15)),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Get.to(BookPage(bookUrl: bookUrl,title:title));
                },
                child: Row(
                children: [SvgPicture.asset("Assets/Icons/book.svg"),
                const SizedBox(width: 10,),
                Text("READ BOOK",style: Theme.of(context).textTheme.bodyLarge?.copyWith(color:Theme.of(context).colorScheme.background,letterSpacing: 1.2),),],
                
                            ),
              ),
            Container(width: 2,height: 30,decoration:BoxDecoration(color: Theme.of(context).colorScheme.background,borderRadius:BorderRadius.circular(10) ),)
            ,
            
            InkWell(
              onTap: (){
               Get.to(TextToSpeech(bookUrl: bookUrl, title: title));
              },
              child: Row(
                children: [SvgPicture.asset("Assets/Icons/play.svg"),
                const SizedBox(width: 10,),
                Text("TexttoSpeech",style: Theme.of(context).textTheme.bodyLarge?.copyWith(color:Theme.of(context).colorScheme.background,letterSpacing: 1.2),),],
                
              ),
            ),
            ],
          ),
          );
  }
}
