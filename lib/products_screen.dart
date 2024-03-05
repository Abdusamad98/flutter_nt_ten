import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/data/models/my_response.dart';
import 'package:flutter_nt_ten/data/models/product_model.dart';
import 'package:flutter_nt_ten/data/repositories/product_repo.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final ProductRepo productRepo = ProductRepo();

  bool isDark = false;

  _init() async {
    isDark = await AdaptiveTheme.getThemeMode() == AdaptiveThemeMode.dark;
    setState(() {});
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Switch(
            value: isDark,
            onChanged: (v) async {
              if (v) {
                AdaptiveTheme.of(context).setDark();
              } else {
                AdaptiveTheme.of(context).setLight();
              }
              isDark = v;
            },
          ),
        ],
        title: Text(
          "Products Create, Read, Update Delete",
          style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 18),
        ),
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
                      title: Text(product.productName,
                          style: Theme.of(context).textTheme.titleMedium),
                      subtitle: Text(
                        product.description,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
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
                              style: Theme.of(context).iconButtonTheme.style,
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
                              style: Theme.of(context).iconButtonTheme.style,
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
                "https://dam.which.co.uk/IC20006-0452-00-front-800x600.jpg",
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
