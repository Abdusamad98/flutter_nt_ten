import 'package:flutter_nt_ten/data/models/my_response.dart';
import 'package:flutter_nt_ten/data/models/book_model.dart';
import 'package:flutter_nt_ten/data/network/api_provider.dart';

class BookRepo {
  Future<MyResponse> getAllBooks() => ApiProvider.getAllBooks();

  Future<MyResponse> addBook(BookModel bookModel) =>
      ApiProvider.addBook(bookModel);

  Future<MyResponse> deleteBook(String bookUUID) =>
      ApiProvider.deleteBook(bookUUID);

  Future<MyResponse> updateBook(BookModel bookModel) =>
      ApiProvider.updateBook(bookModel);
}
