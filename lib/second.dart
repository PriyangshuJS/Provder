import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'list_provider.dart';

class Second extends StatefulWidget {
  const Second({
    super.key,
  });

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
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
          title: const Text("Second"),
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
          ],
        ),
      ),
    );
  }
}
