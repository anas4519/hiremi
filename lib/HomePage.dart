import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
import 'package:hiremi_version_two/providers/verified_provider.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
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
      _blurAmount = (10 - (offset / 10))
          .clamp(0, 10); // Adjust blur amount based on scroll
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
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
      // Handle error
      setState(() {
        _isLoading = false;
      });
    }
  }

  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    final isVerified = ref.watch(verificationProvider);
    const percent = 0.25;
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
            style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(AppColors.bgBlue)),
            icon: const Icon(Icons.notifications_outlined),
          ),
        ],
      ),
      drawer: const Drawer(
        backgroundColor: Colors.white,
        child: DrawerChild(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (!isVerified)
                const VerificationStatus(
                  percent: 0.25,
                ),
              if (isVerified)
                const VerifiedProfileWidget(
                    name: 'Harsh Pawar', appId: '00011102'),
              SizedBox(height: screenHeight * 0.02),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Explore hiremi',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Column(
                    children: [
                      CarouselSlider(
                        options: CarouselOptions(
                          height: 155,
                          viewportFraction: 0.95,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _current = index;
                            });
                          },
                        ),
                        items: [1, 2, 3, 4, 5].map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return AdBanner();
                            },
                          );
                        }).toList(),
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
                  SizedBox(height: screenHeight * 0.02),
                  //circle row
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
                            builder: (ctx) => FresherJobs(
                                  isVerified: isVerified,
                                )));
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
                              color: const Color(0xFFFF3E41),
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
                              color: Colors.purple,
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
              ..._jobs
                  .map((job) => OpportunityCard(
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
                        description:
                            job['description'] ?? 'No description available',
                        education: job['education'],
                        skillsRequired: job['skills_required'],
                        whoCanApply: job['who_can_apply'],
                      ))
                  .toList(),
              const SizedBox(
                height: 64,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
