import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hiremi_version_two/providers/verified_provider.dart';
import 'package:hiremi_version_two/verify.dart';

class AdBanner extends ConsumerWidget {
  AdBanner({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isVerified = ref.watch(verificationProvider);

    return SizedBox(
      width: double.infinity,
      child: GestureDetector(
        onTap: (){
          !isVerified ?
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context )=> const VerificationScreen())):
          null;
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(screenWidth * 0.02),
          child:
              isVerified?
          Image.asset('images/icons/Banner Custom.png',fit: BoxFit.fill,):
          Image.asset('images/icons/Hiremi Banner.png',fit: BoxFit.fill,)
        ),
      ),
    );
  }
}
