import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  final inputController = TextEditingController();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _addCustomValue(int value) {
    _counter += value;
    setState(() {});
  }

  void _removeCustomValue(int value) {
    _counter -= value;
    setState(() {});
  }

  void _decrement() {
    _counter--;
    setState(() {});
  }

  void _resetCounter() {
    _counter = 0;
    setState(() {});
  }

  final globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'This is your current count:',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(fontSize: 20),
              ),
              const SizedBox(height: 20),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4?.copyWith(
                      fontSize: 55,
                    ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60.0),
                child: TextFormField(
                  controller: inputController,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    label: Text("custom value: "),
                    hintText: "type your custom value",
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      if (inputController.text.isNotEmpty) {
                        _removeCustomValue(int.parse(inputController.text));
                        inputController.clear();
                      }
                    },
                    child: const Text("Remove custom"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (inputController.text.isNotEmpty) {
                        _addCustomValue(int.parse(inputController.text));
                        inputController.clear();
                      }
                    },
                    child: const Text("Add custom"),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            bottom: 20,
            left: 20,
            child: FloatingActionButton(
              onPressed: _decrement,
              backgroundColor: Colors.redAccent,
              child: const Icon(Icons.exposure_minus_1_outlined),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 150),
              child: OutlinedButton(
                onPressed: _resetCounter,
                child: const Text("Reset"),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: FloatingActionButton(
              onPressed: _incrementCounter,
              child: const Icon(Icons.plus_one),
            ),
          ),
        ],
      ),
    );
  }
}
