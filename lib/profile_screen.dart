import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> list = [
      "Setting Account",
      "Subscription history",
      "Business Information",
      "Dashboard",
      "User Help",
      "Another button",
    ];

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        elevation: 10,
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
          'Account',
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
      body: Padding(
        padding: const EdgeInsets.fromLTRB(23, 23, 23, 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 23),
            Row(
              children: [
                Container(
                  height: 80,
                  width: 80,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.person,
                    size: 80,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 14),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'MyNameStore',
                      style: TextStyle(
                        color: Color(0xFF2A3256),
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '0821452384425',
                      style: TextStyle(
                        color: Color(0xFF2A3256),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Owner@email.com',
                      style: TextStyle(
                        color: Color(0xFF2A3256),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(height: 40),
            ...List.generate(
              list.length,
              (index) => Column(
                children: [
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        list[index],
                        style: const TextStyle(
                          color: Color(0xFF2A3256),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                      const Icon(Icons.chevron_right),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Container(
                    height: 1,
                    color: Colors.red,
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'MokPOS V.1.0.0',
              style: TextStyle(
                color: Color(0xFF2A3256),
                fontSize: 16,
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
            const Spacer(),
            Container(
              height: 57,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: const Color(0xFFF4261A),
                  width: 1,
                ),
              ),
              child: const Center(
                child: Text(
                  'Log out',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFF4261A),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
