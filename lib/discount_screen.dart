import 'package:flutter/material.dart';

class DiscountScreen extends StatelessWidget {
  const DiscountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<ItemHelper> items = [
      ItemHelper(
        title: "Discount Opening - 50%",
        gradient: [
          Color(0xFF0052D4),
          Color(0xFF4364F7),
          Color(0xFF6FB1FC),
        ],
        subtitle: "Opening Discount for new customer.",
      ),
      ItemHelper(
        title: "E-Wallet - 10%",
        gradient: [
          Color(0xFF4776E6),
          Color(0xFF8E54E9),
        ],
        subtitle: "Disc for Customer with E-Wallet",
      ),
      ItemHelper(
        title: "Discount VISACARD - 17%",
        gradient: [
          Color(0xFFEC008C),
          Color(0xFFFC6767),
        ],
        subtitle: "For VISACARD Payment",
      ),
      ItemHelper(
        title: " Chevrolet Cobalt",
        gradient: [
          Colors.black,
          Colors.white,
        ],
        subtitle: "Discount 20%",
      )
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // elevation: 10,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: IconButton(
            onPressed: () {},
            color: Colors.blue,
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        title: const Text(
          'Discount',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF1A72DD),
            fontSize: 22,
            fontWeight: FontWeight.w500,
            height: 0,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: 1,
            color: Colors.grey,
          ),
          const SizedBox(height: 8),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: Colors.red,
                width: 1,
              ),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Search discount',
                  style: TextStyle(
                    color: Color(0xFFBDBDBD),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
                Icon(
                  Icons.search,
                  color: Color(0xFF2A3256),
                )
              ],
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.grey.shade100,
            child: Column(
              children: [
                const SizedBox(height: 23),
                ...List.generate(
                  items.length,
                  (index) => Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 10,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 30,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          // begin: Alignment.topRight,
                          // end: Alignment.bottomRight,
                          colors: items[index].gradient,
                        )),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          items[index].title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontFamily: 'Rubik',
                            fontWeight: FontWeight.w500,
                            height: 0,
                          ),
                        ),
                        Text(
                          items[index].subtitle,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: 'Rubik',
                            fontWeight: FontWeight.w400,
                            height: 0,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                // getWidget(items[0]),
                // getWidget(items[1]),
                // getWidget(items[2]),
                // getWidget(items[3]),
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget getWidget(ItemHelper itemHelper) {
  return Container(
    width: double.infinity,
    margin: const EdgeInsets.symmetric(
      horizontal: 24,
      vertical: 10,
    ),
    padding: const EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 30,
    ),
    decoration: BoxDecoration(
      color: Colors.blue,
      borderRadius: BorderRadius.circular(20),
      gradient: LinearGradient(
        colors: itemHelper.gradient,
      ),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          itemHelper.title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontFamily: 'Rubik',
            fontWeight: FontWeight.w500,
            height: 0,
          ),
        ),
        Text(
          itemHelper.subtitle,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontFamily: 'Rubik',
            fontWeight: FontWeight.w400,
            height: 0,
          ),
        )
      ],
    ),
  );
}

class ItemHelper {
  final String title;
  final String subtitle;
  final List<Color> gradient;

  ItemHelper({
    required this.title,
    required this.gradient,
    required this.subtitle,
  });
}
