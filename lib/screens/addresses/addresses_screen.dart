import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/screens/maps/google_maps_screen.dart';
import 'package:flutter_nt_ten/screens/maps/update_address_screen.dart';
import 'package:flutter_nt_ten/view_models/addressess_view_model.dart';
import 'package:provider/provider.dart';

class AddressesScreen extends StatefulWidget {
  const AddressesScreen({super.key});

  @override
  State<AddressesScreen> createState() => _AddressesScreenState();
}

class _AddressesScreenState extends State<AddressesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("May Addresses"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<AddressesViewModel>(
              builder: (context, viewModel, child) {
                return ListView(children: [
                  ...List.generate(viewModel.myAddresses.length, (index) {
                    var myAddress = viewModel.myAddresses[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return UpdateAddressScreen(
                                placeModel: myAddress,
                              );
                            },
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.all(12),
                        height: 100,
                        width: double.infinity,
                        color: Colors.blue,
                      ),
                    );
                  })
                ]);
              },
            ),
          ),
          TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return GoogleMapsScreen();
                    },
                  ),
                );
              },
              child: Text("Yangi address qo'shish"))
        ],
      ),
    );
  }
}
