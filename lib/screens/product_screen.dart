import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nt_ten/bloc/product_bloc.dart';
import 'package:flutter_nt_ten/data/models/form_status.dart';
import 'package:flutter_nt_ten/data/models/product_model.dart';
import 'package:flutter_nt_ten/screens/qr_scanner_screen.dart';
import 'package:flutter_nt_ten/utils/styles/app_text_style.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return QrScannerScreen(
                      barcode: (barcode) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(barcode.code.toString()),
                          ),
                        );
                        context.read<ProductBloc>().add(
                              AddProductEvent(
                                productModel: ProductModel(
                                  name: "Pomidor",
                                  id: 2,
                                  qrCode: barcode.code.toString(),
                                  description: "Tabiiy",
                                ),
                              ),
                            );
                      },
                    );
                  },
                ),
              );
            },
            icon: const Icon(
              Icons.qr_code_scanner,
              color: Colors.white,
            ),
          )
        ],
      ),
      backgroundColor: Colors.grey,
      body: BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
        if (state.status == FormStatus.loading) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
        if (state.status == FormStatus.error) {
          return Center(
            child: Text(state.statusText),
          );
        }

        return ListView.builder(
          itemCount: state.products.length,
          itemBuilder: (context, index) {
            ProductModel productModel = state.products[index];
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16), color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productModel.name,
                    style: AppTextStyle.interSemiBold.copyWith(fontSize: 32),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      QrImageView(
                        data: productModel.qrCode,
                        version: QrVersions.auto,
                        size: 200.0,
                      ),
                    ],
                  ),
                  Text(
                    "QR-Code: ${productModel.qrCode}",
                    style: AppTextStyle.interSemiBold.copyWith(fontSize: 16),
                  ),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}
