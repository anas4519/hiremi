import 'package:flutter/material.dart';
import 'package:hiremi_version_two/Custom_Widget/RoundedContainer/roundedContainer.dart';
import 'package:hiremi_version_two/Screens/Profile_Screen/widgets/CustomContainer/OutlinedButton.dart';
import 'package:hiremi_version_two/Utils/AppSizes.dart';
import 'package:hiremi_version_two/Utils/colors.dart';


class Projects extends StatelessWidget {
  const Projects({
    super.key,
    this.onTap,
    this.projects,
  });

  final void Function()? onTap;
  final List<Map<String, String>>? projects;

  @override
  Widget build(BuildContext context) {
    return OutlinedContainer(
      onTap: onTap,
      title: 'Projects',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (projects!.isNotEmpty)
            SizedBox(height: Sizes.responsiveMd(context)),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: projects!
                  .map((project) => ProjectsChild(
                        title: project['project_title']!,
                        startingDate: project['start_date']!,
                        endingDate: project['end_date']!,
                        description: project['description']!,
                        link: project['link']!,
                        status: project['status']!,
                      ))
                  .toList()),
        ],
      ),
    );
  }
}

class ProjectsChild extends StatelessWidget {
  const ProjectsChild({
    super.key,
    required this.title,
    required this.description,
    required this.link,
    required this.status,
    required this.startingDate,
    required this.endingDate,
  });

  final String title, startingDate, endingDate, description, link, status;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
              fontSize: 9.0, fontWeight: FontWeight.w500, color: Colors.black),
        ),
        SizedBox(
          height: Sizes.responsiveXs(context),
        ),
        Text('$startingDate - ${status == 'Completed' ? endingDate : 'Ongoing'}',
            style: TextStyle(
                fontSize: 6.0,
                fontWeight: FontWeight.w500,
                color: AppColors.secondaryText)),
        SizedBox(
          height: Sizes.responsiveSm(context),
        ),
        Text(
          description,
          style: const TextStyle(
              fontSize: 9.0, fontWeight: FontWeight.w500, color: Colors.black),
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(
          height: Sizes.responsiveSm(context),
        ),
        RoundedContainer(
          color: Colors.blue[100],
          radius: 2,
          padding: EdgeInsets.all(Sizes.responsiveXs(context)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.attach_file,
                color: Colors.blue,
                size: 8,
              ),
              SizedBox(
                width: Sizes.responsiveXxs(context),
              ),
              Text(
                link,
                style: const TextStyle(
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.blue,
                    fontWeight: FontWeight.w400,
                    fontSize: 8,
                    color: Colors.blue),
              ),
            ],
          ),
        ),
        SizedBox(
          height: Sizes.responsiveSm(context),
        ),
        Divider(
          height: 0.25,
          thickness: 0.25,
          color: AppColors.secondaryText,
        ),
        SizedBox(
          height: Sizes.responsiveDefaultSpace(context),
        ),
      ],
    );
  }
}
