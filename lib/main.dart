import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePageState(),
    );
  }
}

class HomePageState extends StatefulWidget {
  const HomePageState({super.key});

  @override
  State<HomePageState> createState() => _HomePageStateState();
}

class _HomePageStateState extends State<HomePageState> {
  int count = 0;

  void decrement() {
    setState(() {
      if (count >= 1) {
        count--;
      }
    });
  }

  void increment() {
    setState(() {
      count++;
    });
  }

  bool get isEmpty => count == 0;
  bool get isFull => count == 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contador de pessoas'),
        backgroundColor: Colors.amber,
      ),
      backgroundColor: Colors.black,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/gym.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(30),
              child: Text(
                isFull ? 'LOTADO' : 'Pode entrar',
                style: TextStyle(
                    color: isFull ? Colors.red : Colors.amber,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Text(
                count.toString(),
                style: TextStyle(
                  color: isFull ? Colors.red : Colors.amber,
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 250,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor:
                        isFull ? Colors.white.withOpacity(0.2) : Colors.white,
                    primary: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    fixedSize: const Size(100, 100),
                  ),
                  onPressed: isFull ? null : increment,
                  child: const Text(
                    'ENTROU',
                    style: TextStyle(color: Colors.amber),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor:
                        isEmpty ? Colors.white.withOpacity(0.2) : Colors.white,
                    primary: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    fixedSize: const Size(100, 100),
                  ),
                  onPressed: isEmpty ? null : decrement,
                  child: const Text(
                    'SAIU',
                    style: TextStyle(color: Colors.amber),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
