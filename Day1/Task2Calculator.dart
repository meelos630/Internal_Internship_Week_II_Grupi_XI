import 'package:flutter/material.dart';

void main() {
  runApp(const GradeCalculatorApp());
}

class GradeCalculatorApp extends StatelessWidget {
  const GradeCalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Grade Calculator',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
      ),
      home: const GradeCalculatorPage(),
    );
  }
}

class GradeCalculatorPage extends StatefulWidget {
  const GradeCalculatorPage({super.key});

  @override
  State<GradeCalculatorPage> createState() =>
      _GradeCalculatorPageState();
}

class _GradeCalculatorPageState extends State<GradeCalculatorPage> {
  final TextEditingController gradeOneController =
      TextEditingController();

  final TextEditingController gradeTwoController =
      TextEditingController();

  final TextEditingController gradeThreeController =
      TextEditingController();

  String resultText = 'Enter three grades';
  String statusText = '';

  void calculateAverage() {
    final String firstInput = gradeOneController.text.trim();
    final String secondInput = gradeTwoController.text.trim();
    final String thirdInput = gradeThreeController.text.trim();

    if (firstInput.isEmpty ||
        secondInput.isEmpty ||
        thirdInput.isEmpty) {
      showMessage('Please fill in all fields.');
      return;
    }

    final double? gradeOne = double.tryParse(firstInput);
    final double? gradeTwo = double.tryParse(secondInput);
    final double? gradeThree = double.tryParse(thirdInput);

    if (gradeOne == null ||
        gradeTwo == null ||
        gradeThree == null) {
      showMessage('Please enter only numbers.');
      return;
    }

    if (gradeOne < 1 ||
        gradeOne > 5 ||
        gradeTwo < 1 ||
        gradeTwo > 5 ||
        gradeThree < 1 ||
        gradeThree > 5) {
      showMessage('Grades must be between 1 and 5.');
      return;
    }

    final double average =
        (gradeOne + gradeTwo + gradeThree) / 3;

    final String status;

    if (average >= 3) {
      status = 'Kalon';
    } else {
      status = 'Duhet përmirësim';
    }

    setState(() {
      resultText = 'Mesatarja: ${average.toStringAsFixed(2)}';
      statusText = 'Statusi: $status';
    });
  }

  void clearFields() {
    gradeOneController.clear();
    gradeTwoController.clear();
    gradeThreeController.clear();

    setState(() {
      resultText = 'Enter three grades';
      statusText = '';
    });
  }

  void showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  void dispose() {
    gradeOneController.dispose();
    gradeTwoController.dispose();
    gradeThreeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      appBar: AppBar(
        title: const Text('Grade Calculator'),
        centerTitle: true,
        backgroundColor: const Color(0xFF1E3A8A),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Container(
            constraints: const BoxConstraints(
              maxWidth: 450,
            ),
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 12,
                  offset: Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.calculate,
                  size: 70,
                  color: Color(0xFF1E3A8A),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Grade Calculator',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0F172A),
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Enter three grades from 1 to 5.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xFF64748B),
                  ),
                ),
                const SizedBox(height: 24),
                buildGradeField(
                  controller: gradeOneController,
                  label: 'Grade 1',
                ),
                const SizedBox(height: 14),
                buildGradeField(
                  controller: gradeTwoController,
                  label: 'Grade 2',
                ),
                const SizedBox(height: 14),
                buildGradeField(
                  controller: gradeThreeController,
                  label: 'Grade 3',
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: calculateAverage,
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color(0xFF1E3A8A),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            vertical: 14,
                          ),
                        ),
                        child: const Text('Calculate'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: clearFields,
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            vertical: 14,
                          ),
                        ),
                        child: const Text('Clear'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: const Color(0xFFDBEAFE),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Column(
                    children: [
                      Text(
                        resultText,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1E3A8A),
                        ),
                      ),
                      if (statusText.isNotEmpty)
                        const SizedBox(height: 8),
                      if (statusText.isNotEmpty)
                        Text(
                          statusText,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF0F172A),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildGradeField({
    required TextEditingController controller,
    required String label,
  }) {
    return TextField(
      controller: controller,
      keyboardType: const TextInputType.numberWithOptions(
        decimal: true,
      ),
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: const Icon(Icons.school),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
