import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebook/Components/BookTitle.dart';
import 'package:ebook/Controller/BookController.dart';
import 'package:ebook/Models/BookModel.dart';
import 'package:ebook/Pages/BookDetails/BookDetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();
  late RxList<BookModel> searchResults = RxList<BookModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text('Search Results'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                controller: searchController,
                decoration: const InputDecoration(
                  labelText: 'Search for a Book...',
                ),
                onChanged: (query) => _searchBooks(query),
              ),
              const SizedBox(height: 20),
              Obx(
                () => searchResults.isEmpty
                    ? _buildBookList()
                    : _buildSearchResults(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBookList() {
    final BookController bookController = Get.put(BookController());
    return Column(
      children: bookController.bookData
          .map(
            (e) => BookTile(
              title: e.title!,
              author: e.author!,
              coverUrl: e.coverUrl!,
              ontap: () {
                Get.to(BookDetails(book: e));
              },
            ),
          )
          .toList(),
    );
  }

  Widget _buildSearchResults() {
    
      return Column(
      children: searchResults
          .map(
            (e) => BookTile(
              title: e.title!,
              author: e.author!,
              coverUrl: e.coverUrl!,
              ontap: () {
                Get.to(BookDetails(book: e));
              },
            ),
          )
          .toList(),
    );
   
  }

  void _searchBooks(String query) async {
    if (query.isNotEmpty) {
      List<BookModel> results = await searchBooks(query);
      setState(() {
        searchResults.assignAll(results);
      });
    } else {
      setState(() {
        searchResults.clear();
      });
    }
  }

  Future<List<BookModel>> searchBooks(String query) async {
    List<BookModel> searchResults = [];

    var books = await FirebaseFirestore.instance
        .collection("Books")
        .where('title', isEqualTo: query)
        .get();
    for (var book in books.docs) {
      searchResults.add(BookModel.fromJson(book.data()));
    }
    return searchResults;
  }
}

