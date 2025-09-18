import 'package:flutter/material.dart';

// نقطة البداية
void main() {
  runApp(const MyApp());
}

// ----------------- التطبيق الجذري -----------------
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // نخفي علامة debug
      title: 'تكليف Flutter',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const HomeScreen(), // الشاشة الرئيسية
    );
  }
}

// ----------------- زر مخصص -----------------
class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const CustomButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap, // الحدث عند الضغط
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

// ----------------- الشاشة الرئيسية -----------------
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pages = [
      ("Row & Column", const RowColumnScreen()),
      ("Stack", const StackScreen()),
      ("ListView", const ListViewScreen()),
      ("GridView", const GridViewScreen()),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("التكليف - Flutter Layouts")),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: pages.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final (title, screen) = pages[index];
          return CustomButton(
            text: title,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => screen),
              );
            },
          );
        },
      ),
    );
  }
}

// ----------------- شاشة Row & Column -----------------
class RowColumnScreen extends StatelessWidget {
  const RowColumnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Row & Column")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text("استخدام Column: عناصر مرتبة عمودياً"),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomButton(text: "زر 1", onTap: () {}),
                CustomButton(text: "زر 2", onTap: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ----------------- شاشة Stack -----------------
class StackScreen extends StatelessWidget {
  const StackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Stack")),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(width: 200, height: 200, color: Colors.deepPurple.shade100),
            Container(width: 150, height: 150, color: Colors.deepPurple.shade300),
            CustomButton(text: "زر في الوسط", onTap: () {}),
          ],
        ),
      ),
    );
  }
}

// ----------------- شاشة ListView -----------------
class ListViewScreen extends StatelessWidget {
  const ListViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = List.generate(10, (i) => "عنصر رقم ${i + 1}");

    return Scaffold(
      appBar: AppBar(title: const Text("ListView")),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: CustomButton(text: items[index], onTap: () {}),
          );
        },
      ),
    );
  }
}

// ----------------- شاشة GridView -----------------
class GridViewScreen extends StatelessWidget {
  const GridViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = List.generate(6, (i) => "بلاطة ${i + 1}");

    return Scaffold(
      appBar: AppBar(title: const Text("GridView")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          children: [
            for (final item in items)
              CustomButton(text: item, onTap: () {}),
          ],
        ),
      ),
    );
  }
}
