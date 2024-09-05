import 'package:bat_theme/bat_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RollingDoorControlScreen extends StatefulWidget {
  const RollingDoorControlScreen({Key? key}) : super(key: key);

  @override
  State<RollingDoorControlScreen> createState() => _RollingDoorControlScreenState();
}

class _RollingDoorControlScreenState extends State<RollingDoorControlScreen> {
  bool _isDoorOpen = false;
  double _doorPosition = 0.0;  // Từ 0 (đóng hoàn toàn) đến 100 (mở hoàn toàn)

  @override
  Widget build(BuildContext context) {
    var theme = BatThemeData.of(context);
    
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Điều khiển cửa quấn',
          style: theme.typography.headline1.copyWith(color: theme.colors.onPrimary),
        ),
        backgroundColor: theme.colors.primary,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: theme.colors.onPrimary),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Tiêu đề chính
            Text(
              'Cửa quấn hiện tại:',
              style: theme.typography.headline1.copyWith(
                color: theme.colors.primary,
              ),
            ),
            SizedBox(height: 16.h),
            
            // Phần điều khiển cửa
            Container(
              padding: EdgeInsets.all(16.r),
              decoration: BoxDecoration(
                color: theme.colors.background,
                borderRadius: BorderRadius.circular(12.r),
                boxShadow: [
                  BoxShadow(
                    color: theme.colors.shadow.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Công tắc bật/tắt cửa
                  SwitchListTile(
                    title: Text(
                      'Cửa quấn ${_isDoorOpen ? "Mở" : "Đóng"}',
                      style: theme.typography.body1.copyWith(
                        color: theme.colors.onBackground,
                      ),
                    ),
                    value: _isDoorOpen,
                    onChanged: (bool value) {
                      setState(() {
                        _isDoorOpen = value;
                      });
                    },
                    secondary: Icon(
                      _isDoorOpen ? Icons.lock_open : Icons.lock,
                      color: theme.colors.primary,
                    ),
                  ),
                  
                  SizedBox(height: 16.h),

                  // Slider điều chỉnh vị trí cửa
                  Text(
                    'Vị trí cửa: ${_doorPosition.toStringAsFixed(0)}%',
                    style: theme.typography.body1.copyWith(
                      color: theme.colors.onBackground,
                    ),
                  ),
                  Slider(
                    value: _doorPosition,
                    min: 0,
                    max: 100,
                    divisions: 100,
                    onChanged: _isDoorOpen ? (double value) {
                      setState(() {
                        _doorPosition = value;
                      });
                    } : null,
                    activeColor: theme.colors.primary,
                    inactiveColor: theme.colors.onBackground.withOpacity(0.3),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
