import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ishita_singh/utilities/appcolors.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ExperienceScreen extends StatefulWidget {
  final sw;
  const ExperienceScreen({super.key, this.sw});

  @override
  State<ExperienceScreen> createState() => _ExperienceScreenState();
}

class _ExperienceScreenState extends State<ExperienceScreen> {
  int id = 1;
  late Container adaptiveContainer;
  int index = 0;
  List exp_content = [
    [
      "Software Engineer Trainee",
      "@ i2V Systems Pvt. Ltd.",
      "aug 2022 - feb 2023",
      "• Worked on Flutter and built applications for Web, IOS and Android • Maintained and optimised the VMS Application • Worked with MQTT • Handled the background services and notifications • Depolyed the app on PlayStore"
    ],
    [
      'Android App Development Intern',
      '@ The Sparks Foundation',
      'feb 2021 - mar 2021',
      "• Added sign in feature with Google and Facebook • Worked with Firebase Authentication • Displayed data of user like name, id after sign in",
    ],
  ];
  List hack_content = [
    [
      'Under Top 8 Teams',
      '@ Microsoft Imagine Cup India Pre-Finals',
      'feb 2021 - mar 2021',
      "• Worked tirelessly to develop a creative and original solution, competing against some of the best minds in the industry • Persevered through tough competition and demonstrated valuable skills and expertise"
    ],
    [
      "5th/600",
      "@ Covi-Hack’21 GDSC",
      "Android App Develo",
      "• Developed the app's user interface, database, and integration with external APIs • Worked under tight time-frame of 2 days."
    ],
  ];

  @override
  void initState() {
    adaptiveContainer = setContainerContent(id);
    // selectedbtnContainer = defaultsmallContainer(Colors.green);
  }

