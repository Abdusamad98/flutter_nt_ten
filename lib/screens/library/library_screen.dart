import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/data/models/book_model.dart';
import 'package:flutter_nt_ten/view_models/book_view_model.dart';
import 'package:flutter_nt_ten/view_models/profile_view_model.dart';
import 'package:provider/provider.dart';

String imageUrl =
    "https://purepng.com/public/uploads/large/purepng.com-booksbookillustratedwrittenprintedliteratureclipart-1421526451707uyace.png";

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  @override
  void initState() {
    //1-usul
    Future.microtask(() {
      context.read<BookViewModel>().getAllBooks();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("UI DREW");

    // var provider1 = Provider.of<BookViewModel>(context);
    // var provider2 = context.watch<BookViewModel>();
    // var provider3 = Provider.of<BookViewModel>(context, listen: false);
    // var provider4 = context.read<BookViewModel>();

    // var profileViewModel = Provider.of<ProfileViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Books"),
        actions: [],
      ),
      body: Column(
        children: [
          Container(
            color: Colors.green,
            height: 200,
          ),
          Consumer<BookViewModel>(builder: (context, bookViewModel, child) {
            return Expanded(
              child: bookViewModel.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : ListView(
                      children: [
                        ...List.generate(
                          bookViewModel.allBooks.length,
                          (index) => ListTile(
                            title:
                                Text(bookViewModel.allBooks[index].productName),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            bookViewModel.addBook(
                              BookModel(
                                description: "description",
                                productName: "productName",
                                imageUrl: "",
                                price: 123,
                                categoryId: 1,
                                uuid: "",
                                rate: 4.0,
                                author: "Falonchi",
                              ),
                            );
                          },
                          icon: const Icon(Icons.add),
                        )
                      ],
                    ),
            );
          })
        ],
      ),
    );
  }
}
