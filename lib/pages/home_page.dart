// ignore: file_names
import 'package:flutter/material.dart';
import '/components/main_app_bar.dart'; // ตรวจสอบว่า path ตรงกับโครงสร้างโฟลเดอร์ของคุณ

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Color primaryColor = const Color(0xFFF7931E);
  final Color textColor = const Color(0xFF6B3E19);

  final Map<int, double> _buttonScales = {0: 1.0, 1: 1.0, 2: 1.0};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(title: 'เติมใจเติมสุข'),
      backgroundColor: const Color(0xFFFFF6E9),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 24.0,
              horizontal: 16.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // TOP MENU BUTTONS
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildCircleButton(
                        0, Icons.play_circle_fill, 'ดูคลิปสุขภาพ', '/videos'),
                    _buildCircleButton(
                        1, Icons.edit_note, 'บันทึกสุขภาพ', '/health-log'),
                    _buildCircleButton(
                      2,
                      Icons.medical_services,
                      'ปรึกษาแพทย์',
                    ),
                  ],
                ),

                const SizedBox(height: 32),

                Text(
                  'ยินดีต้อนรับ',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                ),

                const SizedBox(height: 20),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 60,
                      vertical: 18,
                    ),
                    shape: const StadiumBorder(),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'เริ่มใช้งานฟรี',
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  ),
                ),

                const SizedBox(height: 40),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.95),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ข้อมูลสุขภาพ',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: textColor,
                        ),
                      ),
                      const SizedBox(height: 16),
                      _buildHealthRow('ความดันโลหิต', '128/80 มม.ปรอท'),
                      const SizedBox(height: 12),
                      _buildHealthRow('น้ำตาลในเลือด', '95 มก./ดล.'),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                const Text(
                  'อย่าลืมบันทึกสุขภาพวันนี้นะครับ',
                  style: TextStyle(fontSize: 20, color: Colors.black54),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, '/health-log');
                  },
                  icon: const Icon(Icons.add),
                  label: const Text(
                    'เพิ่มข้อมูลสุขภาพ',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 28,
                      vertical: 14,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),

                const SizedBox(height: 48),
              ],
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: primaryColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Icon(Icons.favorite, size: 40, color: Colors.white),
                  SizedBox(height: 8),
                  Text(
                    'เมนูหลัก',
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  ),
                ],
              ),
            ),
            _buildDrawerItem(Icons.home, 'หน้าแรก', '/'),
            _buildDrawerItem(Icons.edit_note, 'บันทึกสุขภาพ', '/health-log'),
            _buildDrawerItem(
                Icons.notifications_active, 'แจ้งเตือนยา', '/medication'),
            _buildDrawerItem(Icons.play_circle_fill, 'ดูคลิปสุขภาพ', '/videos'),
            _buildDrawerItem(Icons.medical_services, 'ปรึกษาแพทย์'),
            _buildDrawerItem(Icons.bar_chart, 'รายงานย้อนหลัง', '/report'),
            _buildDrawerItem(Icons.picture_as_pdf, 'ดาวน์โหลด PDF', '/report'),
            _buildDrawerItem(Icons.settings, 'ตั้งค่าผู้ใช้งาน'),
          ],
        ),
      ),
    );
  }

  Widget _buildCircleButton(int index, IconData icon, String label,
      [String? route]) {
    return Column(
      children: [
        GestureDetector(
          onTapDown: (_) => setState(() => _buttonScales[index] = 0.9),
          onTapUp: (_) {
            setState(() => _buttonScales[index] = 1.0);
            // เพิ่ม logic เมื่อคลิกจริง
          },
          onTapCancel: () => setState(() => _buttonScales[index] = 1.0),
          child: AnimatedScale(
            scale: _buttonScales[index] ?? 1.0,
            duration: const Duration(milliseconds: 100),
            child: Material(
              shape: const CircleBorder(),
              color: Colors.white,
              elevation: 3,
              child: InkWell(
                customBorder: const CircleBorder(),
                splashColor: Colors.orangeAccent.withOpacity(0.3),
                onTap: () {
                  if (route != null) {
                    Navigator.pushNamed(context, route);
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Icon(icon, size: 30, color: primaryColor),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(fontSize: 18, color: Colors.black87),
        ),
      ],
    );
  }

  Widget _buildHealthRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(fontSize: 20)),
        Text(
          value,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildDrawerItem(IconData icon, String title, [String? route]) {
    return ListTile(
      leading: Icon(icon, color: primaryColor),
      title: Text(title, style: const TextStyle(fontSize: 18)),
      onTap: () {
        Navigator.pop(context);
        if (route != null) {
          Navigator.pushNamed(context, route);
        }
      },
    );
  }
}
