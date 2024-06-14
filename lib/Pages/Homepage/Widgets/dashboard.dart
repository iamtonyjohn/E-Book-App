
import 'package:ebook/Components/BookTitle.dart';
import 'package:ebook/Controller/BookController.dart';
import 'package:ebook/Pages/BookDetails/BookDetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class dashboard extends StatelessWidget {
  const dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    BookController bookController=Get.put(BookController());
     return Scaffold(
   appBar: AppBar(
        leading: BackButton(color: Theme.of(context).colorScheme.background,),
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text("Dashboard",style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Theme.of(context).colorScheme.background),),
        centerTitle: true,
      ),
     
      body: SingleChildScrollView(
        child: Column(
          children: 
        [
        const SizedBox(height: 10,),
          Column(
           children: bookController.bookData.map((e) => BookTile(
              title: e.title!,
              author: e.author!,
              coverUrl: e.coverUrl!,
              ontap :(){
                Get.to(BookDetails(book: e,));
              },
            ),
            ).toList(),
              )

        ],
        ),
      ),

      );
  }
}