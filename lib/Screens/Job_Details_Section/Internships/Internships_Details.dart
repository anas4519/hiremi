// import 'package:flutter/material.dart';
//
// import '../../../SkillRequired.dart';
// import '../../../Utils/AppSizes.dart';
// import '../../../Utils/colors.dart';
// import '../../Profile_Screen/sections/widgets_mustufa/appbar/AppBar.dart';
//
// class InternshipsDetailsScreen extends StatelessWidget {
//   const InternshipsDetailsScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.white,
//       appBar: SAppbar(
//         title: 'Internships',
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.only(
//               top: Sizes.responsiveXl(context),
//               right: Sizes.responsiveDefaultSpace(context),
//               bottom: kToolbarHeight * 1.5,
//               left: Sizes.responsiveDefaultSpace(context)),
//           child:
//           Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//
//             /// Header Sections
//             const HeaderSection(),
//
//             SizedBox(height: Sizes.responsiveXl(context)),
//
//             /// Role Details
//             const RoleDetails(),
//             SizedBox(
//               height: Sizes.responsiveLg(context),
//             ),
//             /// Skill Required
//             const SkillRequired(),
//             SizedBox(
//               height: Sizes.responsiveLg(context),
//             ),
//
//             /// Eligibility Criteria
//             const EligibilityCriteriaAboutCompany()
//           ]),
//         ),
//       ),
//     );
//   }
// }
//
