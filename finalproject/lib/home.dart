import 'package:flutter/material.dart';
import 'account.dart';
import 'calendar.dart';
import 'workout.dart';

class HomePage extends StatelessWidget {
  // Stores the user's name passed from the Login or Sign Up page.
  final String userName;
  final String email;

  const HomePage({
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
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        currentIndex: 1,
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
            // Already on Home
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
        BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.home, size: 35), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.fitness_center), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: ""),
      ],
    ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Greeting
              Text(
                "Good Afternoon, $userName 🔥",
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                "Let's Get Active",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              const Divider(thickness: 3, color: Color(0xFF27233F)),

              const SizedBox(height: 20),

              // Progress Circle
              const Center(
                child: SizedBox(
                  width: 180,
                  height: 180,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: 180,
                        height: 180,
                        child: CircularProgressIndicator(
                          value: 0.735,
                          strokeWidth: 16,
                          backgroundColor: Color(0xFFD1C4E9),
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.deepPurple,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              const Center(
                child: Text(
                  "7,350 Steps",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                ),
              ),

              const Center(
                child: Text(
                  "Goal: 10,000 Steps",
                  style: TextStyle(fontSize: 20),
                ),
              ),

              const SizedBox(height: 25),

              const Divider(thickness: 3, color: Color(0xFF27233F)),

              // Daily Statistics
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text("Calories", style: TextStyle(fontSize: 18)),
                      Text(
                        "450 kcal",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text("Distance", style: TextStyle(fontSize: 18)),
                      Text(
                        "3.8 mi",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text("Active", style: TextStyle(fontSize: 18)),
                      Text(
                        "65 min",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const Divider(thickness: 3, color: Color(0xFF27233F)),

              const SizedBox(height: 10),

              // Today's Workout
              const Text(
                "Today's Workout",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 15),

              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("🏃 Morning Run", style: TextStyle(fontSize: 18)),
                    SizedBox(height: 8),
                    Text(
                      "35 mins | 320 calories",
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              const Divider(thickness: 3, color: Color(0xFF27233F)),

              const SizedBox(height: 10),

              // Recommended Challenge
              const Text(
                "Recommended Challenge",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 15),

              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "🚶 Walk 2,500 more steps",
                  style: TextStyle(fontSize: 18),
                ),
              ),

              const SizedBox(height: 30),

              const Divider(thickness: 3, color: Color(0xFF27233F)),
            ],
          ),
        ),
      ),
    );
  }
}
