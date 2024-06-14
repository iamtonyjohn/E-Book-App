
import 'package:ebook/Models/BookModel.dart';
var categoryData =[
{
  "icon":"Assets/Icons/heart.svg",
  "lebel":"Romance",
},
{
  "icon":"Assets/Icons/star.svg",
  "lebel":"Action",

},
{
  "icon":"Assets/Icons/world.svg",
  "lebel":"Documentary",
},
{
  "icon":"Assets/Icons/plane.svg",
  "lebel":"Travel",
},
];

var bookData = [
  BookModel(
      id: "1",
      title:
          "Boundraties",
      description: "The publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum",
      aboutAuthor: "hi my name is Tony John and i have written this book",
      author: "Tony John",
      coverUrl: "Assets/Images/boundraries.jpg",
      category: "Documentary",
      pages: 234,
      language: "ENG",
      bookurl:
          "https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf"),
   BookModel(
      id: "2",
      title: "Daily Stoice",
      description: "The  publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum",
      aboutAuthor: "hi my name is Tony John and i have written this book",
      author: "Tony John",
      coverUrl: "Assets/Images/daily stoic.jpg",
      category: "Documentary",
      pages: 234,
      bookurl:"https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf"),
   BookModel(
      id: "3",
      title: "Give and Take",
     description: "The  publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum",
      aboutAuthor: "hi my name is Tony John and i have written this book"
      ,
      author: "Tony John",
      coverUrl: "Assets/Images/Give and Take.jpg",
      category: "Documentary",
      language: "ENG",
      pages: 234,
      bookurl:
          "https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf"),
  BookModel(
    id: "4",
    title: "When the Moon Split",
    description: "The publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum",
    aboutAuthor: "hi my name is Tony John and i have written this book"
    ,
    author: "Tony John",
    coverUrl: "Assets/Images/When the moon split.jpg",

    category: "Documentary",
    pages: 234,
    language: "ENG",
    bookurl:
        "https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf",
  )
];
