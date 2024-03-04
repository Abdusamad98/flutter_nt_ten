import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/data/models/my_response.dart';
import 'package:flutter_nt_ten/data/models/product_model.dart';
import 'package:flutter_nt_ten/data/repositories/product_repo.dart';
import 'package:flutter_nt_ten/utils/colors/app_colors.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final ProductRepo productRepo = ProductRepo();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text("Products Create, Read, Update Delete"),
      ),
      body: FutureBuilder<MyResponse>(
        future: productRepo.getAllProducts(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }

          if (snapshot.hasData) {
            List<ProductModel> products =
                (snapshot.data as MyResponse).data as List<ProductModel>;
            return ListView(
              children: [
                ...List.generate(products.length, (index) {
                  var product = products[index];
                  return ListTile(
                      title: Text(product.productName),
                      subtitle: Text(product.description),
                      leading: Image.network(
                        product.imageUrl,
                        width: 42,
                      ),
                      trailing: SizedBox(
                        width: 100,
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () async {
                                ProductModel productModel = ProductModel(
                                  color: Colors.red,
                                  description: product.description,
                                  productName: "Macbook Pro M2",
                                  imageUrl: product.imageUrl,
                                  price: product.price,
                                  dateTime: DateTime.now(),
                                  productId: product.productId,
                                );

                                await productRepo.updateProduct(productModel);
                                setState(() {});
                              },
                              icon: const Icon(
                                Icons.edit,
                                color: Colors.green,
                              ),
                            ),
                            IconButton(
                              onPressed: () async {
                                await productRepo
                                    .deleteProduct(product.productId);
                                setState(() {});
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ));
                })
              ],
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          ProductModel productModel = ProductModel(
            color: Colors.red,
            description: "Zo'r telefon",
            productName: "Samsung Galaxy S21",
            imageUrl:
                "https://www.cnet.com/a/img/resize/3e495e5ec2d57f5893947cb6497fd9f4cf236c4e/hub/2021/01/20/5ac18449-617c-49ba-83f2-2971cb51078c/215-samsung-galaxy-s21-ultra-back.jpg",
            price: 1500.0,
            dateTime: DateTime.now(),
            productId: "",
          );

          await productRepo.addProduct(productModel);
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
