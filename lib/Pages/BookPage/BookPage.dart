// ignore: file_names, unused_import
import 'package:ebook/Components/BackButton.dart';
import 'package:ebook/Controller/PdfController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';


class BookPage extends StatelessWidget {
  final String bookUrl;
  final String title;
  const BookPage({super.key, required this.bookUrl, required this.title});
  
 @override
  Widget build(BuildContext context) {
    PdfController pdfController=Get.put(PdfController());
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Theme.of(context).colorScheme.background,),
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text("$title",style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Theme.of(context).colorScheme.background),),
        centerTitle: true,
      ),

      //bookmark
      floatingActionButton: FloatingActionButton(onPressed: () {
        pdfController.pdfViewerKey.currentState?.openBookmarkView();
      },
      child: Icon(Icons.bookmark,color: Theme.of(context).colorScheme.background,),),


      

      //pdfview
      body: SfPdfViewer.network(
        bookUrl,
        key: pdfController.pdfViewerKey,
      ),

    );
  }
}
