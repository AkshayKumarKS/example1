import 'package:flutter/material.dart';

void main() {
  runApp(
      MaterialApp(
    debugShowCheckedModeBanner: false,
    home: AA(),
  ));
}

class AA extends StatefulWidget {
  const AA({super.key});

  @override
  State<AA> createState() => _AAState();
}

class _AAState extends State<AA> {
  TextEditingController BB = TextEditingController();

  tom() {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(BB.text)));
  }

  jerry() {
    setState(() {
      if (BB.text.isNotEmpty)
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(BB.text),
              actions: [
                MaterialButton(
                  color: Colors.red,
                  onPressed: () {
                    BB.clear();
                    Navigator.pop(context);
                  },
                  child: Text('ok'),
                ),
                MaterialButton(
                  color: Colors.green,
                  onPressed: () {
                    tom();
                    BB.clear();
                    Navigator.pop(context);
                  },
                  child: Text('yes'),
                )
              ],
            );
          },
        );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WELCOME'),
        centerTitle: true,
      ),
      backgroundColor: Colors.orange,
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () => jerry(), label: Text('ok')),
      body: Container(
        child: TextField(
          decoration: InputDecoration(
              labelText: 'DONE',
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              )),
          controller: BB,
        ),
        margin: EdgeInsets.all(30),
      ),
    );
  }
}
