// import 'package:flutter/material.dart';
// import 'package:flutter_styled_toast/flutter_styled_toast.dart';
// import 'package:get/get.dart';
// import 'package:loading_animation_widget/loading_animation_widget.dart';
// import '/view/resourse/style_manager.dart';
// import '../../view/resourse/color_manager.dart';
// import '../../view/resourse/values_manager.dart';
// import 'app_sizer.dart';
//
// class Const {
//   static LOADIG(context){
//     Get.dialog(
//         Center(
//           child: Container(
//               alignment: Alignment.center,
//               width: AppSizer.getW(context) * 0.2,
//               height: AppSizer.getW(context) * 0.2,
//               decoration: BoxDecoration(
//                   color: ColorManager.white,
//                   borderRadius: BorderRadius.circular(AppSize.s8)),
//               child: LoadingAnimationWidget.inkDrop(
//                   color: ColorManager.primaryColor,
//                   size: AppSizer.getW(context) * 0.1)),
//         ),
//         barrierDismissible: false
//     );
//   }
//
//     static TOAST(BuildContext context, {String textToast = "This Is Toast"}) {
//       showToast(
//           textToast,
//           context: context,
//           animation: StyledToastAnimation.fadeScale,
//           textStyle: getRegularStyle(color: ColorManager.white)
//       );
//     }
//
//
//     static SHOWDELETEDIALOOG(BuildContext context) {
//       Get.dialog(
//
//         Center(
//           child: Material(
//             color: Colors.transparent,
//             child: Container(
//               margin: const EdgeInsets.symmetric(
//                   horizontal: AppMargin.m10,
//                   vertical: AppMargin.m20),
//               padding: EdgeInsets.symmetric(
//                   horizontal: AppPadding.p20,
//                   vertical: AppPadding.p10),
//               width: AppSizer.getW(context),
//               decoration: BoxDecoration(
//                   color: Theme
//                       .of(context)
//                       .cardColor,
//                   borderRadius:
//                   BorderRadius.circular(AppSize.s14)),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   const SizedBox(height: AppSize.s30,),
//                   Text(
//                     "tr(LocaleKeys.delete)",
//                     style: getRegularStyle(
//                         color: Theme
//                             .of(context)
//                             .textTheme
//                             .bodyText1!
//                             .color,
//                         fontSize: AppSizer.getW(context) * 0.045
//                     ),
//                   ),
//                   const SizedBox(height: AppSize.s40,),
//                   Row(
//                     children: [
//                       // ButtonApp(
//                       //   text: tr(LocaleKeys.ok),
//                       //   onTap: (){
//                       //     Navigator.pop(context);
//                       //     Const.TOAST(context,textToast: tr(LocaleKeys.rate));
//                       //   },
//                       // ),
//                       // ButtonApp(
//                       //   text: tr(LocaleKeys.no),
//                       //   onTap: (){
//                       //     Navigator.pop(context);
//                       //     Const.TOAST(context,textToast: tr(LocaleKeys.rate));
//                       //   },
//                       // )
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       );
//     }
//
//     static SHOWLOADINGINDECATOR() {
//       return Center(
//         child: CircularProgressIndicator(
//         ),
//       );
//     }
//   }