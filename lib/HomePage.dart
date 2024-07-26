import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hiremi_version_two/API_Integration/Internship/Apiservices.dart';
import 'package:hiremi_version_two/Custom_Widget/OppurtunityCard.dart';
import 'package:hiremi_version_two/Custom_Widget/Verifiedtrue.dart';
import 'package:hiremi_version_two/Custom_Widget/banners.dart';
import 'package:hiremi_version_two/Custom_Widget/verification_status.dart';
import 'package:hiremi_version_two/InternshipScreen.dart';
import 'package:hiremi_version_two/Utils/AppSizes.dart';
import 'package:hiremi_version_two/Utils/colors.dart';
import 'package:hiremi_version_two/experienced_jobs.dart';
import 'package:hiremi_version_two/fresherJobs.dart';
import 'package:hiremi_version_two/providers/verified_provider.dart';
import 'package:hiremi_version_two/repository/User.dart';
import 'package:hiremi_version_two/repository/model/userModel.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'Models/register_model.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  double _blurAmount = 10.0;
  List<dynamic> _jobs = [];
  bool _isLoading = true;
  String FullName = "";
  String storedEmail = '';

  // bool isVerified = ref.watch(verificationProvider);
  User? matchingUser;

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    // _checkVerified();
    _fetchJobs();
    fetchAndSaveFullName();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    double offset = _scrollController.offset;
    setState(() {
      _blurAmount = (10 - (offset / 10)).clamp(0, 10);
    });
  }

  Future<void> _fetchJobs() async {
    try {
      final apiService =
          ApiService('http://13.127.81.177:8000/api/internship/');
      final data = await apiService.fetchData();
      setState(() {
        _jobs = data;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> fetchAndSaveFullName() async {
    const String apiUrl = "http://13.127.81.177:8000/api/registers/";
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        final prefs = await SharedPreferences.getInstance();
        storedEmail = prefs.getString('email') ?? 'No email saved';

        for (var user in data) {
          if (user['email'] == storedEmail) {
            UserModel newUser = UserModel(
              userId: user['id'],
              fullName: user['full_name'] ?? '',
              fatherName: user['father_name'] ?? '',
              gender: user['gender'],
              email: user['email'] ?? '',
              dob: user['date_of_birth'].toString() ?? '',
              birthPlace: user['birth_place'] ?? '',
              phone: user['phone_number'].toString() ?? '',
              whatsapp: user['whatsapp_number'].toString() ?? '',
              collegeName: user['college_name'] ?? '',
              collegeState: user['college_state'] ?? '',
              branch: user['branch_name'] ?? '',
              degree: user['degree'] ?? '',
              passingYear: user['passing_year'].toString() ?? '',
            );
            userRepository.setUser(newUser);
            print('User details saved: ${newUser.fullName}');
            break;
          }
        }
      } else {
        print('Failed to fetch user Data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  // Future<void> _checkVerified() async {
  //   const String apiUrl = "http://13.127.81.177:8000/api/registers/";

  //   try {
  //     final response = await http.get(Uri.parse(apiUrl));

  //     if (response.statusCode == 200) {
  //       final data = jsonDecode(response.body);
  //       final prefs = await SharedPreferences.getInstance();
  //       storedEmail = prefs.getString('email') ?? 'No email saved';

  //       for (var user in data) {
  //         if (user['email'] == storedEmail) {
  //           setState(() {
  //             isVerified = user['verified'] ;
  //             prefs.setBool('verified', isVerified);
  //           });
  //           break;
  //         }
  //       }

  //       if (FullName.isEmpty) {
  //         print('No matching email found');
  //       }
  //     } else {
  //       print('Failed to fetch full name');
  //     }
  //   } catch (e) {
  //     print('Error: $e');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    bool isVerified = ref.watch(verificationProvider);
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: Sizes.responsiveMd(context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Sizes.responsiveMd(context)),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (!isVerified)
                        VerificationStatus(
                            fullName: userRepository.currentUser?.fullName,
                            percent: 0.25),
                      if (isVerified)
                        VerifiedProfileWidget(
                            name: 'Hi, ${userRepository.currentUser?.fullName}',
                            appId: '00011102'),
                      SizedBox(height: Sizes.responsiveXxl(context)),
                      const Text(
                        'Explore hiremi',
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      SizedBox(height: Sizes.responsiveMd(context)),
                    ]),
              ),
              Column(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 155,
                      viewportFraction: 0.95,
                      autoPlay: true,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      },
                    ),
                    items: [1, 2, 3, 4, 5].map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.025),
                            child: AdBanner(),
                          );
                        },
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: Sizes.responsiveMdSm(context),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [1, 2, 3, 4, 5].asMap().entries.map((entry) {
                      return GestureDetector(
                        onTap: () => _controller.animateToPage(entry.key),
                        child: Container(
                          width: 12.0,
                          height: 12.0,
                          margin: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 4.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: (Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Colors.white
                                    : AppColors.primary)
                                .withOpacity(
                                    _current == entry.key ? 0.9 : 0.4),
                          ),
                        ),
                      );
                    }).toList(),
                  )
                ],
              ),
              SizedBox(height: Sizes.responsiveMd(context)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Sizes.responsiveMd(context)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Hiremi's Featured",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFFFF6E01), Color(0xFFFEBC0D)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (ctx) =>
                                    InternshipsScreen(isVerified: isVerified),
                              ));
                            },
                            child: Row(
                              children: [
                                Container(
                                  width: screenWidth * 0.05,
                                  height: screenWidth * 0.05,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                  child: Icon(
                                    Icons.spa,
                                    size: screenWidth * 0.02,
                                    color: Colors.orange,
                                  ),
                                ),
                                SizedBox(width: screenWidth * 0.015),
                                Text(
                                  'Internships',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: screenWidth * 0.025,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.01),
                        Container(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFFFC3E41), Color(0xFFFF6E01)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (ctx) =>
                                      FresherJobs(isVerified: isVerified)));
                            },
                            child: Row(
                              children: [
                                Container(
                                  width: screenWidth * 0.05,
                                  height: screenWidth * 0.05,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                  child: Icon(
                                    Icons.work,
                                    size: screenWidth * 0.02,
                                    color: Colors.deepOrange,
                                  ),
                                ),
                                SizedBox(width: screenWidth * 0.015),
                                Text(
                                  'Fresher Jobs',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: screenWidth * 0.025,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.01),
                        Container(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFFCB44BD), Color(0xFFDB6AA0)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (ctx) => const Experienced_Jobs()));
                            },
                            child: Row(
                              children: [
                                Container(
                                  width: screenWidth * 0.05,
                                  height: screenWidth * 0.05,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                  child: Icon(
                                    Icons.work,
                                    size: screenWidth * 0.02,
                                    color: Colors.purpleAccent,
                                  ),
                                ),
                                SizedBox(width: screenWidth * 0.015),
                                Text(
                                  'Experienced Jobs',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: screenWidth * 0.025,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Sizes.responsiveMd(context)),
                child: const Text(
                  'Latest Opportunities',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Sizes.responsiveMd(context)),
                child: Column(
                  children: _jobs.map((job) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: screenHeight * 0.02),
                      child: OpportunityCard(
                        dp: Image.asset('images/icons/logo1.png'),
                        // Placeholder image
                        profile: job['profile'] ?? 'N/A',
                        companyName: job['company_name'] ?? 'N/A',
                        location: job['location'] ?? 'N/A',
                        stipend: job['Stipend']?.toString() ?? 'N/A',
                        mode: 'Remote',
                        // Replace with actual data if available
                        type: 'Job',
                        // Replace with actual data if available
                        exp: 1,
                        // Replace with actual data if available
                        daysPosted: 0,
                        // Replace with actual data if available
                        ctc: job['Stipend']?.toString() ?? '0',
                        // Example, replace with actual field
                        description:
                            job['description'] ?? 'No description available',
                        education: job['education'],
                        skillsRequired: job['skills_required'],
                        whoCanApply: job['who_can_apply'],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
