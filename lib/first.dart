import 'package:flutter/material.dart';

import 'second.dart';

class First extends StatefulWidget {
  const First({super.key});

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  List<int> number = [1, 2, 3, 4];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            int last = number.last;
            setState(() {
              number.add(last + 1);
            });
          },
          child: const Icon(Icons.add)),
      appBar: AppBar(
        title: const Text("First"),
      ),
      body: Column(
        children: [
          Text(
            number.last.toString(),
            style: const TextStyle(fontSize: 20),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: number.length,
              itemBuilder: (BuildContext context, int index) {
                return Text(
                  number[index].toString(),
                  style: const TextStyle(fontSize: 20),
                );
              },
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Second(
                          number: number,
                        )));
              },
              child: const Text("Second"))
        ],
      ),
    );
  }
}
