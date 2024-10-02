import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const LoanCalculatorApp());
}

class LoanCalculatorApp extends StatelessWidget {
  const LoanCalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoanCalculatorScreen(),
    );
  }
}

class LoanCalculatorScreen extends StatefulWidget {
  const LoanCalculatorScreen({super.key});

  @override
  _LoanCalculatorScreenState createState() => _LoanCalculatorScreenState();
}

class _LoanCalculatorScreenState extends State<LoanCalculatorScreen> {
  double _months = 30;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            _buildTitle(),
            const SizedBox(height: 40),
            _buildLabel('Enter amount'),
            const SizedBox(height: 10),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Amount',
              ),
            ),
            const SizedBox(height: 20),
            _buildLabel('Enter number of months'),
            const SizedBox(height: 10),
            Slider(
              value: _months,
              min: 1,
              max: 60,
              divisions: 59,
              label: _months.round().toString(),
              onChanged: (value) {
                setState(() {
                  _months = value;
                });
              },
              activeColor: Colors.blue,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('1'),
                Text('60'),
              ],
            ),
            const SizedBox(height: 20),
            _buildLabel('Enter % per month'),
            const SizedBox(height: 10),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Percent',
              ),
            ),
            const SizedBox(height: 30),
            _buildResultContainer(),
            const SizedBox(height: 20),
            _buildCalculateButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return const Center(
      child: Text(
        'Loan calculator',
        style: TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.w900,
          fontFamily: 'Roboto',
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        fontFamily: 'Roboto',
      ),
    );
  }

  Widget _buildResultContainer() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      child: const Column(
        children: [
          Text(
            'You will pay the approximate amount monthly:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Text(
            '3.943€',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCalculateButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 20),
          backgroundColor: Colors.blue.shade900,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: const Text(
          'Calculate',
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}