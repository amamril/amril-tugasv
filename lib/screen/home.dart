import 'package:flutter/material.dart';

import '../models/our_people.dart';
import 'detailEmp.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Staff> staffList = [
      Staff(
        name: 'Amril',
        position: 'Project Manager',
        bio: 'Project Manager at Google',
      ),
      Staff(
        name: 'Budi',
        position: 'Backend Engineer',
        bio: 'Backend Engineer at Google',
      ),
      Staff(
        name: 'Citra',
        position: 'Frontend Engineer',
        bio: 'Frontend Engineer at Google',
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Section
            Stack(
              children: [
                // Building Image
                Container(
                  height: 300,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://images.unsplash.com/photo-1486406146926-c627a92ad1ab?q=80&w=2070&auto=format&fit=crop',
                      ), // Office building
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Light overlay to make text more readable
                Container(
                  height: 300,
                  width: double.infinity,
                  color: Colors.white.withValues(alpha: 0.3),
                ),

                // Header Title & Subtitle
                Positioned(
                  bottom: 30,
                  left: 30,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'MEET OUR INCREDIBLE',
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          letterSpacing: 1.2,
                        ),
                      ),
                      const Text(
                        'PEOPLE',
                        style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.w900,
                          fontSize: 42,
                          letterSpacing: 1.5,
                        ),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.55,
                        child: const Text(
                          'We are a team of dedicated professionals committed to excellence. Discover the amazing individuals who drive our success.',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 10,
                            height: 1.5,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 40),

            // Our People Title
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'OUR TEAM',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 16,
                  color: Color(0xFF1E88E5),
                  letterSpacing: 1.5,
                ),
              ),
            ),
            Container(
              height: 2,
              width: 100,
              color: const Color(0xFF1E88E5),
              margin: const EdgeInsets.only(bottom: 24),
            ),

            // Our People Cards Layout
            // Wrapping in SingleChildScrollView to allow horizontal scrolling on smaller screens
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  // If screen is wide enough, show as row, else wrap
                  bool isWide = constraints.maxWidth > 600;

                  List<Widget> cards = staffList.map((item) {
                    return _StaffCard(
                      staff: item,
                      width: isWide
                          ? (constraints.maxWidth - 40) / 3
                          : constraints.maxWidth,
                      margin: EdgeInsets.only(
                        bottom: isWide ? 0 : 20,
                        right: isWide && item != staffList.last ? 16 : 0,
                      ),
                    );
                  }).toList();

                  return isWide
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: cards,
                        )
                      : Column(children: cards);
                },
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

class _StaffCard extends StatefulWidget {
  final Staff staff;
  final double width;
  final EdgeInsets margin;

  const _StaffCard({
    required this.staff,
    required this.width,
    required this.margin,
  });

  @override
  State<_StaffCard> createState() => _StaffCardState();
}

class _StaffCardState extends State<_StaffCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      margin: widget.margin,
      child: MouseRegion(
        onEnter: (_) => setState(() => isHovered = true),
        onExit: (_) => setState(() => isHovered = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: const Color(0xFFF0F0F0),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isHovered
                  ? const Color(0xFF1E88E5)
                  : const Color.fromARGB(255, 202, 194, 194),
              width: 2,
            ),
            boxShadow: isHovered
                ? [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ]
                : [],
          ),
          child: Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(20),
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailEmp(
                      staff: widget.staff,
                      themeColor: const Color(0xFF1E88E5),
                    ),
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 24.0),
                    child: Icon(
                      Icons.person,
                      size: 48,
                      color: Color(0xFF1E88E5),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    color: const Color(0xFFE0E0E0),
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 8,
                    ),
                    child: Text(
                      widget.staff.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Text(
                          widget.staff.position,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.black54,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          widget.staff.bio,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 10,
                            color: Colors.grey,
                            height: 1.5,
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
      ),
    );
  }
}
