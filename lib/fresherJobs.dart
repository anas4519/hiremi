import 'package:flutter/material.dart';
import 'package:hiremi_version_two/API_Integration/Internship/Apiservices.dart';
import 'package:hiremi_version_two/Custom_Widget/OppurtunityCard.dart';
import 'package:hiremi_version_two/Notofication_screen.dart';
import 'package:hiremi_version_two/Utils/colors.dart';

class FresherJobs extends StatefulWidget {
  const FresherJobs({Key? key, required this.isVerified}) : super(key: key);
  final bool isVerified;

  @override
  State<FresherJobs> createState() => _FresherJobsState();
}

class _FresherJobsState extends State<FresherJobs> {
  late Future<List<dynamic>> futureJobs;

  @override
  void initState() {
    super.initState();
    final apiService = ApiService('http://13.127.81.177:8000/api/fresherjob/');
    futureJobs = apiService.fetchData();
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
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (ctx) => const NotificationScreen()));
              },
              icon: const Icon(Icons.notifications_outlined),
              style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(AppColors.bgBlue)))
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
            width: screenWidth * 0.02, // 2% of screen width
          ),
          Expanded(
            child: FutureBuilder<List<dynamic>>(
              future: futureJobs,
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
                  final jobs = snapshot.data!;
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
                          SizedBox(height: screenHeight * 0.03),
                          Column(
                            children: jobs.map((job) {
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
                                  whoCanApply: job['who_can_apply'],
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
