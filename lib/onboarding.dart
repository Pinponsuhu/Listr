import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  PageController _pageController = PageController();
  int _initialPage = 0;

  final List<Map<String, String>> _pageDetails = [
    {
      'title': "Stay Organized, Stay Ahead",
      "subtitle":
          "Listr helps you manage tasks effortlessly, so you can focus on what truly matters",
      "svg": "images/svg/organize.svg"
    },
    {
      'title': "Smart, Fast & Intuitive",
      "subtitle":
          "Easily create, track, and complete your tasks with a sleek and simple interface.",
      "svg": "images/svg/smart.svg"
    },
    {
      'title': "Your Productivity, Supercharged",
      "subtitle":
          "Turn your to-do list into done with reminders, priorities, and seamless organization.",
      "svg": "images/svg/productivity.svg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        automaticallyImplyLeading: false,
        actions: [
          TextButton(
            onPressed: () => Navigator.pushReplacementNamed(context, '/login'),
            style: TextButton.styleFrom(foregroundColor: Colors.grey[700]),
            child: Text(
              "Skip",
            ),
          )
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (value) {
                    setState(() {
                      _initialPage = value;
                    });
                    // _pageController.page = _initialPage;
                  },
                  itemCount: _pageDetails.length,
                  itemBuilder: (context, index) {
                    final pageDetail = _pageDetails[index];
                    return Container(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Spacer(
                            flex: 3,
                          ),
                          AspectRatio(
                              aspectRatio: 24 / 18,
                              child: SvgPicture.asset(
                                  pageDetail['svg'] as String)),
                          SizedBox(
                            height: 36,
                          ),
                          Text(
                            pageDetail['title'] as String,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            pageDetail['subtitle'] as String,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                            ),
                          ),
                          Spacer(
                            flex: 1,
                          ),
                        ],
                      ),
                    );
                  }),
            ),
            Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 24, horizontal: 18),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16)),
                ),
                child: Column(
                  children: [
                    Row(
                      children: List.generate(3, (index) {
                        return Container(
                          height: 8,
                          width: _initialPage == index ? 20 : 12,
                          margin: _initialPage != 3
                              ? EdgeInsets.only(right: 4)
                              : EdgeInsets.zero,
                          decoration: BoxDecoration(
                            color: Colors.grey[50],
                            borderRadius: BorderRadius.circular(8),
                          ),
                        );
                      }),
                    ),
                    SizedBox(
                      height: 26,
                    ),
                    TextButton(
                      onPressed: () {
                        if (_initialPage != (_pageDetails.length - 1)) {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                        } else {
                          Navigator.pushReplacementNamed(context, '/login');
                        }
                      },
                      child: Text(
                        _initialPage != _pageDetails.length - 1
                            ? "Next"
                            : "Continue",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.yellow[300],
                          foregroundColor: Colors.black,
                          padding: EdgeInsets.symmetric(vertical: 18),
                          minimumSize: Size(double.infinity, 36)),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
