import 'package:flutter/material.dart';
import 'package:flutter_nt_ten/data/local/local_database.dart';
import 'package:flutter_nt_ten/data/models/coffee_model.dart';
import 'package:flutter_nt_ten/screens/home/widgets/my_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  List<CoffeeModel> savedCoffees = [];
  List<CoffeeModel> favouritesCoffees = [];

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawerEnableOpenDragGesture: false,
      drawer: MyDrawer(),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            scaffoldKey.currentState!.openDrawer();
            //Scaffold.of(context).openDrawer();
          },
          icon: Icon(Icons.menu),
        ),
      ),
      body: Column(
        children: [
          ...List.generate(
            savedCoffees.length,
            (index) => ListTile(
                leading: Image.asset(savedCoffees[index].imagePath),
                title: Text(savedCoffees[index].name),
                trailing: SizedBox(
                  width: 150,
                  child: Row(
                    children: [
                      Text(
                        savedCoffees[index].count.toString(),
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      IconButton(
                        onPressed: () async {
                          int currentCount = savedCoffees[index].count!;
                          currentCount++;
                          LocalDatabase.updateCoffeeCount(
                              count: currentCount,
                              coffeeId: savedCoffees[index].dbId!);
                          _init();
                        },
                        icon: const Icon(Icons.add),
                      ),
                      IconButton(
                        onPressed: () async {
                          LocalDatabase.updateCoffeeFavourite(
                              isFavourite: !savedCoffees[index].isFavourite,
                              coffeeId: savedCoffees[index].dbId!);
                          _init();
                        },
                        icon: Icon(
                          savedCoffees[index].isFavourite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: Colors.red,
                        ),
                      )
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }

  _init() async {
    savedCoffees = await LocalDatabase.getAllCoffees();
    favouritesCoffees =
        savedCoffees.where((element) => element.isFavourite).toList();
    setState(() {});
  }
}
