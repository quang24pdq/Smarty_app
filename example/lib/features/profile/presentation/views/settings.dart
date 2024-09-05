import 'package:bat_theme/bat_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:smarty/core/navigation/navigator.dart';
import 'package:smarty/features/profile/presentation/views/AccountSecurityScreen.dart';
import 'package:smarty/features/profile/presentation/views/PersonaInfoScreen.dart';
import 'package:smarty/features/profile/presentation/widgets/settings_tile.dart';
import 'package:smarty/main.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = BatThemeData.of(context);
    var provider = context.read<ThemeProvider>();

    return Scaffold(
      backgroundColor: theme.colors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 32.h),
                Row(
                  children: [
                    if (AppNavigator.canPop)
                      GestureDetector(
                        onTap: () => AppNavigator.pop(),
                        child: const Icon(Icons.arrow_back_ios),
                      ),
                    Expanded(
                      child: Center(
                        child: Text(
                          'Cài đặt',
                          style: theme.typography.headline4,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24.h),
                // Cài đặt điều hướng cho các SettingsTile
                SettingsTile(
                  title: 'Thông tin cá nhân',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const PersonalInfoScreen()),
                    );
                  },
                ),
                SettingsTile(
                  title: 'Tài khoản và bảo mật',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AccountSecurityScreen()),
                    );
                  },
                ),
                SettingsTile(
                  title: 'Thông báo ứng dụng',
                  onTap: () {
                    // Điều hướng đến trang cài đặt thông báo
                  },
                ),
                SettingsTile(
                  title: 'Kích hoạt chế độ an toàn',
                  onTap: () {
                    // Điều hướng đến trang cài đặt chế độ an toàn
                  },
                ),
                SettingsTile(
                  title: 'Dark Mode',
                  onTap: () {
                    // Điều hướng đến trang cài đặt Dark Mode
                  },
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        provider.isDark ? 'mở' : 'đóng',
                        style: theme.typography.bodyCopy.copyWith(
                          color: theme.colors.tertiary.withOpacity(0.6),
                        ),
                      ),
                      SizedBox(width: 8.w),
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 14,
                      ),
                    ],
                  ),
                ),
                SettingsTile(
                  title: 'Đơn vị nhiệt độ',
                  onTap: () {
                    // Điều hướng đến trang cài đặt đơn vị nhiệt độ
                  },
                ),
                SettingsTile(
                  title: 'Cài đặt quyền riêng tư',
                  onTap: () {
                    // Điều hướng đến trang cài đặt quyền riêng tư
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
