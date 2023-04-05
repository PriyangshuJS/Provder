import 'package:flutter/material.dart';

class Second extends StatefulWidget {
  final List<int> number;
  const Second({super.key, required this.number});

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            int last = widget.number.last;
            setState(() {
              widget.number.add(last + 1);
            });
          },
          child: const Icon(Icons.add)),
      appBar: AppBar(
        title: const Text("Second"),
      ),
      body: Column(
        children: [
          Text(
            widget.number.last.toString(),
            style: const TextStyle(fontSize: 20),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.number.length,
              itemBuilder: (BuildContext context, int index) {
                return Text(
                  widget.number[index].toString(),
                  style: const TextStyle(fontSize: 20),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
