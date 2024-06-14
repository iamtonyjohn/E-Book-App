import 'package:ebook/Components/BackButton.dart';
import 'package:ebook/Pages/DownloadPage/Downloadpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HeaderWidget extends StatelessWidget {
  final String title;
  final String coverUrl;
  final String author;
  final String bookUrl;
  final String description;
  final String pages;
  final String language;
  const HeaderWidget({super.key, required this.title, required this.coverUrl, required this.author, required this.description, required this.pages, required this.language, required this.bookUrl});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
                  const SizedBox(height: 50,),
                  const Row(
                    children: [
                    MyBackButton(),
                  ],
                  ),
                  const SizedBox(height: 40,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                        child: Image.network(coverUrl,width: 180,),)
                  ],),
                  const SizedBox(height: 30,),
                     Text(title,maxLines: 1,textAlign: TextAlign.center,style: Theme.of(context).textTheme.headlineMedium?.copyWith(color:Theme.of(context).colorScheme.background,),),
          
                     Text("Author:$author", style: Theme.of(context).textTheme.labelMedium?.copyWith(color:Theme.of(context).colorScheme.background,),),
                     const SizedBox(height: 10,),
                     Text(description,maxLines: 2
                     ,textAlign: TextAlign.center ,style: Theme.of(context).textTheme.labelSmall?.copyWith(color:Theme.of(context).colorScheme.background,),),
                    const SizedBox(height: 15,),
                    Row(                 
                      mainAxisAlignment:MainAxisAlignment.spaceBetween,
                      children: [                       
                      
                      Column(children: [                   
                        Text("Pages",style: Theme.of(context).textTheme.labelSmall?.copyWith(color:Theme.of(context).colorScheme.background,),),
                        const SizedBox(height: 3,),
                        Text(pages,style: Theme.of(context).textTheme.labelMedium?.copyWith(color:Theme.of(context).colorScheme.background,),),
                      ],),

                     Container(
                     width: 2,height: 30,
                     decoration:BoxDecoration(color: Theme.of(context).colorScheme.background,borderRadius:BorderRadius.circular(10) ),
                     )
                     ,
            InkWell(
              onTap: (){
               Get.to(Downloadpage(bookUrl: bookUrl,title:title));
              },
              child: Row(
                children: [
                const SizedBox(width: 10,),
                Text("DOWNLOAD",style: Theme.of(context).textTheme.bodyLarge?.copyWith(color:Theme.of(context).colorScheme.background,letterSpacing: 1.2),),],              
              ),
            ),
         
                     Container(
                     width: 2,height: 30,
                     decoration:BoxDecoration(color: Theme.of(context).colorScheme.background,borderRadius:BorderRadius.circular(10) ),
                     )
                     ,


                      Column(children: [                   
                        Text("Language",style: Theme.of(context).textTheme.labelSmall?.copyWith(color:Theme.of(context).colorScheme.background,),),
                        const SizedBox(height: 3,),
                        Text(language,style: Theme.of(context).textTheme.labelMedium?.copyWith(color:Theme.of(context).colorScheme.background,),),
                      ],)
                    ],),

                ],);
  }
}