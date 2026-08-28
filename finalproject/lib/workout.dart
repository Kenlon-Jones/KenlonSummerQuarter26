import 'package:flutter/material.dart';
import 'home.dart';
import 'account.dart';
import 'calendar.dart';

class WorkoutPage extends StatelessWidget {
  final String userName;
  final String email;

  const WorkoutPage({
    super.key,
    this.userName = 'User',
    this.email = '',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 2,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => AccountPage(
                    userName: userName,
                    email: email,
                  ),
                ),
              );
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
            icon: Icon(
              Icons.fitness_center,
              size: 34,
            ),
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
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Workouts",
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              const SizedBox(height: 5),

              const Text(
                "Track, plan and achieve your goals.",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 18,
                ),
              ),

              const SizedBox(height: 25),

              // Horizontal Category List
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  children: [
                    buildCategoryChip("All Workouts", isSelected: true),
                    const SizedBox(width: 8),
                    buildCategoryChip("Strength"),
                    const SizedBox(width: 8),
                    buildCategoryChip("Cycling"),
                    const SizedBox(width: 8),
                    buildCategoryChip("Yoga"),
                  ],
                ),
              ),

              const SizedBox(height: 35),

              const Text(
                "Today's Workout",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              const SizedBox(height: 15),

              // Today's Featured Card
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 35,
                      backgroundColor: Color(0xFFE6DDF7),
                      child: Icon(
                        Icons.directions_run,
                        size: 40,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(width: 15),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Morning Run",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "35 min | 320 kcal",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFE6DDF7),
                        foregroundColor: Colors.black,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text("Start"),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 35),

              const Text(
                "Quick Start",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              const SizedBox(height: 18),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                child: Row(
                  children: [
                    buildQuickWorkout(Icons.directions_run, "Outdoor Run"),
                    buildQuickWorkout(Icons.fitness_center, "Strength"),
                    buildQuickWorkout(Icons.directions_bike, "Cycling"),
                    buildQuickWorkout(Icons.self_improvement, "Yoga"),
                  ],
                ),
              ),

              const SizedBox(height: 35),

              const Text(
                "Popular Workouts",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              const SizedBox(height: 18),

              buildWorkoutCard(
                imagePath: "assets/man.avif",
                title: "Full Body Strength",
                subtitle: "45 min | Intermediate",
                calories: "450 kcal",
              ),

              const SizedBox(height: 15),

              buildWorkoutCard(
                imagePath: "assets/yoga.avif",
                title: "Yoga Flow",
                subtitle: "30 min | Beginner",
                calories: "200 kcal",
              ),

              const SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCategoryChip(String label, {bool isSelected = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF6E657E) : const Color(0xFFE6DDF7),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
        ),
      ),
    );
  }

  Widget buildQuickWorkout(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Container(
        width: 100,
        height: 110,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 26,
              backgroundColor: const Color(0xFFF0EBF9),
              child: Icon(icon, size: 30, color: Colors.black),
            ),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildWorkoutCard({
    required String imagePath,
    required String title,
    required String subtitle,
    required String calories,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              imagePath,
              width: 100,
              height: 70,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 100,
                  height: 70,
                  color: const Color(0xFFE6DDF7),
                  child: const Icon(
                    Icons.fitness_center,
                    color: Colors.black54,
                    size: 32,
                  ),
                );
              },
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
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(color: Colors.grey, fontSize: 14),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Text("🔥", style: TextStyle(fontSize: 14)),
                    const SizedBox(width: 4),
                    Text(
                      calories,
                      style: const TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, size: 30, color: Colors.grey),
        ],
      ),
    );
  }
}