import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/create_profile_controller.dart';

class CreateProfileView extends GetView<CreateProfileController> {
  const CreateProfileView({super.key});

  static const background = Color(0xFFF6F8F7);
  static const primary = Color(0xFF13ECA4);
  static const primaryDark = Color(0xFF0BB57D);
  static const textMain = Color(0xFF0D1B17);
  static const borderColor = Color(0xFFE5E7EB);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                _TopNav(),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(24, 24, 24, 140),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _Headline(),
                        const SizedBox(height: 32),
                        _ProfilePhoto(),
                        const SizedBox(height: 40),
                        _Form(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const _BottomButton(),
          ],
        ),
      ),
    );
  }
}

class _TopNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
      decoration: const BoxDecoration(
        color: CreateProfileView.background,
        border: Border(
          bottom: BorderSide(color: CreateProfileView.borderColor),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios_new),
                onPressed: () => Navigator.pop(context),
              ),
              Expanded(
                child: Text(
                  'Create Profile',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.manrope(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: CreateProfileView.textMain,
                  ),
                ),
              ),
              const SizedBox(width: 40),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _ProgressDot(active: true),
              _ProgressDot(),
              _ProgressDot(),
            ],
          ),
        ],
      ),
    );
  }
}

class _ProgressDot extends StatelessWidget {
  final bool active;

  const _ProgressDot({this.active = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 6,
      width: 32,
      decoration: BoxDecoration(
        color: active ? CreateProfileView.primary : Colors.grey.shade300,
        borderRadius: BorderRadius.circular(999),
      ),
    );
  }
}

class _Headline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Let's set you up",
          style: GoogleFonts.manrope(
            fontSize: 30,
            fontWeight: FontWeight.w800,
            color: CreateProfileView.textMain,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          "Please enter your details to personalize your medical experience.",
          textAlign: TextAlign.center,
          style: GoogleFonts.manrope(fontSize: 16, color: Colors.grey.shade600),
        ),
      ],
    );
  }
}

class _ProfilePhoto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 128,
              width: 128,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 4),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    'https://lh3.googleusercontent.com/aida-public/AB6AXuBv_Q5_BHGvAl1trpMuqAPmduORF7ZiC6R9iVQ0J8HLYR5VaGf54YQd0VJNcC5zcTfAubM-PkDOUUtKoKCgjREn1t_VeKpaOuKt-3ZOL-5V_thcweF7VgsZ3-qceGNx_BWAiejY745eN5C-WHBp3FDv8Z1XWPVB6D-RJxRh7LV2aMHxklPLO5o1g3SSRncdtU7N7FDURAvycfp16RE1iEI6g_LnK-ndaHhyn8hfUEJZu-QeTwcnr1wkNmc2mfSPGQ29sJ6ZEaD_kIw',
                  ),
                ),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 12)],
              ),
            ),
            Positioned(
              bottom: 4,
              right: 4,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: CreateProfileView.primary,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.photo_camera, size: 20),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          'Edit Photo',
          style: GoogleFonts.manrope(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: CreateProfileView.primary,
          ),
        ),
      ],
    );
  }
}

class _Form extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _InputField(label: 'Full Name', hint: 'e.g. Sarah Williams'),
        const SizedBox(height: 24),
        _GenderSelector(),
        const SizedBox(height: 24),
        _InputField(
          label: 'Date of Birth',
          isDate: true,
          icon: Icons.calendar_month,
        ),
        const SizedBox(height: 24),
        _InputField(
          label: 'Address',
          hint: 'e.g. 123 Health Street, NY',
          icon: Icons.location_on,
        ),
        const SizedBox(height: 24),
        const Divider(),
        const SizedBox(height: 12),
        _ContactHeader(),
        const SizedBox(height: 16),
        _InputField(
          label: 'Public Phone Number',
          hint: '+1 (555) 000-0000',
          icon: Icons.call,
        ),
        const SizedBox(height: 24),
        _InputField(
          label: 'Public Email',
          hint: 'sarah@example.com',
          icon: Icons.mail,
        ),
      ],
    );
  }
}

class _InputField extends StatelessWidget {
  final String label;
  final String? hint;
  final IconData? icon;
  final bool isDate;

  const _InputField({
    required this.label,
    this.hint,
    this.icon,
    this.isDate = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.manrope(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.grey.shade700,
          ),
        ),
        const SizedBox(height: 6),
        TextField(
          readOnly: isDate,
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: icon != null ? Icon(icon, color: Colors.grey) : null,
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(vertical: 18),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(color: Colors.grey.shade200),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: const BorderSide(color: CreateProfileView.primary),
            ),
          ),
        ),
      ],
    );
  }
}

class _GenderSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Gender',
          style: GoogleFonts.manrope(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.grey.shade700,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: const [
            Expanded(child: _GenderChip(label: 'Female', selected: true)),
            SizedBox(width: 8),
            Expanded(child: _GenderChip(label: 'Male')),
            SizedBox(width: 8),
            Expanded(child: _GenderChip(label: 'Other')),
          ],
        ),
      ],
    );
  }
}

class _GenderChip extends StatelessWidget {
  final String label;
  final bool selected;

  const _GenderChip({required this.label, this.selected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: selected
            ? CreateProfileView.primary.withOpacity(0.2)
            : Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: selected ? CreateProfileView.primary : Colors.grey.shade300,
        ),
      ),
      child: Center(
        child: Text(
          label,
          style: GoogleFonts.manrope(
            fontWeight: FontWeight.w600,
            color: CreateProfileView.textMain,
          ),
        ),
      ),
    );
  }
}

class _ContactHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.lock, color: CreateProfileView.primary, size: 20),
        const SizedBox(width: 8),
        Text(
          'Contact Info',
          style: GoogleFonts.manrope(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        Text(
          'Encrypted & Secure',
          style: GoogleFonts.manrope(fontSize: 12, color: Colors.grey),
        ),
      ],
    );
  }
}

class _BottomButton extends StatelessWidget {
  const _BottomButton();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: CreateProfileView.borderColor)),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: CreateProfileView.primary,
            foregroundColor: CreateProfileView.textMain,
            padding: const EdgeInsets.symmetric(vertical: 18),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            elevation: 4,
          ),
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Continue',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 8),
              Icon(Icons.arrow_forward),
            ],
          ),
        ),
      ),
    );
  }
}
