import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ebook/Components/BookTitle.dart';
import 'package:ebook/Models/BookModel.dart';
import 'package:ebook/Pages/BookDetails/BookDetails.dart';
import 'package:get/get.dart'; // Import your service for fetching books

class Category extends StatefulWidget {
  final String btnName;
  
  const Category({Key? key, required this.btnName}) : super(key: key);

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  late Future<List<BookModel>> _booksFuture;

  @override
  void initState() {
    super.initState();
    _booksFuture = _fetchBooks();
  }

  Future<List<BookModel>> _fetchBooks() async {
    return searchBooks(widget.btnName); // Call your function to fetch books
  }

  Future<List<BookModel>> searchBooks(String query) async {
    List<BookModel> searchResults = [];

    var books = await FirebaseFirestore.instance
        .collection("Books")
        .where('category', isEqualTo: query)
        .get();
    for (var book in books.docs) {
      searchResults.add(BookModel.fromJson(book.data()));
    }
    return searchResults;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Theme.of(context).colorScheme.background,),
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(widget.btnName,style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Theme.of(context).colorScheme.background),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder<List<BookModel>>(
            future: _booksFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                return Column(
                  children: (snapshot.data ?? []).map((book) => BookTile(
                    title: book.title!,
                    author: book.author!,
                    coverUrl: book.coverUrl!,
                    ontap: () {
                      Get.to(BookDetails(book: book));
                    },
                  )).toList(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}





