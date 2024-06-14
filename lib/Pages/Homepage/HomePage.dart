
import 'package:ebook/Components/BookCard.dart';
import 'package:ebook/Components/BookTitle.dart';
import 'package:ebook/Controller/BookController.dart';
import 'package:ebook/Models/Data.dart';
import 'package:ebook/Pages/BookDetails/BookDetails.dart';
import 'package:ebook/Pages/Homepage/Widgets/AppBar.dart';
import 'package:ebook/Pages/Homepage/Widgets/CategoryWidget.dart';
import 'package:ebook/Pages/Homepage/Widgets/MyInputeTextField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    BookController bookController=Get.put(BookController());
  bookController.getUserBook();
   
    return Padding(padding:const EdgeInsets.only(left: 5,right: 5),
     child:Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: 
        [
          Container(
            
            color: Theme.of(context).colorScheme.primary,
            height: 390,         
            child: Expanded(
              child: Row(
                
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [             
               Expanded(
                 child: Column(
                  children: [
                 const   SizedBox(height:50),
            const       HomeAppBar(),
               const     SizedBox(height:50),
                   Padding(padding: const  EdgeInsets.only(left: 5,right: 5),
               child:
                   Row(
                    children: [Text(
                      "Hi, Welcome To E-Book App",style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Theme.of(context).colorScheme.background),
                    )],
                   ),),
                     
                      
               const     SizedBox(height:10),
                   Padding(padding: const EdgeInsets.only(left: 5,right: 5),
             child:
                   Row(
                    children: [
                      Flexible(child:Text(
                      "Time to read book and enhance your knowledge",style: Theme.of(context).textTheme.labelMedium?.copyWith(color: Theme.of(context).colorScheme.background),
                    ),
                    ),
                   ],
                   ),),
              const     SizedBox(height:20),
               const     MyInputTextField(),
                const    SizedBox(height:10),
                   Padding(padding: EdgeInsets.only(left: 5,right: 5),
             child:
                   Row(
                    children: [Text("Topics",style:Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: Theme.of(context).colorScheme.background,
                    ),
                    ),
                    ],
                   ),),
                  const  SizedBox(height: 10),
                   Padding(
                  padding: const EdgeInsets.only(left: 5,right: 5), // Adjust the value as needed
                  child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
           children: categoryData.map((e) => CategoryWidget(iconPath: e["icon"]!, btnName: e["lebel"]!)).toList(),
                              ),
                        ),
                   ),
                  ],
                 ),
               ),
              ],
              ),
            ),
          ),
        const SizedBox(height: 10,),
             Padding
             (
        padding: const EdgeInsets.all(10),
        child: Column(children:
         [ Row (children: [Text("Trending",
         style: Theme.of(context).textTheme.labelMedium,),
         ],
         ),
             const SizedBox(height: 10,),  
         SingleChildScrollView(
          scrollDirection: Axis.horizontal,
           child: Row(
            children: bookController.bookData.map((e) => BookCard(
              title: e.title!,
              coverUrl: e.coverUrl!,
              ontap :(){
                Get.to(BookDetails(book: e,));
              },
            ),
            ).toList(),
           
           ),
         ),
        ],
        ),
        ),
        
        const SizedBox(height: 10,),
             Padding
             (
        padding: const EdgeInsets.all(10),
        child: Column(children:
         [ Row (children: [Text("Your Interests",
         style: Theme.of(context).textTheme.labelMedium,),
         ],
         ),
        ],
        ),
        ),    
        
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

     

      ),

      );
  }
}