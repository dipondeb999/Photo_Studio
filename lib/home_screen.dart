import 'package:flutter/material.dart';
import 'package:photo_studio/Items_list.dart';
import 'drawer_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void showSnackBar(message, context){
    SnackBar snackBar = SnackBar(
        backgroundColor: Colors.green,
      behavior: SnackBarBehavior.fixed,
      duration: const Duration(seconds: 3),
      content: Text(message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Photo Studio',
        style: TextStyle(
          color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                showSnackBar('I am a search', context);
              },
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
          ),
          IconButton(
              onPressed: () {
                showSnackBar('I am a more option', context);
              },
              icon: const Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
          ),
        ],
      ),
      drawer: const DrawerScreen(),
      body: GridView.builder(
        itemCount: ItemsList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            crossAxisSpacing: 2,
          ),
          itemBuilder: (context, index){
            return Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: Image.network(ItemsList[index]['image']!,
                      fit: BoxFit.cover,
                      ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Name : ${ItemsList[index]['name']!}",
                        style: const TextStyle(
                          fontSize: 10,
                          ),
                        ),
                        Text("Place : ${ItemsList[index]['place']!}",
                          style: const TextStyle(
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          }
      ),
    );
  }
}
