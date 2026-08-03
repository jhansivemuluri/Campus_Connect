import 'package:flutter/material.dart';

import '../widgets/app_widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(
              Icons.school_rounded,
              color: Color(0xFF5B5FEF),
            ),
            SizedBox(width: 10),
            Text(
              "Campus Connect",
              style: TextStyle(
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            tooltip: "Profile",
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/profile',
                arguments: {
                  'name': 'Campus Connect Student',
                  'branch': 'Artificial Intelligence & Machine Learning',
                },
              );
            },
            icon: const ProfileAvatar(size: 38),
          ),
          const SizedBox(width: 10),
        ],
      ),

      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isDesktop = constraints.maxWidth >= 900;

            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: isDesktop ? 50 : 20,
                vertical: 15,
              ),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 1200,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildWelcomeBanner(context),

                      const SizedBox(height: 28),

                      const SectionTitle(
                        title: "Quick Access",
                        subtitle:
                            "Explore the learning and campus features",
                      ),

                      LayoutBuilder(
                        builder: (context, constraints) {
                          int columns;

                          if (constraints.maxWidth >= 900) {
                            columns = 3;
                          } else if (constraints.maxWidth >= 600) {
                            columns = 2;
                          } else {
                            columns = 1;
                          }

                          return GridView.count(
                            crossAxisCount: columns,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                            childAspectRatio: columns == 1 ? 2.0 : 1.15,
                            children: [
                              FeatureCard(
                                title: "Widgets & Layouts",
                                description:
                                    "Explore Text, Image, Container, Row, Column and Stack.",
                                icon: Icons.widgets_rounded,
                                iconColor: const Color(0xFF5B5FEF),
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    '/widgets',
                                  );
                                },
                              ),

                              FeatureCard(
                                title: "Responsive UI",
                                description:
                                    "See how the interface adapts to different screen sizes.",
                                icon: Icons.devices_rounded,
                                iconColor: const Color(0xFF0EA5E9),
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    '/responsive',
                                  );
                                },
                              ),

                              FeatureCard(
                                title: "My Profile",
                                description:
                                    "View your student information and achievements.",
                                icon: Icons.person_rounded,
                                iconColor: const Color(0xFF8B5CF6),
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    '/profile',
                                    arguments: {
                                      'name': 'Campus Connect Student',
                                      'branch':
                                          'Artificial Intelligence & Machine Learning',
                                    },
                                  );
                                },
                              ),
                            ],
                          );
                        },
                      ),

                      const SizedBox(height: 30),

                      const SectionTitle(
                        title: "Your Dashboard",
                        subtitle: "A quick overview of your campus profile",
                      ),

                      LayoutBuilder(
                        builder: (context, constraints) {
                          if (constraints.maxWidth >= 650) {
                            return const Row(
                              children: [
                                Expanded(
                                  child: StatCard(
                                    value: "4",
                                    label: "Experiments",
                                    icon: Icons.science_rounded,
                                  ),
                                ),
                                SizedBox(width: 14),
                                Expanded(
                                  child: StatCard(
                                    value: "3",
                                    label: "Learning Modules",
                                    icon: Icons.menu_book_rounded,
                                  ),
                                ),
                                SizedBox(width: 14),
                                Expanded(
                                  child: StatCard(
                                    value: "100%",
                                    label: "Progress",
                                    icon: Icons.trending_up_rounded,
                                  ),
                                ),
                              ],
                            );
                          }

                          return const Column(
                            children: [
                              StatCard(
                                value: "4",
                                label: "Experiments",
                                icon: Icons.science_rounded,
                              ),
                              StatCard(
                                value: "3",
                                label: "Learning Modules",
                                icon: Icons.menu_book_rounded,
                              ),
                              StatCard(
                                value: "100%",
                                label: "Progress",
                                icon: Icons.trending_up_rounded,
                              ),
                            ],
                          );
                        },
                      ),

                      const SizedBox(height: 30),

                      _buildAboutCard(),

                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildWelcomeBanner(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF5B5FEF),
            Color(0xFF7C3AED),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF5B5FEF).withValues(alpha: 0.20),
            blurRadius: 25,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final compact = constraints.maxWidth < 500;

          final content = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 7,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.16),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Text(
                  "🎓  STUDENT DASHBOARD",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.8,
                  ),
                ),
              ),

              const SizedBox(height: 18),

              const Text(
                "Welcome to\nCampus Connect",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  height: 1.1,
                  fontWeight: FontWeight.w900,
                ),
              ),

              const SizedBox(height: 12),

              Text(
                "Learn, explore and connect through a modern Flutter experience.",
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.85),
                  fontSize: 14,
                  height: 1.5,
                ),
              ),

              const SizedBox(height: 20),

              FilledButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/widgets');
                },
                style: FilledButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: const Color(0xFF5B5FEF),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 13,
                  ),
                ),
                icon: const Icon(Icons.explore_rounded),
                label: const Text(
                  "Start Exploring",
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ],
          );

          if (compact) {
            return content;
          }

          return Row(
            children: [
              Expanded(child: content),
              const SizedBox(width: 20),
              const Icon(
                Icons.school_rounded,
                size: 125,
                color: Colors.white24,
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildAboutCard() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: Row(
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: const Color(0xFF5B5FEF).withValues(alpha: 0.10),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Icon(
                Icons.info_outline_rounded,
                color: Color(0xFF5B5FEF),
              ),
            ),

            const SizedBox(width: 16),

            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "About this project",
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Campus Connect demonstrates Flutter widgets, layouts, responsive design and navigation.",
                    style: TextStyle(
                      fontSize: 13,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}