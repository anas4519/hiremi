import 'package:flutter/material.dart';
import 'package:hiremi_version_two/API_Integration/Internship/Apiservices.dart';
import 'package:hiremi_version_two/Custom_Widget/OppurtunityCard.dart';
import 'package:hiremi_version_two/Notofication_screen.dart';
import 'package:hiremi_version_two/Utils/AppSizes.dart';
import 'package:hiremi_version_two/Utils/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FresherJobs extends StatefulWidget {
  const FresherJobs({super.key, required this.isVerified});
  final bool isVerified;

  @override
  State<FresherJobs> createState() => _FresherJobsState();
}

class _FresherJobsState extends State<FresherJobs> {
  late Future<List<dynamic>> futureJobs;
  late Future<List<dynamic>> futureApplications;
  int? userId;

  @override
  void initState() {
    super.initState();
    _retrieveId();
    futureJobs = _getJobs();
    futureApplications = _getApplications();
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

  Future<List<dynamic>> _getJobs() async {
    final apiService = ApiService('http://13.127.81.177:8000/api/fresherjob/');
    return await apiService.fetchData();
  }

  Future<List<dynamic>> _getApplications() async {
    final apiService = ApiService('http://13.127.81.177:8000/api/job-applications/');
    return await apiService.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Fresher Jobs',
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
            width: screenWidth * 0.95,
            height: screenHeight * 0.1,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFFFC3E41), Color(0xFFFF6E01)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                SizedBox(width: screenWidth * 0.04),
                Container(
                  width: screenWidth * 0.08,
                  height: screenWidth * 0.08,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: const Icon(
                    Icons.work,
                    size: 20,
                    color: Color(0xFFFF3E41),
                  ),
                ),
                SizedBox(width: screenWidth * 0.02),
                Text(
                  'Fresher Jobs',
                  style: TextStyle(
                    fontSize: screenWidth * 0.045,
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
                Container(
                  width: screenWidth * 0.23,
                  height: screenWidth * 0.23,
                  decoration: BoxDecoration(
                    color: Colors.red[100],
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.work,
                    color: Color(0xFFFF3E41),
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: screenWidth * 0.0, // 2% of screen width
          ),
          Expanded(
            child: FutureBuilder<List<dynamic>>(
              future: Future.wait([futureJobs, futureApplications]),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}', textAlign: TextAlign.center,));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(
                    child: Column(
                      children: [
                        Image.asset('images/Team work-bro.png'),
                        SizedBox(
                          height: screenHeight * 0.01,
                        ),
                        const Text(
                          'Hiremi’s Recruiters are planning for new jobs',
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
                  final jobs = snapshot.data![0];
                  final applications = snapshot.data![1];

                  final appliedJobs = applications
                      .where((application) => application['register'] == userId)
                      .map((application) => application['experiencejob'])
                      .toSet();
                  return SingleChildScrollView(
                    
                    child: Padding(
                      padding: EdgeInsets.all(screenWidth * 0.04),
                      child: Column(
                        children: [
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Available Fresher Jobs',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          Column(
                            children: jobs.map<Widget>((job) {
                              bool isApplied = appliedJobs.contains(job['id']);
                              return Padding(
                                padding: EdgeInsets.only(
                                    bottom: screenHeight * 0.03),
                                child: OpportunityCard(
                                  dp: Image.asset('images/icons/logo1.png'),
                                  profile: job['profile'] ?? 'N/A',
                                  companyName: job['company_name'] ?? 'N/A',
                                  location: job['location'] ?? 'N/A',
                                  stipend: job['CTC']?.toString() ?? 'N/A',
                                  mode: 'Remote',
                                  type: 'Job',
                                  exp: 1,
                                  daysPosted: 0,
                                  ctc: job['CTC']?.toString() ?? '0',
                                  description: job['description'] ??
                                      'No description available',
                                  education: job['education'],
                                  skillsRequired: job['skills_required'],
                                  whoCanApply: job['who_can_apply'], id: job['id'],
                                  isApplied: isApplied,
                                ),
                              );
                            }).toList(),
                          ),
                          SizedBox(height: screenHeight * 0.35),
                        ],
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
