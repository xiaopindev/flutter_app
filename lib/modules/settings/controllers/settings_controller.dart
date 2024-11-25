import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_app/configs/constants.dart';
import 'package:flutter_app/configs/routers.dart';
import 'package:flutter_app/generated/assets.dart';
import 'package:flutter_app/modules/common/base/base_controller.dart';
import 'package:flutter_app/pp_kits/pp_kits.dart';

import '../../app_review/app_review_controller.dart';

class SettingsController extends BaseController {
  final appRevew = Get.find<AppReviewController>();

  final group1 = [
    (icon: A.iconSettingBackup, title: 'settings_backup'),
    (icon: A.iconSettingRestore, title: 'settings_restore'),
    (icon: A.iconSettingIndividuation, title: 'settings_individuation'),
    (icon: A.iconSettingFeedback, title: 'settings_feedback'),
    (icon: A.iconSettingLanguage, title: 'settings_language'),
    (icon: A.iconSettingAppReview, title: 'settings_appreview'),
    (icon: A.iconSettingShare, title: 'settings_share'),
  ];

  final group2 = [
    (icon: A.iconSettingPrivacy, title: 'settings_privacy'),
    (icon: A.iconSettingTermsOfUse, title: 'settings_eula'),
  ];

  var version = '1.0.0'.obs;

  @override
  void onInit() {
    Logger.trace('对象初始化');
    super.onInit();
  }

  @override
  void onReady() {
    Logger.trace('加载就绪');
    super.onReady();
    appRevew.useRecord('Settings');

    version.value = app.packageInfo?.version ?? '1.0.0';
  }

  @override
  void onClose() {
    Logger.trace('对象销毁');
    super.onClose();
  }

  void listItemTap(BuildContext context, String title) {
    switch (title) {
      case 'settings_backup':
        global.logEvent('sets_backup');
        break;
      case 'settings_restore':
        global.logEvent('sets_restore');
        break;
      case 'settings_individuation':
        global.logEvent('sets_individuation');
        Get.toNamed(AppPages.individuation);
        break;
      case 'settings_feedback':
        global.logEvent('sets_feedback');
        Get.toNamed(AppPages.feedback);
        break;
      case 'settings_language':
        global.logEvent('sets_languages');
        Get.toNamed(AppPages.languages);
        break;
      case 'settings_appreview':
        global.logEvent('sets_comment');
        global.openAppReview();
        break;
      case 'settings_share':
        global.logEvent('sets_share');
        global.share(context, url: Consts.appStoreDownUrl);
        break;
      case 'settings_privacy':
        global.logEvent('sets_privacy');
        Get.toNamed(AppPages.web, arguments: {
          "title": 'Privacy_Text1'.localized,
          "url": Consts.urlPrivacy
        });
        break;
      case 'settings_eula':
        global.logEvent('sets_agreement');
        Get.toNamed(AppPages.web, arguments: {
          "title": 'Privacy_Text2'.localized,
          "url": Consts.urlEULA
        });
        break;
      default:
    }
  }
}
