import 'package:flutter/material.dart';
import 'package:hiremi_version_two/API_Integration/Internship/Apiservices.dart';
import 'package:hiremi_version_two/Custom_Widget/OppurtunityCard.dart';
import 'package:hiremi_version_two/Notofication_screen.dart';
import 'package:hiremi_version_two/Utils/AppSizes.dart';
import 'package:hiremi_version_two/Utils/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InternshipsScreen extends StatefulWidget {
  const InternshipsScreen({super.key, required this.isVerified});
  final bool isVerified;

  @override
  State<InternshipsScreen> createState() => _InternshipsScreenState();
}

class _InternshipsScreenState extends State<InternshipsScreen> {
  late Future<List<dynamic>> futureJobs;
  late Future<List<dynamic>> futureApplications;
  int? userId;

  @override
  void initState() {
    super.initState();
    _retrieveId();
    futureJobs = _fetchJobs();
    futureApplications = _fetchApplications();
  }

  Future<void> _retrieveId() async {
    final prefs = await SharedPreferences.getInstance();
    final int? savedId = prefs.getInt('userId');
    if (savedId != null) {
      setState(() {
        userId = savedId;
      });
      print("Retrieved id is $savedId");
    } else {
      print("No id found in SharedPreferences");
    }
  }

  Future<List<dynamic>> _fetchJobs() async {
    final apiService = ApiService('http://13.127.81.177:8000/api/internship/');
    final jobs = await apiService.fetchData();
    return jobs;
  }

  Future<List<dynamic>> _fetchApplications() async {
    final apiService = ApiService('http://13.127.81.177:8000/api/internship-applications/');
    return await apiService.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Internships',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding:
                EdgeInsets.only(right: Sizes.responsiveDefaultSpace(context)),
            child: Container(
              height: 40,
              width: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.bgBlue,
                ),
                child: Center(
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) => const NotificationScreen(),
                      ));
                    },
                    icon: const Icon(Icons.notifications_outlined, size: 24,),
                  ),
                )),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: screenWidth * 0.95, // 95% of screen width
            height: screenHeight * 0.1, // 10% of screen height
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFFFF6E01), Color(0xFFFEBC0D)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: screenWidth * 0.04, // 4% of screen width
                ),
                Container(
                  width: screenWidth * 0.08, // 8% of screen width
                  height: screenWidth * 0.08, // 8% of screen width
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Icon(
                    Icons.spa,
                    size: screenWidth * 0.04, // 4% of screen width
                    color: Colors.orange,
                  ),
                ),
                SizedBox(
                  width: screenWidth * 0.02, // 2% of screen width
                ),
                Text(
                  'Internships',
                  style: TextStyle(
                    fontSize: screenWidth * 0.045, // 4.5% of screen width
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
                Container(
                  width: screenWidth * 0.23, // 23% of screen width
                  height: screenWidth * 0.23, // 23% of screen width
                  decoration: BoxDecoration(
                    color: Colors.orange[50],
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.spa,
                    color: Colors.orange,
                    size: screenWidth * 0.1, // 10% of screen width
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: screenHeight * 0.03, // 3% of screen height
          ),
          Padding(
            padding: EdgeInsets.only(left: screenWidth * 0.04),
            child: const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Available Internships',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          SizedBox(
            height: screenHeight * 0.00, // 3% of screen height
          ),
          Expanded(
            child: FutureBuilder<List<dynamic>>(
              future: Future.wait([futureJobs, futureApplications]),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(
                    child: Column(
                      children: [
                        Image.asset('images/Team work-bro.png'),
                        SizedBox(
                          height: screenHeight * 0.01,
                        ),
                        const Text(
                          'Hiremi’s Recruiters are planning for new internships',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16.0),
                          textAlign: TextAlign.center,
                        ),
                        const Text(
                          'and roles, please wait for few days',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16.0),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                } else {
                  final jobs = snapshot.data![0] as List<dynamic>;
                  final applications = snapshot.data![1] as List<dynamic>;

                  // Check which jobs the user has already applied for
                  final appliedJobs = applications
                      .where((application) => application['register'] == userId)
                      .map((application) => application['experiencejob'])
                      .toSet();
                  return SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(
                          screenWidth * 0.04), // 4% of screen width
                      child: Column(
                        children: jobs.map((job) {
                          bool isApplied = appliedJobs.contains(job['id']);
                          return Padding(
                            padding:
                                EdgeInsets.only(bottom: screenHeight * 0.02),
                            child: OpportunityCard(
                              dp: Image.asset(
                                  'images/icons/logo1.png'), // Placeholder image
                              profile: job['profile'] ?? 'N/A',
                              companyName: job['company_name'] ?? 'N/A',
                              location: job['location'] ?? 'N/A',
                              // eligible: job['eligibility'] ?? 'N/A',
                              stipend: job['Stipend']?.toString() ?? 'N/A',
                              mode:
                                  'Remote', // Replace with actual data if available
                              type:
                                  'Internship', // Replace with actual data if available
                              exp: 1, // Replace with actual data if available
                              daysPosted:
                                  0, // Replace with actual data if available
                              ctc: job['Stipend']?.toString() ??
                                  '0', // Example, replace with actual field
                              description: job['description'] ??
                                  'No description available',
                              education: job['education'],
                              skillsRequired: job['skills_required'],
                              whoCanApply: job['who_can_apply'], id: job['id'],

                              //here
                              isApplied: isApplied,
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
