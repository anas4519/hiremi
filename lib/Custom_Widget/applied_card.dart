import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class AppliedCard extends ConsumerWidget {
  const AppliedCard(
      {super.key,
      required this.dp,
      required this.profile,
      required this.companyName,
      required this.location,
      required this.stipend,
      required this.mode,
      required this.exp,
      required this.type,
      required this.daysPosted,
      required this.ctc,
      required this.description,
      required this.education,
      required this.skillsRequired,
      required this.whoCanApply,
      required this.eligible});

  final Image dp;
  final String profile;
  final String companyName;
  final String location;
  final String stipend;
  final String mode;
  final int exp;
  final String type;
  final int daysPosted;
  final String ctc;
  final String description;
  final String education;
  final String skillsRequired;
  final String whoCanApply;
  final String eligible;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey[300]!, width: 3),
                ),
                child: CircleAvatar(
                  radius: MediaQuery.of(context).size.width * 0.05,
                  backgroundColor: Colors.white,
                  child: dp,
                ),
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    profile,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Text(
                    companyName,
                    textAlign: TextAlign.start,
                    style: const TextStyle(fontSize: 8),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.location_on_rounded,
                      color: Colors.grey, size: 8),
                  const SizedBox(width: 5),
                  Text(location, style: const TextStyle(fontSize: 8)),
                ],
              ),
              // SizedBox(height: MediaQuery.of(context).size.height*0.01),
              Row(
                children: [
                  const Icon(Icons.school, color: Colors.grey, size: 8),
                  const SizedBox(width: 5),
                  Text(eligible, style: const TextStyle(fontSize: 8)),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.currency_rupee, color: Colors.grey, size: 8),
                  const SizedBox(width: 5),
                  Text(stipend, style: const TextStyle(fontSize: 8)),
                ],
              ),
            ],
          ),
          //SizedBox(height: MediaQuery.of(context).size.height*0.01),

          Row(
            children: [
              buildDetailContainer(
                  context, mode, Colors.amber, const Color(0xFFFFF6E5)),
              const SizedBox(width: 2),
              buildDetailContainer(
                  context, type, Colors.red, const Color(0xFFFFEEE5)),
              const SizedBox(width: 2),
              buildDetailContainer(context, '$exp Year Exp',
                  const Color(0xFFED509B), const Color(0xFFFFE5EE)),
              const Spacer(),
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
                  backgroundColor:
                      WidgetStateProperty.all<Color>(const Color(0xFFC1272D)),
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0), // Border radius
                    ),
                  ),
                ),
                child: const Text(
                  'View',
                  style: TextStyle(fontSize: 10),
                ),
              )
            ],
          ),
          const SizedBox(height: 6),
          Container(
            width: MediaQuery.of(context).size.width * 0.92,
            height: 1,
            color: Colors.grey,
          ),
          const SizedBox(height: 6),
          const Row(
            children: [
              Icon(Icons.av_timer, size: 8, color: Colors.grey,),
              Text('Application Status: ', style: TextStyle(fontSize: 8, color: Colors.grey)),
              Text('Applied',
                  style: TextStyle(color: Colors.green, fontSize: 8, fontWeight: FontWeight.bold)),
              Spacer(),
              Icon(Icons.av_timer, color: Colors.grey, size: 8),

              Text('Applied date: 30/07/04',
                  style: TextStyle(color: Colors.grey, fontSize: 8)),
            ],
          ),
        ],
      ),
    );
  }

  Container buildDetailContainer(
      BuildContext context, String text, Color iconColor, Color bgColor) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.03,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(color: bgColor),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.work_rounded, size: 8, color: iconColor),
          const SizedBox(width: 5),
          Text(text,
              style: const TextStyle(fontSize: 8, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
