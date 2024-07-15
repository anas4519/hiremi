
import 'package:flutter/material.dart';
import 'package:hiremi_version_two/API_Integration/Internship/Apiservices.dart';

import 'package:hiremi_version_two/Custom_Widget/Circle_row.dart';
import 'dart:ui'; // For BackdropFilter
import 'package:hiremi_version_two/Custom_Widget/Container_with_curved_Edges.dart';
import 'package:hiremi_version_two/Custom_Widget/OppurtunityCard.dart';
import 'package:hiremi_version_two/Custom_Widget/SliderPageRoute.dart';
import 'package:hiremi_version_two/Custom_Widget/Verifiedtrue.dart';
import 'package:hiremi_version_two/Custom_Widget/banners.dart';
import 'package:hiremi_version_two/Custom_Widget/drawer_child.dart';
import 'package:hiremi_version_two/Custom_Widget/verification_status.dart';
import 'package:hiremi_version_two/Fresher_Jobs.dart';
import 'package:hiremi_version_two/InternshipScreen.dart';
import 'package:hiremi_version_two/Notofication_screen.dart';
import 'package:hiremi_version_two/Utils/AppSizes.dart';
import 'package:hiremi_version_two/Utils/colors.dart';
import 'package:hiremi_version_two/experienced_jobs.dart';
import 'package:hiremi_version_two/fresherJobs.dart';




class HomePage extends StatefulWidget {
  final bool isVerified;
  const HomePage({Key? key, required this.isVerified}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  double heightFactor = 0.5; // 50% of screen height
  double percentage = 15.0; // Example percentage value

  final ScrollController _scrollController = ScrollController();
  double _blurAmount = 10.0;
  List<dynamic> _jobs = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _fetchJobs();
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
      _blurAmount = (10 - (offset / 10)).clamp(0, 10); // Adjust blur amount based on scroll
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  Future<void> _fetchJobs() async {
    try {
      final apiService = ApiService('http://13.127.81.177:8000/api/internship/');
      final data = await apiService.fetchData();
      setState(() {
        _jobs = data;
        _isLoading = false;
      });
    } catch (e) {
      // Handle error
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    const percent = 0.5;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      
      appBar: AppBar(
        backgroundColor: Colors.white,
        // leading: Padding(
        // padding: EdgeInsets.all(screenWidth*0.02),
        // child: GestureDetector(
        //   onTap: () {
        //     Scaffold.of(context).openDrawer();
        //   },
        //   child: Container(
        //       padding: EdgeInsets.all(Sizes.responsiveSm(context)),
        //       decoration: BoxDecoration(
        //         borderRadius: BorderRadius.circular(8.0),
        //         color: AppColors.bgBlue,
        //       ),
        //       child: const Icon(
        //         Icons.notes_rounded,
        //         size: 22,
        //       )),
        // )
        // ),
        
        title: const Text(
          "Hiremi's Home",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (ctx) => const NotificationScreen(),
              ));
            },
            icon: const Icon(Icons.notifications),
          ),
        ],
      ),
      drawer: const Drawer(backgroundColor: Colors.white,child: DrawerChild(),),
      
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (!widget.isVerified) const VerificationStatus(percent: percent,),
              if (widget.isVerified) const VerifiedProfileWidget(name: 'Harsh Pawar', appId: '00011102'),
              SizedBox(height: screenHeight * 0.02),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Explore hiremi',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  AdBanner(isVerified: widget.isVerified),
                  SizedBox(height: screenHeight * 0.02),
                  const CircleRow(),
                ],
              ),
              SizedBox(height: screenHeight * 0.02),
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
                          builder: (ctx) => InternshipsScreen(isVerified: widget.isVerified),
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
                        Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>  FresherJobs(isVerified: widget.isVerified,)));
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
                        Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>const Experienced_Jobs()));
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
              SizedBox(height: screenHeight * 0.02),
              const Text(
                'Latest Opportunities',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
             // SizedBox(height: screenHeight * 0.02),
              // OpportunityCard(
              //   dp: Image.asset('images/Rectangle 57.png'),
              //   role: 'Human Resource Intern',
              //   company: 'Hiremi',
              //   location: 'Bhopal, Madhya Pradesh, India',
              //   stipend: '2,000-15,000',
              //   mode: 'Remote',
              //   type: 'Internship',
              //   exp: 1,
              //   daysPosted: 6,
              //   isVerified: widget.isVerified,
              // ),
             // SizedBox(height: screenHeight * 0.01),
              // OpportunityCard(
              //   dp: Image.asset('images/crtd1 1.png'),
              //   role: 'Social Media Intern',
              //   company: 'CRTD Technologies',
              //   location: 'Bhopal, Madhya Pradesh, India',
              //   stipend: '2,000-15,000',
              //   mode: 'Remote',
              //   type: 'Internship',
              //   exp: 1,
              //   daysPosted: 6,
              //   isVerified: widget.isVerified,
              // ),
              SizedBox(height: screenHeight * 0.01),
              // OpportunityCard(
              //   dp: Image.asset('images/Rectangle 57.png'),
              //   role: 'Data Science Intern',
              //   company: 'Hiremi',
              //   location: 'Bhopal, Madhya Pradesh, India',
              //   stipend: '2,000-15,000',
              //   mode: 'Remote',
              //   type: 'Internship',
              //   exp: 1,
              //   daysPosted: 6,
              //   isVerified: widget.isVerified,
              // ),
             // const SizedBox(height: 64,),
              ..._jobs.map((job) => OpportunityCard(
                dp: Image.asset('images/icons/logo1.png'),
                profile: job['profile'] ?? 'N/A',
                companyName: job['company_name'] ?? 'N/A',
                location: job['location'] ?? 'N/A',
                stipend: job['CTC']?.toString() ?? 'N/A',
                mode: 'Remote',
                type: 'Job',
                exp: 1,
                daysPosted: 0,
                isVerified: widget.isVerified,
                ctc: job['CTC']?.toString() ?? '0',
                description: job['description'] ?? 'No description available',
                education: job['education'],
                skillsRequired: job['skills_required'],
                whoCanApply: job['who_can_apply'],
              )).toList(),
              const SizedBox(height: 64,),
            ],
          ),
        ),
      ),
    );
  }
}
