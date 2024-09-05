import 'package:bat_theme/bat_theme.dart';  // Import theme package để sử dụng custom theme.
import 'package:flutter/material.dart';  // Import Flutter Material Design.
import 'package:flutter_screenutil/flutter_screenutil.dart';  // Import để hỗ trợ kích thước màn hình linh hoạt.
import 'package:provider/provider.dart';  // Import provider để quản lý state.
import 'package:smarty/main.dart';  // Import file main của ứng dụng.

import '../../../../core/navigation/navigator.dart';  // Import navigator để điều hướng trong app.
import '../../../devices/domain/models/devices.dart';  // Import model `Device`.
import '../../../../utils/enums.dart';  // Import enums để quản lý kiểu dữ liệu dạng liệt kê.

class DeviceCard extends StatefulWidget {
  final Device device;  // Biến `device` để chứa thông tin của thiết bị.
  
  const DeviceCard({
    Key? key,
    required this.device,
  }) : super(key: key);

  @override
  State<DeviceCard> createState() => _DeviceCardState();  // Tạo state cho `DeviceCard`.
}

class _DeviceCardState extends State<DeviceCard> {
  @override
  Widget build(BuildContext context) {
    // Lấy dữ liệu theme từ `BatThemeData` (custom theme).
    var theme = BatThemeData.of(context);

    // Lấy dữ liệu từ `ThemeProvider` để xác định trạng thái `Dark Mode`.
    var provider = context.read<ThemeProvider>();

    return GestureDetector(
      // Điều hướng đến trang chi tiết của thiết bị khi nhấn vào card.
      onTap: () => AppNavigator.pushNamed(
          widget.device.type.routeName,  // Lấy route name từ device type.
          arguments: widget.device),  // Truyền đối tượng `device` làm đối số.

      // Widget `Container` để chứa các thông tin của `device`.
      child: Container(
        padding: EdgeInsets.all(16.r),  // Padding bên trong container.
        margin: EdgeInsets.only(right: 16.w),  // Khoảng cách bên ngoài của container.
        decoration: BoxDecoration(
          // Màu nền thay đổi tùy theo chế độ sáng/tối.
          color: theme.colors.secondary.withOpacity(provider.isDark ? 1 : 0.1),
          borderRadius: BorderRadius.circular(6.r),  // Bo tròn viền container.
        ),

        // Bố trí theo cột dọc để hiển thị các thông tin của thiết bị.
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,  // Căn lề trái cho các thành phần.
          children: [
            // Hàng đầu tiên gồm icon và switch để bật/tắt thiết bị.
            Row(
              children: [
                // Icon của thiết bị, nếu không có thì dùng mặc định.
                Image.asset(
                  widget.device.type.icon ?? 'assets/icons/ac.png',
                  width: 48.w,  // Đặt kích thước icon.
                ),
                SizedBox(width: 32.w),  // Khoảng cách giữa icon và switch.

                // Switch để bật/tắt trạng thái của thiết bị.
                Switch.adaptive(
                  activeColor: theme.colors.primary,  // Màu khi switch bật.
                  value: widget.device.active,  // Trạng thái hiện tại của thiết bị.
                  onChanged: (bool v) {
                    // Cập nhật trạng thái thiết bị khi switch thay đổi.
                    setState(() {
                      widget.device.active = v;
                    });
                  },
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,  // Giảm kích thước tap target của switch.
                ),
              ],
            ),
            SizedBox(height: 32.h),  // Khoảng cách giữa hàng trên và thông tin thiết bị.

            // Hiển thị tên thiết bị.
            Text(
              widget.device.name ?? widget.device.type.name,  // Nếu không có tên thì dùng tên loại thiết bị.
              style: theme.typography.bodyCopy.copyWith(color: BatPalette.grey),  // Kiểu chữ của theme.
            ),
            SizedBox(height: 4.h),  // Khoảng cách giữa tên và phòng.

            // Hiển thị tên phòng mà thiết bị đang đặt.
            Text(
              widget.device.room,  // Tên phòng của thiết bị.
              style: theme.typography.subtitle.copyWith(color: BatPalette.grey60),  // Kiểu chữ với màu xám nhạt.
            )
          ],
        ),
      ),
    );
  }
}
