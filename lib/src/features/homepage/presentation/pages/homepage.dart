import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            title: const Text('Book1'),
            subtitle: const Text('Nice book'),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite),
            ),
          );
        },
      ),
    );
  }
}
