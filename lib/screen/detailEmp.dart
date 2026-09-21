import 'package:flutter/material.dart';
import 'package:amril_m5/models/our_people.dart';

class DetailEmp extends StatelessWidget {
  final Staff staff;
  final Color themeColor;

  const DetailEmp({super.key, required this.staff, required this.themeColor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black87),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Image similar to home.dart (corporate aesthetic)
            Stack(
              children: [
                Container(
                  height: 150,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          'https://images.unsplash.com/photo-1497366216548-37526070297c?q=80&w=2069&auto=format&fit=crop'), // Corporate office interior
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Overlay
                Container(
                  height: 150,
                  width: double.infinity,
                  color: Colors.black.withValues(alpha: 0.5),
                ),
                const Positioned(
                  bottom: 20,
                  left: 30,
                  child: Text(
                    'EMPLOYEE PROFILE',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 24,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 40),

            // Profile Info using Flyer Aesthetics
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                width: double.infinity,
                color: const Color(0xFFF0F0F0),
                child: Column(
                  children: [
                    // Top grey block with icon
                    Container(
                      width: double.infinity,
                      color: const Color(0xFFE0E0E0),
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: const Icon(
                        Icons.person,
                        size: 100,
                        color: Color(0xFF1E88E5), // Matches home.dart accent
                      ),
                    ),
                    
                    // Detail Content
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        children: [
                          Text(
                            staff.name,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 32,
                              color: Colors.black87,
                              letterSpacing: 1,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            staff.position.toUpperCase(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1E88E5),
                              letterSpacing: 1.5,
                            ),
                          ),
                          
                          const SizedBox(height: 32),
                          
                          // Bio Section styled like About Us
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'ABOUT',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        color: Color(0xFF1E88E5),
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    Text(
                                      staff.bio,
                                      style: const TextStyle(
                                        fontSize: 11,
                                        color: Colors.grey,
                                        height: 1.5,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}
