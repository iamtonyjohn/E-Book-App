import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
//import 'package:get/get.dart';
//import 'package:permission_handler/permission_handler.dart';
import 'package:android_path_provider/android_path_provider.dart'; // Import android_path_provider instead of downloads_path_provider_28

class Downloadpage extends StatelessWidget {
  final String bookUrl;
  final String title;
  const Downloadpage({super.key, required this.bookUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: BackButton(color: Theme.of(context).colorScheme.background,),
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text("Download $title Book ",style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Theme.of(context).colorScheme.background),),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Text("File URL: $bookUrl"),
            Divider(),
            ElevatedButton(
              
              onPressed: () async {              
             
                if (true )   
                {
                  var dir = await AndroidPathProvider.downloadsPath; // Use AndroidPathProvider instead of DownloadsPathProvider
                  
                    String savename = "$title.pdf";
                    String savePath = dir + "/$savename"; // Change dir.path to dir
                    print(savePath);
                    //output:  /storage/emulated/0/Download/banner.png

                    try {
                      await Dio().download(
                        bookUrl,
                        savePath,
                        onReceiveProgress: (received, total) {
                          if (total != -1) {
                            print((received / total * 100).toStringAsFixed(0) + "%");
                            //you can build progressbar feature too
                          }
                        },
                      );
                      print("File is saved to download folder.");
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("File Downloaded",),
                      ));
                    } on DioError catch (e) {
                      print(e.message);
                    }
                  
                }
              },
           
              child: Text("Download File.",style: Theme.of(context).textTheme.bodyLarge?.copyWith(color:Theme.of(context).colorScheme.primary)),
              
            )
          ],
        ),
      ),
    );
  }
}
