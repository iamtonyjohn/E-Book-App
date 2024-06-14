

import 'package:ebook/Config/Colors.dart';
import 'package:ebook/Models/BookModel.dart';
import 'package:ebook/Pages/BookDetails/BookActionBtn.dart';
import 'package:ebook/Pages/BookDetails/HeaderWidget.dart';
import 'package:flutter/material.dart';



class BookDetails extends StatelessWidget {
  final BookModel book;
  const BookDetails({super.key,required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(15),
               
                color: primaryColor,
                child:Row(           
                  children: [
                    Expanded(child: HeaderWidget(
                      coverUrl: book.coverUrl!,
                      title: book.title!,
                      author: book.author!,
                      description: book.description!,
                      bookUrl: book.bookurl.toString(),                     
                      pages: book.pages.toString(),
                      language: book.language.toString(),
                    ),
                    ),],
                  
                )
              ),
            ),
         const SizedBox(height: 20,),
            Padding(
        padding: const EdgeInsets.all(10),
        child:Column(crossAxisAlignment: CrossAxisAlignment.start  ,children: [Row(
          children: [
            Text("About Book", style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
         const SizedBox(height: 8,),
        Row(
          children: [
            Flexible(child: Text(book.description!,textAlign: TextAlign.justify,  style: Theme.of(context).textTheme.labelSmall)),
          ],
        ),
        const SizedBox(height: 12,),
        Row(
          children: [
            Text("About Author", style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
         const SizedBox(height: 8,),
        Row(
          children: [
            Flexible(child: Text(book.aboutAuthor!,textAlign: TextAlign.justify , style: Theme.of(context).textTheme.labelSmall)),
          ],
        ),
         const SizedBox(height: 15,),
          BookActionBtn(bookUrl:book.bookurl!,title: book.title!,),
        ],
        )
        ),
         
            
          ],
        ),
      ),
    );
  }
}