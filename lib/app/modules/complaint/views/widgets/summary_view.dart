import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_sync_question/app/core/extensions/widget_extension.dart';
import 'package:health_sync_question/app/core/widgets/custom_button.dart';

class SummaryView extends StatelessWidget {
  final Function() onTap;

  const SummaryView({super.key, required this.onTap});

  static const Color primary = Color(0xFF3B82F6);
  static const Color primaryDark = Color(0xFF2563EB);
  static const Color surface = Colors.white;
  static const Color surfaceMuted = Color(0xFFF3F4F6);
  static const Color surfaceDark = Color(0xFF18181B);
  static const Color surfaceDarkMuted = Color(0xFF27272A);
  static const Color textMain = Color(0xFF1F2937);
  static const Color textSecondary = Color(0xFF6B7280);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                _InfoBanner(),
                const SizedBox(height: 12),
                _SummaryCard(
                  title: "Primary Reason for Visit",
                  content:
                      "Recurring migraines accompanied by nausea and sensitivity to light.",
                ),
                const SizedBox(height: 8),
                _SummaryCard(
                  title: "Duration of Symptoms",
                  content:
                      "Approximately 2 weeks, getting worse in the evenings.",
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: _SummaryCard(
                        title: "Pain Level",
                        child: Row(
                          children: const [
                            Icon(
                              Icons.sentiment_dissatisfied,
                              color: Colors.amber,
                            ),
                            SizedBox(width: 6),
                            Text(
                              "7/10",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _SummaryCard(
                        title: "Fever?",
                        child: Row(
                          children: const [
                            Icon(Icons.thermostat, color: Colors.grey),
                            SizedBox(width: 6),
                            Text(
                              "No",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                _SummaryCard(
                  title: "Current Medications",
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 6,
                    children: const [
                      _ChipLabel(label: "Ibuprofen 400mg"),
                      _ChipLabel(label: "Sumatriptan"),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                _SummaryCard(
                  title: "Known Allergies",
                  child: Row(
                    children: const [
                      Icon(Icons.warning, color: Colors.red, size: 16),
                      SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          "Penicillin, Peanuts",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                _SummaryCard(
                  title: "Additional Notes",
                  child: const Text(
                    "\"I have previously seen a neurologist in 2021 for similar issues but the symptoms were milder.\"",
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        CustomButton(text: 'Confirm Appointment', onPressed: onTap),
      ],
    );
  }
}

class _InfoBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.blue.shade100),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.info, color: Colors.blue.shade500),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Review Information",
                  style: GoogleFonts.plusJakartaSans(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "Please review your questionnaire responses before confirming your appointment with Dr. Jane Doe.",
                  style: GoogleFonts.plusJakartaSans(color: Colors.blue),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SummaryCard extends StatelessWidget {
  final String title;
  final String? content;
  final Widget? child;

  const _SummaryCard({this.title = "", this.content, this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: gray.base100),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title.toUpperCase(),
            style: GoogleFonts.plusJakartaSans(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 6),
          child ??
              Text(
                content ?? "",
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
        ],
      ),
    );
  }
}

class _ChipLabel extends StatelessWidget {
  final String label;

  const _ChipLabel({required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: const BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 6),
          Text(label, style: GoogleFonts.plusJakartaSans(fontSize: 12)),
        ],
      ),
    );
  }
}
