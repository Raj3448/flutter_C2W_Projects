import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<int> _numberList = [121, 345, 738, 153, 4242, 145];

  int _palliCount = 0;
  int armCount = 0;

  bool ischeck1 = false;
  bool ischeck2 = false;
  bool ischeck3 = false;

  void _checkPalliCounter() {
    for (int i = 0; i < _numberList.length; i++) {
      String str1 = _numberList[i].toString();
      if (str1 == str1.split('').reversed.join()) {
        setState(() {
          _palliCount++;
        });
      }
    }
    setState(() {
      ischeck3 = true;
    });
  }

  void _checkArmStrong() {
    for (int i = 0; i < _numberList.length; i++) {
      int len = _numberList[i].toString().length;
      print('Length : $len');
      int temp = _numberList[i];
      int sum = 0;
      while (temp != 0) {
        int digit = temp % 10;
        int mul = 1;
        for (int i = 0; i < len; i++) {
          mul *= digit;
        }
        sum += mul;
        temp ~/= 10;
      }
      if (sum == _numberList[i]) {
        setState(() {
          armCount++;
        });
      }
    }
    setState(() {
      ischeck1 = true;
    });
  }

  int factorial(int n) {
    if (n == 0 || n == 1) {
      return 1;
    } else {
      return n * factorial(n - 1);
    }
  }

  int _strongCount = 0;
  void checkStrongNumber() {
    for (int i = 0; i < _numberList.length; i++) {
      int original = _numberList[i];
      int sum = 0;
      while (original != 0) {
        int digit = original % 10;
        sum += factorial(digit);
        original ~/= 10;
      }

      if (sum == _numberList[i]) {
        setState(() {
          _strongCount++;
        });
      }
    }
    setState(() {
      ischeck2 = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.08,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: _numberList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        margin: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 167, 208, 241),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            _numberList[index].toString(),
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const Text(
                'Push button for getting pallindrome count:',
              ),
              ElevatedButton(
                  onPressed: () => ischeck3 ? null : _checkPalliCounter(),
                  child: const Text('Click')),
              Text(
                '$_palliCount',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const Text(
                'Push button for getting Armstrong number count:',
              ),
              ElevatedButton(
                  onPressed: ischeck1 ? null : () => _checkArmStrong(),
                  child: const Text('Click')),
              Text(
                '$armCount',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const Text(
                'Push button for getting Strong number count:',
              ),
              ElevatedButton(
                  onPressed: () => ischeck2 ? null : checkStrongNumber(),
                  child: const Text('Click')),
              Text(
                '$_strongCount',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
