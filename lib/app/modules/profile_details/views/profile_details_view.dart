import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_details_controller.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileDetailsView extends GetView<ProfileDetailsController> {
  const ProfileDetailsView({super.key});

  static const Color primary = Color(0xFF13ECA4);
  static const Color background = Color(0xFFF6F8F7);
  static const Color textMain = Color(0xFF0D1B17);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: background,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          color: textMain,
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Profile Details',
          style: GoogleFonts.manrope(
            fontWeight: FontWeight.w700,
            color: textMain,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 120),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _ProfileHeader(),
                const SizedBox(height: 24),
                _SectionTitle(
                  icon: Icons.person,
                  title: 'Personal Information',
                ),
                const SizedBox(height: 12),
                Row(
                  children: const [
                    Expanded(
                      child: _InfoCard(
                        label: 'Gender',
                        icon: Icons.female,
                        value: 'Female',
                      ),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: _InfoCard(
                        label: 'Date of Birth',
                        icon: Icons.cake,
                        value: 'Jan 24, 1995',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                _AddressCard(),
                const SizedBox(height: 24),
                _SectionTitle(
                  icon: Icons.contact_phone,
                  title: 'Contact Details',
                  trailing: _VerifiedChip(),
                ),
                const SizedBox(height: 12),
                const _ContactCard(
                  icon: Icons.call,
                  label: 'Public Phone',
                  value: '+1 (555) 000-0000',
                ),
                const SizedBox(height: 12),
                const _ContactCard(
                  icon: Icons.mail,
                  label: 'Public Email',
                  value: 'sarah@example.com',
                ),
              ],
            ),
          ),
          _BottomAction(),
        ],
      ),
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 64,
          backgroundColor: Colors.grey.shade300,
          backgroundImage: const NetworkImage(
            'https://lh3.googleusercontent.com/aida-public/AB6AXuBv_Q5_BHGvAl1trpMuqAPmduORF7ZiC6R9iVQ0J8HLYR5VaGf54YQd0VJNcC5zcTfAubM-PkDOUUtKoKCgjREn1t_VeKpaOuKt-3ZOL-5V_thcweF7VgsZ3-qceGNx_BWAiejY745eN5C-WHBp3FDv8Z1XWPVB6D-RJxRh7LV2aMHxklPLO5o1g3SSRncdtU7N7FDURAvycfp16RE1iEI6g_LnK-ndaHhyn8hfUEJZu-QeTwcnr1wkNmc2mfSPGQ29sJ6ZEaD_kIw',
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Sarah Williams',
          style: GoogleFonts.manrope(
            fontSize: 22,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Patient ID: #883921',
          style: GoogleFonts.manrope(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget? trailing;

  const _SectionTitle({
    required this.icon,
    required this.title,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: ProfileDetailsView.primary),
        const SizedBox(width: 8),
        Text(
          title,
          style: GoogleFonts.manrope(
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
        ),
        const Spacer(),
        if (trailing != null) trailing!,
      ],
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String label;
  final IconData icon;
  final String value;

  const _InfoCard({
    required this.label,
    required this.icon,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label.toUpperCase(),
            style: GoogleFonts.manrope(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(icon, size: 18, color: Colors.grey),
              const SizedBox(width: 6),
              Text(
                value,
                style: GoogleFonts.manrope(fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _AddressCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'ADDRESS',
            style: GoogleFonts.manrope(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: ProfileDetailsView.primary.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.location_on,
                  color: ProfileDetailsView.primary,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  '123 Health Street, Apt 4B\nNew York, NY 10001',
                  style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w600,
                    height: 1.4,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ContactCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _ContactCard({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _cardDecoration(),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: ProfileDetailsView.primary.withOpacity(0.15),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: ProfileDetailsView.primary),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: GoogleFonts.manrope(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: GoogleFonts.manrope(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _VerifiedChip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(0.15),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        'Verified',
        style: GoogleFonts.manrope(
          fontSize: 10,
          fontWeight: FontWeight.w700,
          color: Colors.green.shade700,
        ),
      ),
    );
  }
}

class _BottomAction extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          border: Border(
            top: BorderSide(color: Colors.grey.shade200),
          ),
        ),
        child: SizedBox(
          height: 56,
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: ProfileDetailsView.textMain,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {},
            icon: const Icon(Icons.edit),
            label: Text(
              'Edit Profile',
              style: GoogleFonts.manrope(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

BoxDecoration _cardDecoration() {
  return BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12),
    border: Border.all(color: Colors.grey.shade200),
    boxShadow: const [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 8,
        offset: Offset(0, 4),
      ),
    ],
  );
}