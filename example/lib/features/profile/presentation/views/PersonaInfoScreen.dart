import 'package:flutter/material.dart';

class PersonalInfoScreen extends StatelessWidget {
  const PersonalInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context); // Lấy theme từ ứng dụng

    return Scaffold(
      appBar: AppBar(
        title: const Text("Thông tin cá nhân"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/avatar_placeholder.png'), // Avatar placeholder
              ),
            ),
            const SizedBox(height: 20),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 2,
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                leading: const Icon(Icons.person, color: Colors.blue),
                title: const Text("Tên"),
                subtitle: const Text("Nguyễn Văn A"),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 2,
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                leading: const Icon(Icons.email, color: Colors.red),
                title: const Text("Email"),
                subtitle: const Text("nguyenvana@example.com"),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 2,
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: ListTile(
                leading: const Icon(Icons.phone, color: Colors.green),
                title: const Text("Số điện thoại"),
                subtitle: const Text("+84 123 456 789"),
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  // Thêm chức năng chỉnh sửa thông tin cá nhân tại đây
                },
                icon: const Icon(Icons.edit, color: Colors.white),
                label: const Text("Chỉnh sửa thông tin"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.primaryColor, // Màu nút từ theme
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
