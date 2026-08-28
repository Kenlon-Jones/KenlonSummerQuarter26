import 'package:flutter/material.dart';
import 'home.dart';
import 'workout.dart';
import 'account.dart';

class CalendarPage extends StatelessWidget {
  final String userName;
  final String email;

  const CalendarPage({
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
        currentIndex: 3,

        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,

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
              // Already on Calendar
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
                "Calendar",
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 30),

              // Month Selector
              const Row(
                mainAxisAlignment:
                    MainAxisAlignment.center,

                children: [

                  Icon(Icons.chevron_left),

                  SizedBox(width: 30),

                  Text(
                    "July 2026",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  SizedBox(width: 30),

                  Icon(Icons.chevron_right),
                ],
              ),

              const SizedBox(height: 25),

              // Days of Week
              const Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,

                children: [

                  Text("Sun",
                      style: TextStyle(
                          fontWeight: FontWeight.bold)),

                  Text("Mon",
                      style: TextStyle(
                          fontWeight: FontWeight.bold)),

                  Text("Tue",
                      style: TextStyle(
                          fontWeight: FontWeight.bold)),

                  Text("Wed",
                      style: TextStyle(
                          fontWeight: FontWeight.bold)),

                  Text("Thu",
                      style: TextStyle(
                          fontWeight: FontWeight.bold)),

                  Text("Fri",
                      style: TextStyle(
                          fontWeight: FontWeight.bold)),

                  Text("Sat",
                      style: TextStyle(
                          fontWeight: FontWeight.bold)),
                ],
              ),

              const SizedBox(height: 20),

              // ========= First Week =========
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,

                children: [

                  buildGreyDay("28"),

                  buildGreyDay("29"),

                  buildGreyDay("30"),

                  buildSelectedDay("1"),

                  buildDotDay("2", false),

                  buildDotDay("3", true),

                  buildDotDay("4", false),
                ],
              ),

              const SizedBox(height: 22),

              // ========= Second Week =========
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,

                children: [

                  buildDotDay("5", false),

                  buildDotDay("6", true),

                  buildDotDay("7", false),

                  buildDotDay("8", true),

                  buildDotDay("9", false),

                  buildDotDay("10", true),

                  buildDotDay("11", true),
                ],
              ),

              const SizedBox(height: 22),

              // ========= Third Week =========
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,

                children: [

                  buildDotDay("12", false),

                  buildDotDay("13", true),

                  buildDotDay("14", true),

                  buildDotDay("15", false),

                  buildDotDay("16", true),

                  buildDotDay("17", false),

                  buildDotDay("18", true),
                ],
              ),

              const SizedBox(height: 22),

              // ========= Fourth Week =========
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: [

                  buildDotDay("19", true),

                  buildDotDay("20", false),

                  buildDotDay("21", false),

                  buildDotDay("22", true),

                  buildDotDay("23", true),

                  buildDotDay("24", false),

                  buildDotDay("25", false),
                ],
              ),

              const SizedBox(height: 22),

              // ========= Fifth Week =========
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: [

                  buildDotDay("26", false),

                  buildDotDay("27", true),

                  buildDotDay("28", false),

                  buildDotDay("29", true),

                  buildDotDay("30", false),

                  buildDotDay("31", true),

                  buildGreyDay("1"),
                ],
              ),

              const SizedBox(height: 40),

              // Selected Date Heading
              const Text(
                "Wednesday, July 1",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              // Strength Training Workout
              buildWorkoutTile(
                icon: Icons.fitness_center,
                title: "Strength Training",
                time: "6:30 AM",
                duration: "45 min",
              ),

              const SizedBox(height: 15),

              // Cardio Workout
              buildWorkoutTile(
                icon: Icons.directions_run,
                title: "Cardio",
                time: "12:00 PM",
                duration: "30 min",
              ),

              const SizedBox(height: 15),

              // Yoga Workout
              buildWorkoutTile(
                icon: Icons.self_improvement,
                title: "Yoga",
                time: "6:00 PM",
                duration: "20 min",
              ),

              const SizedBox(height: 25),

            ],
          ),
        ),
      ),
    );
  }

  //=========================================
  // Workout Schedule Card
  //=========================================
  Widget buildWorkoutTile({
    required IconData icon,
    required String title,
    required String time,
    required String duration,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: const Color(0xFFF8F6FB),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: Colors.grey.shade300,
        ),
      ),

      child: Row(
        children: [

          // Workout Icon
          CircleAvatar(
            radius: 28,
            backgroundColor: Colors.white,

            child: Icon(
              icon,
              size: 30,
              color: Colors.black,
            ),
          ),

          const SizedBox(width: 16),

          // Workout Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  "$time • $duration",
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),

          // Arrow
          const Icon(
            Icons.chevron_right,
            size: 34,
          ),
        ],
      ),
    );
  }

  //=========================================
  // Grey Calendar Day
  //=========================================
  Widget buildGreyDay(String day) {
    return SizedBox(
      width: 36,
      child: Center(
        child: Text(
          day,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  //=========================================
  // Calendar Day with Optional Dot
  //=========================================
  Widget buildDotDay(
    String day,
    bool hasWorkout,
  ) {
    return SizedBox(
      width: 36,
      child: Column(
        children: [

          Text(
            day,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),

          const SizedBox(height: 4),

          hasWorkout
              ? Container(
                  width: 6,
                  height: 6,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                )
              : const SizedBox(
                  width: 6,
                  height: 6,
                ),
        ],
      ),
    );
  }

  //=========================================
  // Selected Calendar Day
  //=========================================
  Widget buildSelectedDay(String day) {
    return CircleAvatar(
      radius: 22,
      backgroundColor: Colors.black,

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Text(
            day,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 2),

          Container(
            width: 6,
            height: 6,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
        ],
      ),
    );
  }
}