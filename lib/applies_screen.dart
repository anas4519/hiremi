import 'package:flutter/material.dart';
import 'package:hiremi_version_two/API_Integration/fresherJobs/apiServices.dart';
import 'package:hiremi_version_two/Custom_Widget/applied_card.dart';
import 'package:hiremi_version_two/InternshipScreen.dart';
import 'package:hiremi_version_two/experienced_jobs.dart';
import 'package:hiremi_version_two/fresherJobs.dart';

class AppliesScreen extends StatefulWidget {
  const AppliesScreen({super.key});

  @override
  State<AppliesScreen> createState() => _AppliesScreenState();
}

int applies = 0;

class _AppliesScreenState extends State<AppliesScreen> {
  late Future<List<dynamic>> appliedJobs;
  @override
  void initState() {
    super.initState();
    final apiService = ApiService('');
    appliedJobs = apiService.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: applies > 0
          ? Padding(
              padding: EdgeInsets.all(screenWidth * 0.04),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'You\'ve Applied ($applies)',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  Expanded(
                    child: FutureBuilder<List<dynamic>>(
                      future: appliedJobs,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Center(
                              child: Text('Error: ${snapshot.error}'));
                        }
                        // } else if (!snapshot.hasData ||
                        //     snapshot.data!.isEmpty) {
                        //   return Center(
                        //     child: Column(
                        //       children: [
                        //         Image.asset('images/Team work-bro.png'),
                        //         SizedBox(
                        //           height: screenHeight * 0.01,
                        //         ),
                        //         const Text(
                        //           'Hiremi’s Recruiters are planning for new internships',
                        //           style: TextStyle(
                        //               fontWeight: FontWeight.bold,
                        //               fontSize: 16.0),
                        //           textAlign: TextAlign.center,
                        //         ),
                        //         const Text(
                        //           'and roles, please wait for few days',
                        //           style: TextStyle(
                        //               fontWeight: FontWeight.bold,
                        //               fontSize: 16.0),
                        //           textAlign: TextAlign.center,
                        //         ),
                        //       ],
                        //     ),
                        //   );
                        // }
                        else {
                          final jobs = snapshot.data!;
                          return SingleChildScrollView(
                            child: Padding(
                              padding: EdgeInsets.all(
                                  screenWidth * 0.04), // 4% of screen width
                              child: Column(
                                children: jobs.map((job) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                        bottom: screenHeight * 0.02),
                                    child: AppliedCard(
                                      dp: Image.asset(
                                          'images/icons/logo1.png'), // Placeholder image
                                      profile: job['profile'] ?? 'N/A',
                                      companyName: job['company_name'] ?? 'N/A',
                                      location: job['location'] ?? 'N/A',
                                      eligible: job['eligibility'] ?? 'N/A',
                                      stipend:
                                          job['Stipend']?.toString() ?? 'N/A',
                                      mode:
                                          'Remote', // Replace with actual data if available
                                      type:
                                          'Internship', // Replace with actual data if available
                                      exp:
                                          1, // Replace with actual data if available
                                      daysPosted:
                                          0, // Replace with actual data if available
                                      ctc: job['Stipend']?.toString() ??
                                          '0', // Example, replace with actual field
                                      description: job['description'] ??
                                          'No description available',
                                      education: job['education'],
                                      skillsRequired: job['skills_required'],
                                      whoCanApply: job['who_can_apply'],
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
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.all(screenHeight * 0.02),
                  child: Image.asset(
                    'images/Empty-bro.png',
                    height: screenHeight * 0.4,
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.002,
                ),
                const Text(
                  'No Applies, Select from Hiremi’s Featured to',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                  textAlign: TextAlign.center,
                ),
                const Text(
                  'start your journey today.',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: screenHeight * 0.01,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(screenWidth * 0.02),
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) =>
                                  const InternshipsScreen(isVerified: false)));
                        },
                        style: ButtonStyle(
                          shape:
                              WidgetStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          side: WidgetStateProperty.all<BorderSide>(
                            const BorderSide(color: Colors.orange, width: 2),
                          ),
                          padding: WidgetStateProperty.all<EdgeInsets>(
                            const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 20),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Image.asset('images/Group 170.png'),
                            SizedBox(
                              width: screenWidth * 0.02,
                            ),
                            const Text(
                              "Internships",
                              style: TextStyle(
                                  color: Colors.orange,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(screenWidth * 0.02),
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) =>
                                  const FresherJobs(isVerified: false)));
                        },
                        style: ButtonStyle(
                          shape:
                              WidgetStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          side: WidgetStateProperty.all<BorderSide>(
                            const BorderSide(color: Colors.red, width: 2),
                          ),
                          padding: WidgetStateProperty.all<EdgeInsets>(
                            const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 20),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Image.asset('images/Group 170 (1).png'),
                            SizedBox(
                              width: screenWidth * 0.02,
                            ),
                            const Text(
                              "Fresher Jobs",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(screenWidth * 0.02),
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => const Experienced_Jobs()));
                        },
                        style: ButtonStyle(
                          shape:
                              WidgetStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          side: WidgetStateProperty.all<BorderSide>(
                            const BorderSide(
                                color: Colors.purpleAccent, width: 2),
                          ),
                          padding: WidgetStateProperty.all<EdgeInsets>(
                            const EdgeInsets.symmetric(
                                vertical: 16, horizontal: 20),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Image.asset('images/Group 170 (2).png'),
                            SizedBox(
                              width: screenWidth * 0.02,
                            ),
                            const Text(
                              "Experienced Jobs",
                              style: TextStyle(
                                  color: Colors.purpleAccent,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
    );
  }
}