  @override
  Widget build(BuildContext context) {
    adaptiveContainer = setContainerContent(id);

    // print(selectedbtnContainer);
    return Padding(
      padding: EdgeInsets.only(
          left: Adaptive.w(5), right: Adaptive.w(5), bottom: Adaptive.w(20)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "Where I've Worked",
          style: TextStyle(
              color: AppColors.headColor,
              fontSize: 18.sp,
              fontWeight: FontWeight.w700),
        ),
        Container(
          color: AppColors.greyTextColor,
          width: widget.sw,
          height: 2,
        ),
        SizedBox(
          height: Adaptive.w(6),
        ),
        IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(right: Adaptive.w(5)),
                child: Container(
                  width: Adaptive.w(15),
                  color: AppColors.primaryColor,
                  child: FieldButtons(),
                ),
              ),
              adaptiveContainer,
            ],
          ),
        )
      ]),
    );
  }

  FieldButtons() {
    return Column(
      children: [
        fieldbtnElement('Experience', 1),
        fieldbtnElement('Hackathons', 2),
        // fieldbtnElement('Profiles', 3),
        fieldbtnElement('Volunteer', 4),
      ],
    );
  }

  fieldbtnElement(String text, int idss) {
    return IntrinsicHeight(
      child: Row(
        children: [
          selectedsmallContainer(
              id == idss ? AppColors.hoverTextColor : AppColors.darkgreyColor,
              id == idss ? Adaptive.w(0.15) : Adaptive.w(0.1)),
          Expanded(
            child: TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: id == idss
                      ? AppColors.greyTextColor.withOpacity(0.08)
                      : Colors.transparent),
              onPressed: () {
                setState(() {
                  id = idss;
                  adaptiveContainer = setContainerContent(id);
                  index = 0;
                });
              },
              child: Padding(
                padding: EdgeInsets.all(12.sp),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(text,
                      style: TextStyle(
                          fontFamily: 'SFMono',
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w600,
                          color: id == idss
                              ? AppColors.hoverTextColor
                              : AppColors.darkgreyColor)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  setContainerContent(int id) {
    if (id == 1) {
      return internshipContainer();
    }
    if (id == 2) {
      return espContainer();
    }
    if (id == 3) {
      return profileContainer();
    }
    if (id == 4) {
      return volunteerContainer();
    }
  }

  int getContainerLength(int id) {
    if (id == 1) {
      return 2;
    }
    if (id == 2) {
      return 1;
    }
    if (id == 3) {
      return 1;
    }
    if (id == 4) {
      return 1;
    } else {
      return 1;
    }
  }

  profileContainer() {
    return Container(
        padding: EdgeInsets.all(10.sp),
        color: AppColors.primaryColor,
        width: Adaptive.w(30),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Profile Container',
            style: TextStyle(
                color: AppColors.greyTextColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold),
          ),
          Text(
            'The Sparks Foundation',
            style: TextStyle(
                color: AppColors.hoverTextColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold),
          ),
          Text(
            'feb 2021 - mar 2021',
            style: TextStyle(
                color: AppColors.greyTextColor,
                fontSize: 12.sp,
                fontWeight: FontWeight.normal),
          ),
          SizedBox(
            height: Adaptive.w(3),
          ),
          Text(
            "Added sign in feature with Google and Facebook.Worked with Firebase Authentication. Displayed data of user like name, id after sign in.",
            style: TextStyle(
                color: AppColors.greyTextColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.normal),
          ),
        ]));
  }

  internshipContainer() {
    return Container(
      child: Column(
        children: [
          Container(
              padding: EdgeInsets.all(10.sp),
              color: AppColors.primaryColor,
              width: Adaptive.w(30),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      exp_content[index][0], //headText
                      style: TextStyle(
                          color: AppColors.headColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      exp_content[index][1], //subhead
                      style: TextStyle(
                          color: AppColors.hoverTextColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: Adaptive.h(1.5)),
                      child: Text(
                        exp_content[index][2], //date
                        style: TextStyle(
                            color: AppColors.greyTextColor,
                            fontSize: 12.sp,
                            fontFamily: 'SFMono',
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    SizedBox(
                      height: Adaptive.w(3),
                    ),
                    Text(
                      exp_content[index][3], //content
                      style: TextStyle(
                          color: AppColors.greyTextColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.normal),
                    ),
                  ])),
          if (exp_content.length > 1)
            Row(
              children: [
                TextButton(
                    onPressed: () {
                      setState(() {
                        if (index != 0) index--;
                      });
                    },
                    child: Icon(Icons.arrow_back_rounded,
                        color: index != 0
                            ? AppColors.greyTextColor
                            : AppColors.darkgreyColor)),
                TextButton(
                    onPressed: () {
                      setState(() {
                        if (index + 1 != exp_content.length) index++;
                      });
                    },
                    child: Icon(
                      Icons.arrow_forward_rounded,
                      color: index + 1 != exp_content.length
                          ? AppColors.greyTextColor
                          : AppColors.darkgreyColor,
                    )),
              ],
            ),
        ],
      ),
    );
  }

  espContainer() {
    return Container(
      child: Column(
        children: [
          Container(
              padding: EdgeInsets.all(10.sp),
              color: AppColors.primaryColor,
              width: Adaptive.w(30),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      hack_content[index][0],
                      style: TextStyle(
                          color: AppColors.greyTextColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      hack_content[index][1],
                      style: TextStyle(
                          color: AppColors.hoverTextColor,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      hack_content[index][2],
                      style: TextStyle(
                          color: AppColors.greyTextColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.normal),
                    ),
                    SizedBox(
                      height: Adaptive.w(3),
                    ),
                    Text(
                      hack_content[index][3],
                      style: TextStyle(
                          color: AppColors.greyTextColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.normal),
                    ),
                  ])),
          if (hack_content.length > 1)
            Row(
              children: [
                TextButton(
                    onPressed: () {
                      setState(() {
                        if (index != 0) index--;
                      });
                    },
                    child: Icon(Icons.arrow_back_rounded,
                        color: index != 0
                            ? AppColors.greyTextColor
                            : AppColors.darkgreyColor)),
                TextButton(
                    onPressed: () {
                      setState(() {
                        if (index + 1 != hack_content.length) index++;
                      });
                    },
                    child: Icon(
                      Icons.arrow_forward_rounded,
                      color: index + 1 != hack_content.length
                          ? AppColors.greyTextColor
                          : AppColors.darkgreyColor,
                    )),
              ],
            ),
        ],
      ),
    );
  }

  volunteerContainer() {
    return Container(
        padding: EdgeInsets.all(10.sp),
        color: AppColors.primaryColor,
        width: Adaptive.w(30),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Social Media Marketing',
            style: TextStyle(
                color: AppColors.greyTextColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold),
          ),
          Text(
            '@ Atypical Advantage',
            style: TextStyle(
                color: AppColors.hoverTextColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold),
          ),
          Text(
            'feb 2021 - mar 2021',
            style: TextStyle(
                color: AppColors.greyTextColor,
                fontSize: 12.sp,
                fontWeight: FontWeight.normal),
          ),
          SizedBox(
            height: Adaptive.w(3),
          ),
          Text(
            "• Created and managed campaigns to spread the word about their mission • Developed content for social media platforms • Used skills for a meaningful cause and made a positive impact.",
            style: TextStyle(
                color: AppColors.greyTextColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.normal),
          ),
        ]));
  }

  selectedsmallContainer(Color color, double contWidth) {
    return Container(
      width: contWidth,
      color: color,
    );
  }

  defaultsmallContainer(Color color, double contWidth) {
    return Container(
      width: contWidth,
      color: color,
    );
  }
}
