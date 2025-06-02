import 'package:flutter/material.dart';

class SettingsTile extends StatelessWidget {
  final String label;
  final IconData icon;
  final Function onTap;

  const SettingsTile({super.key, required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => onTap(),
      contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      leading: Icon(
        icon,
        size: 28,
        color: Colors.yellow[300],
      ),
      title: Text(
        label,
        style: TextStyle(
          color: Colors.grey[100],
          fontSize: 18,
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios_outlined,
        size: 10,
        color: Colors.grey[500],
      ),
    );
  }
}
