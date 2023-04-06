import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'second.dart';
import 'list_provider.dart';

class First extends StatefulWidget {
  const First({super.key});

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NumberListProvider>(
      builder: (context, numberProviderModel, child) => Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              numberProviderModel.add();
            },
            child: const Icon(Icons.add)),
        appBar: AppBar(
          title: const Text("First"),
        ),
        body: Column(
          children: [
            Text(
              numberProviderModel.number.last.toString(),
              style: const TextStyle(fontSize: 20),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: numberProviderModel.number.length,
                itemBuilder: (BuildContext context, int index) {
                  return Text(
                    numberProviderModel.number[index].toString(),
                    style: const TextStyle(fontSize: 20),
                  );
                },
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const Second()));
                },
                child: const Text("Second"))
          ],
        ),
      ),
    );
  }
}
