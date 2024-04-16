import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerExampleScreen extends StatelessWidget {
  const ShimmerExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Shimmer.fromColors(
        baseColor: Colors.red[600]!,
        highlightColor: Colors.grey[300]!,
        child: ListView.builder(
          itemCount: 5, // Adjust the count based on your needs
          itemBuilder: (context, index) {
            return ListTile(
              title: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.all(8),
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                      child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 10),
                        height: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 10),
                        height: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ))
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
