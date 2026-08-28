import 'package:flutter/material.dart';
import 'home.dart';
import 'workout.dart';
import 'calendar.dart';
import 'login.dart';


class AccountPage extends StatelessWidget {
  final String userName;
  final String email;

  const AccountPage({
    super.key,
    required this.userName,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,

        onTap: (index) {
          switch (index) {
            case 0:
              // Already on Account
              break;

            case 1:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => HomePage(
                    userName: userName,
                    email: email,
                  ),
                ),
              );
              break;

            case 2:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => WorkoutPage(
                    userName: userName,
                    email: email,
                  ),
                ),
              );
              break;

            case 3:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => CalendarPage(
                    userName: userName,
                    email: email,
                  ),
                ),
              );
              break;
          }
        },

        items: const [

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: "",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: "",
          ),
        ],
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // Page Title
              const Text(
                "Account",
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 5),

              // Subtitle
              const Text(
                "Manage your profile and preferences",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 30),

              // ==========================
              // Profile Card
              // ==========================

              Container(
                padding: const EdgeInsets.all(15),

                decoration: BoxDecoration(
                  color: const Color(0xFFF8F6FB),

                  borderRadius: BorderRadius.circular(22),

                  border: Border.all(
                    color: Colors.grey.shade300,
                  ),
                ),

                child: Row(
                  children: [

                    // User Profile Picture
                    CircleAvatar(
                      radius: 40,

                      backgroundImage: const AssetImage(
                        "assets/Kenlon.jpg",
                      ),

                      backgroundColor: Colors.grey.shade300,
                    ),

                    const SizedBox(width: 18),

                    // User Information
                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,

                        children: [

                          Text(
                            userName,
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 3),

                          Text(
                            email,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 16,
                            ),
                          ),

                          const SizedBox(height: 10),

                          // Active Member Badge
                          Container(
                            padding:
                                const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),

                            decoration: BoxDecoration(
                              color: const Color(0xFFEDE2FF),
                              borderRadius:
                                  BorderRadius.circular(20),
                            ),

                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [

                                Icon(
                                  Icons.workspace_premium,
                                  color: Colors.deepPurple,
                                  size: 20,
                                ),

                                SizedBox(width: 6),

                                Text(
                                  "Active Member",
                                  style: TextStyle(
                                    color: Colors.deepPurple,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Arrow Icon
                    const Icon(
                      Icons.chevron_right,
                      size: 35,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

                            // Personal Information
              buildSettingTile(
                icon: Icons.person_outline,
                title: "Personal Information",
                subtitle: "Update your personal details",
                onTap: (){
                  
                },
              ),

              // Fitness Goals
              buildSettingTile(
                icon: Icons.track_changes,
                title: "Fitness Goals",
                subtitle: "View and edit your goals",
                onTap: () {
                  
                },
              ),

              // Progress
              buildSettingTile(
                icon: Icons.bar_chart,
                title: "Progress",
                subtitle: "View your stats and history",
                onTap: () {
                  
                },
              ),

              // Health Data
              buildSettingTile(
                icon: Icons.favorite_border,
                title: "Health Data",
                subtitle: "Connect and manage data",
                onTap: () {
                  
                },
              ),

              // Privacy & Security
              buildSettingTile(
                icon: Icons.security,
                title: "Privacy & Security",
                subtitle: "Manage your privacy settings",
                onTap: () {
                  
                },
              ),

              // Help & Support
              buildSettingTile(
                icon: Icons.help_outline,
                title: "Help & Support",
                subtitle: "Get help and contact support",
                onTap: () {
                  
                },
              ),

              const SizedBox(height: 30),

                            // Logout Button
              SizedBox(
                width: double.infinity,
                height: 60,

                child: OutlinedButton.icon(
                  onPressed: () {

                    // Return to the Login Page
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>  const LoginPage(),
                      ),
                      (route) => false,
                    );
                  },

                  icon: const Icon(
                    Icons.logout,
                    color: Colors.red,
                  ),

                  label: const Text(
                    "Log Out",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: Colors.grey.shade300,
                    ),

                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

            ],
          ),
        ),
      ),
    );
  }

  //=========================================
  // Reusable Settings Tile
  //=========================================
  Widget buildSettingTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 3),

      decoration: BoxDecoration(
        color: const Color(0xFFF8F6FB),

        border: Border.all(
          color: Colors.grey.shade300,
        ),
      ),

      child: ListTile(
        onTap: onTap,

        contentPadding:
            const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),

        leading: Icon(
          icon,
          size: 36,
          color: Colors.black,
        ),

        title: Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),

        subtitle: Text(
          subtitle,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 15,
          ),
        ),

        trailing: const Icon(
          Icons.chevron_right,
          size: 34,
        ),
      ),
    );
  }
}