import 'package:android_path_provider/android_path_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart'; // Import the permission_handler package

class Downloadpage extends StatelessWidget {
  final String bookUrl;
  final String title;
  const Downloadpage({Key? key, required this.bookUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: BackButton(color: Theme.of(context).colorScheme.background),
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          "Download $title Book ",
          style: Theme.of(context).textTheme.headline6?.copyWith(color: Theme.of(context).colorScheme.background),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  // Request permissions before downloading the file
                  var status = await Permission.storage.request();
                  if (status.isGranted) {
                    // Permission granted, proceed with downloading the file
                    try {
                      var dir = await AndroidPathProvider.downloadsPath;
                      if (dir != null) {
                        String savename = "$title.pdf";
                        String savePath = dir + "/$savename";
                        print(savePath);
                        await Dio().download(
                          bookUrl,
                          savePath,
                          onReceiveProgress: (received, total) {
                            if (total != -1) {
                              print((received / total * 100).toStringAsFixed(0) + "%");
                            }
                          },
                        );
                        print("File is saved to download folder.");
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("File Downloaded"),
                        ));
                      }
                    } catch (e) {
                      print("Error downloading file: $e");
                    }
                  } else {
                    // Permission denied, show a message to the user
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Permission denied to access storage"),
                    ));
                  }
                },
                child: Text(
                  "Download File",
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(color: Theme.of(context).colorScheme.primary),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

