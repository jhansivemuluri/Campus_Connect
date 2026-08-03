import 'package:flutter/material.dart';

import '../widgets/app_widgets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Profile",
          style: TextStyle(
            fontWeight: FontWeight.w800,
          ),
        ),
      ),

      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isWide = constraints.maxWidth >= 850;

            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: isWide ? 45 : 18,
                vertical: 15,
              ),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    maxWidth: 1100,
                  ),
                  child: Column(
                    children: [
                      _buildProfileHeader(),

                      const SizedBox(height: 22),

                      _buildAboutMe(),

                      const SizedBox(height: 18),

                      if (isWide)
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: _buildEducation(),
                            ),
                            const SizedBox(width: 18),
                            Expanded(
                              child: _buildSkills(),
                            ),
                          ],
                        )
                      else
                        Column(
                          children: [
                            _buildEducation(),
                            const SizedBox(height: 18),
                            _buildSkills(),
                          ],
                        ),

                      const SizedBox(height: 18),

                      _buildProjects(),

                      const SizedBox(height: 18),

                      _buildContact(),

                      const SizedBox(height: 25),

                      _buildThankYou(),

                      const SizedBox(height: 25),
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

  // ----------------------------------------------------------
  // PROFILE HEADER
  // ----------------------------------------------------------

  Widget _buildProfileHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF5B21B6),
            Color(0xFF7C3AED),
            Color(0xFF9333EA),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF7C3AED).withValues(alpha: 0.25),
            blurRadius: 25,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isSmall = constraints.maxWidth < 550;

          Widget photo = Container(
            width: 125,
            height: 125,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: 4,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.20),
                  blurRadius: 18,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: const CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: AssetImage(
                "assets/jhansi.jpeg",
              ),
            ),
          );

          Widget information = Column(
            crossAxisAlignment:
                isSmall
                    ? CrossAxisAlignment.center
                    : CrossAxisAlignment.start,
            children: [
              const Text(
                "Hello, I'm",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 4),

              const Text(
                "Jhansi Vemuluri",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                "AI & ML Student | Flutter Developer",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 15),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Text(
                  "B.Tech • Artificial Intelligence & Machine Learning",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          );

          if (isSmall) {
            return Column(
              children: [
                photo,
                const SizedBox(height: 20),
                information,
              ],
            );
          }

          return Row(
            children: [
              photo,
              const SizedBox(width: 25),
              Expanded(
                child: information,
              ),
            ],
          );
        },
      ),
    );
  }

  // ----------------------------------------------------------
  // ABOUT ME
  // ----------------------------------------------------------

  Widget _buildAboutMe() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitle(
              title: "👤 Profile",
              subtitle: "A little about me",
            ),

            Text(
              "Welcome to my personal portfolio application.",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade700,
              ),
            ),

            const SizedBox(height: 22),

            const SectionTitle(
              title: "📝 About Me",
              subtitle: "Who I am and what I enjoy",
            ),

            Text(
              "Hello! I am Jhansi Vemuluri pursuing B.Tech in "
              "Artificial Intelligence & Machine Learning. I enjoy "
              "Flutter App Development, AI, Web Development and "
              "continuously learning new technologies.",
              style: TextStyle(
                fontSize: 15,
                height: 1.6,
                color: Colors.grey.shade700,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ----------------------------------------------------------
  // EDUCATION
  // ----------------------------------------------------------

  Widget _buildEducation() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitle(
              title: "🎓 Education",
              subtitle: "Academic background",
            ),

            Container(
              padding: const EdgeInsets.all(17),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F3FF),
                borderRadius: BorderRadius.circular(18),
              ),
              child: const Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Color(0xFFE9D5FF),
                    child: Icon(
                      Icons.school_rounded,
                      color: Color(0xFF7C3AED),
                    ),
                  ),

                  SizedBox(width: 15),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "B.Tech - AI & ML",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Currently Pursuing",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey,
                          ),
                        ),
                      ],
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

  // ----------------------------------------------------------
  // SKILLS
  // ----------------------------------------------------------

  Widget _buildSkills() {
    final skills = [
      "Flutter",
      "JavaScript",
      "HTML",
      "CSS",
      "Java",
      "Python",
      "C",
      "AI & ML",
      "MongoDB",
      "GitHub",
    ];

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitle(
              title: "💻 Skills",
              subtitle: "Technologies I work with",
            ),

            Wrap(
              spacing: 9,
              runSpacing: 9,
              children: skills.map((skill) {
                return Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 13,
                    vertical: 9,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF3E8FF),
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: const Color(0xFFE9D5FF),
                    ),
                  ),
                  child: Text(
                    skill,
                    style: const TextStyle(
                      color: Color(0xFF6B21A8),
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  // ----------------------------------------------------------
  // PROJECTS
  // ----------------------------------------------------------

  Widget _buildProjects() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitle(
              title: "🚀 Projects",
              subtitle: "Things I have worked on",
            ),

            _projectTile(
              icon: Icons.smart_toy_rounded,
              title: "AI Chatbot",
              subtitle: "Flutter + AI Project",
            ),

            const SizedBox(height: 12),

            _projectTile(
              icon: Icons.phone_android_rounded,
              title: "Portfolio App",
              subtitle: "Personal Flutter Portfolio",
            ),
          ],
        ),
      ),
    );
  }

  Widget _projectTile({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Container(
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F7FF),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: const Color(0xFFEDE9FE),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(
              icon,
              color: const Color(0xFF7C3AED),
            ),
          ),

          const SizedBox(width: 15),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),

          const Icon(
            Icons.arrow_forward_ios_rounded,
            size: 16,
            color: Color(0xFF7C3AED),
          ),
        ],
      ),
    );
  }

  // ----------------------------------------------------------
  // CONTACT
  // ----------------------------------------------------------

  Widget _buildContact() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitle(
              title: "📞 Contact",
              subtitle: "Let's connect",
            ),

            _contactTile(
              Icons.email_rounded,
              "Email",
              "jhansi@example.com",
            ),

            const SizedBox(height: 12),

            _contactTile(
              Icons.phone_rounded,
              "Phone",
              "+91 9876543210",
            ),
          ],
        ),
      ),
    );
  }

  Widget _contactTile(
    IconData icon,
    String title,
    String value,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F7FF),
        borderRadius: BorderRadius.circular(17),
      ),
      child: Row(
        children: [
          Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              color: const Color(0xFFEDE9FE),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(
              icon,
              color: const Color(0xFF7C3AED),
            ),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ----------------------------------------------------------
  // THANK YOU
  // ----------------------------------------------------------

  Widget _buildThankYou() {
    return Column(
      children: [
        const Icon(
          Icons.favorite_rounded,
          color: Color(0xFF7C3AED),
          size: 30,
        ),

        const SizedBox(height: 8),

        const Text(
          "Thank You for Visiting!",
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w800,
          ),
        ),

        const SizedBox(height: 5),

        Text(
          "Keep learning. Keep building. Keep growing.",
          style: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}
