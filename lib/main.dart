import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Howl's Moving Castle",
      home: Scaffold(
        backgroundColor: Colors.pink[50],
        appBar: AppBar(
          title: const Text("Howl's Moving Castle"),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.pink, Colors.pinkAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
        ),
        body: const SingleChildScrollView(
          child: Column(
            children: [
              // Gambar
              ImageSection(
                  image:
                  'assets/images/howl-s-moving-castle-studio-ghibli-fantasy-art-clouds-daylight-hd-wallpaper-preview.jpg'),

              // Judul
              TitleSection(
                name: "Howl's Moving Castle",
                location: "Studio Ghibli, 2004",
              ),

              // Tombol aksi
              ButtonSection(),

              // Deskripsi
              TextSection(
                description:
                "Howl's Moving Castle adalah film animasi fantasi karya Hayao Miyazaki. "
                    "Film ini bercerita tentang Sophie, gadis muda yang terkena kutukan "
                    "menjadi nenek tua, lalu bertemu penyihir misterius bernama Howl dan "
                    "api ajaib bernama Calcifer di kastil bergerak. "
                    "Film ini menekankan tema cinta, keberanian, dan anti-perang.",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Bagian Judul
class TitleSection extends StatelessWidget {
  const TitleSection({super.key, required this.name, required this.location});

  final String name;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.pink,
                  ),
                ),
                const SizedBox(height: 4),
                Text(location,
                    style: TextStyle(
                        color: Colors.pink[300],
                        fontStyle: FontStyle.italic)),
              ],
            ),
          ),
          const Icon(Icons.star, color: Colors.pink),
          const Text(" 99",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.pink)),
        ],
      ),
    );
  }
}

// Bagian Tombol
class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          ButtonWithText(icon: Icons.play_arrow, label: "PLAY", color: Colors.pink),
          ButtonWithText(icon: Icons.info, label: "DETAILS", color: Colors.pinkAccent),
          ButtonWithText(icon: Icons.share, label: "SHARE", color: Colors.pink),
        ],
      ),
    );
  }
}

class ButtonWithText extends StatelessWidget {
  const ButtonWithText(
      {super.key, required this.icon, required this.label, required this.color});

  final IconData icon;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: color, size: 30),
        const SizedBox(height: 4),
        Text(label,
            style: TextStyle(
                color: color, fontSize: 14, fontWeight: FontWeight.bold)),
      ],
    );
  }
}

// Bagian Teks Deskripsi
class TextSection extends StatelessWidget {
  const TextSection({super.key, required this.description});
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Text(description,
          softWrap: true,
          style: const TextStyle(fontSize: 16, color: Colors.black87)),
    );
  }
}

// Bagian Gambar
class ImageSection extends StatelessWidget {
  const ImageSection({super.key, required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.asset(
          image,
          width: double.infinity,
          height: 250,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
