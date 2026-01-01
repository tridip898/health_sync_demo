import 'dart:developer';

import 'package:health_sync_question/app/core/extensions/string_extension.dart';

final Map<String, dynamic> medicalData = {
  "appId": "MedicalAssistantApp",
  "version": "1.0",
  "startSection": "chief_complaint",
  "sections": {
    "chief_complaint": {
      "type": "section",
      "question": "Which area are you having health issues with?",
      "options": {
        "Head/Brain/Mental": "head_section",
        "Eye/Ear/Nose/Mouth/Throat": "ent_section",
        "Chest/Heart": "cardiac_section",
        "Respiratory": "respiratory_section",
        "Digestive/Stomach": "digestive_section",
        "Bone/Joint/Muscle": "ortho_section",
        "Urinary/Reproductive": "uro_section",
        "Skin/Hair/Nails": "derma_section",
        "General (Fever, Fatigue, etc.)": "general_section",
      },
    },

    /* ---------------- HEAD ---------------- */
    "head_section": {
      "type": "section",
      "question": "What symptom do you have?",
      "options": {
        "Headache": "headache_branch",
        "Dizziness": "dizziness_branch",
        "Memory loss": "memory_branch",
        "Sleep issue": "sleep_branch",
        "Anxiety/Depression": "anxiety_depression_branch",
        "Seizure": "seizure_branch",
      },
    },

    "headache_branch": {
      "type": "branch",
      "questions": [
        {
          "type": "single_select",
          "question": "Location of pain?",
          "options": {
            "Front": "Front",
            "Side": "Side",
            "Back": "Back",
            "Whole head": "Whole head",
          },
        },
        {
          "type": "single_select",
          "question": "Onset?",
          "options": {"Sudden": "Sudden", "Gradual": "Gradual"},
        },
        {
          "type": "single_select",
          "question": "Duration?",
          "options": {"Hours": "Hours", "Days": "Days", "Weeks": "Weeks"},
        },
        {
          "type": "single_select",
          "question": "Severity?",
          "options": {
            "Mild": "Mild",
            "Moderate": "Moderate",
            "Severe": "Severe",
          },
        },
      ],
    },

    "dizziness_branch": {
      "type": "branch",
      "questions": [
        {
          "type": "single_select",
          "question": "When does it occur?",
          "options": {
            "Standing": "Standing",
            "Sitting": "Sitting",
            "Moving": "Moving",
            "Randomly": "Randomly",
          },
        },
        {
          "type": "single_select",
          "question": "Duration of each episode?",
          "options": {
            "<1 min": "<1 min",
            "1-10 min": "1-10 min",
            ">10 min": ">10 min",
          },
        },
      ],
    },

    "memory_branch": {
      "type": "branch",
      "questions": [
        {
          "type": "single_select",
          "question": "Frequency?",
          "options": {
            "Daily": "Daily",
            "Weekly": "Weekly",
            "Occasionally": "Occasionally",
          },
        },
        {"type": "boolean", "question": "Mood changes?"},
      ],
    },

    "sleep_branch": {
      "type": "branch",
      "questions": [
        {
          "type": "single_select",
          "question": "Frequency?",
          "options": {
            "Daily": "Daily",
            "Weekly": "Weekly",
            "Occasionally": "Occasionally",
          },
        },
        {
          "type": "single_select",
          "question": "Sleep quality?",
          "options": {"Good": "Good", "Poor": "Poor", "Insomnia": "Insomnia"},
        },
      ],
    },

    "anxiety_depression_branch": {
      "type": "branch",
      "questions": [
        {
          "type": "single_select",
          "question": "What best describes your condition?",
          "options": {
            "Anxiety": "Anxiety",
            "Depression": "Depression",
            "Both": "Both",
          },
        },
        {
          "type": "single_select",
          "question": "How long have you been experiencing this?",
          "options": {
            "<1 month": "<1 month",
            "1–6 months": "1–6 months",
            ">6 months": ">6 months",
          },
        },
        {"type": "boolean", "question": "Do you experience panic attacks?"},
        {
          "type": "single_select",
          "question": "How much does it affect daily life?",
          "options": {
            "Mild": "Mild",
            "Moderate": "Moderate",
            "Severe": "Severe",
          },
        },
      ],
    },

    "seizure_branch": {
      "type": "branch",
      "questions": [
        {"type": "boolean", "question": "Is this your first seizure?"},
        {
          "type": "single_select",
          "question": "How often do seizures occur?",
          "options": {
            "Single episode": "Single episode",
            "Occasional": "Occasional",
            "Frequent": "Frequent",
          },
        },
        {
          "type": "single_select",
          "question": "Typical duration of a seizure?",
          "options": {
            "<1 minute": "<1 minute",
            "1–5 minutes": "1–5 minutes",
            ">5 minutes": ">5 minutes",
          },
        },
        {
          "type": "boolean",
          "question": "Loss of consciousness during seizure?",
        },
        {"type": "boolean", "question": "Confusion after seizure?"},
      ],
    },

    /* ---------------- ENT ---------------- */
    "ent_section": {
      "type": "section",
      "question": "Which area is affected?",
      "options": {
        "Eye": "eye_branch",
        "Ear": "ear_branch",
        "Nose": "nose_branch",
        "Mouth": "mouth_branch",
        "Throat": "throat_branch",
      },
    },

    "eye_branch": {
      "type": "branch",
      "questions": [
        {"type": "boolean", "question": "Redness?"},
        {"type": "boolean", "question": "Blurred vision?"},
      ],
    },

    "ear_branch": {
      "type": "branch",
      "questions": [
        {"type": "boolean", "question": "Pain present?"},
        {
          "type": "single_select",
          "question": "Hearing loss?",
          "options": {
            "Partial": "Partial",
            "Complete": "Complete",
            "None": "None",
          },
        },
      ],
    },

    "nose_branch": {
      "type": "branch",
      "questions": [
        {"type": "boolean", "question": "Blocked?"},
        {
          "type": "single_select",
          "question": "Duration?",
          "options": {
            "<1 week": "<1 week",
            "1-4 weeks": "1-4 weeks",
            ">4 weeks": ">4 weeks",
          },
        },
      ],
    },

    "mouth_branch": {
      "type": "branch",
      "questions": [
        {"type": "boolean", "question": "Ulcers present?"},
      ],
    },

    "throat_branch": {
      "type": "branch",
      "questions": [
        {"type": "boolean", "question": "Pain?"},
      ],
    },

    /* ---------------- CARDIAC ---------------- */
    "cardiac_section": {
      "type": "section",
      "question": "What symptom do you have?",
      "options": {
        "Chest pain": "chest_pain_branch",
        "Palpitations": "palpitation_branch",
        "Shortness of breath": "sob_branch",
      },
    },

    "chest_pain_branch": {
      "type": "branch",
      "questions": [
        {
          "type": "single_select",
          "question": "Onset?",
          "options": {"Sudden": "Sudden", "Gradual": "Gradual"},
        },
        {
          "type": "single_select",
          "question": "Radiates?",
          "options": {
            "Arm": "Arm",
            "Jaw": "Jaw",
            "Back": "Back",
            "None": "None",
          },
        },
      ],
    },

    "palpitation_branch": {
      "type": "branch",
      "questions": [
        {
          "type": "single_select",
          "question": "Frequency?",
          "options": {
            "Occasional": "Occasional",
            "Daily": "Daily",
            "Continuous": "Continuous",
          },
        },
      ],
    },

    "sob_branch": {
      "type": "branch",
      "questions": [
        {
          "type": "single_select",
          "question": "Onset of shortness of breath?",
          "options": {"Sudden": "Sudden", "Gradual": "Gradual"},
        },
        {
          "type": "single_select",
          "question": "Occurs during?",
          "options": {"Exertion": "Exertion", "Rest": "Rest", "Both": "Both"},
        },
        {"type": "boolean", "question": "Does it wake you up at night?"},
        {"type": "boolean", "question": "Leg or ankle swelling present?"},
      ],
    },

    /* ---------------- RESPIRATORY ---------------- */
    "respiratory_section": {
      "type": "section",
      "question": "What respiratory symptom do you have?",
      "options": {
        "Cough": "resp_cough_branch",
        "Shortness of breath": "resp_sob_branch",
        "Wheezing": "resp_wheeze_branch",
        "Chest tightness": "resp_tight_branch",
      },
    },

    "resp_cough_branch": {
      "type": "branch",
      "questions": [
        {
          "type": "single_select",
          "question": "Type of cough?",
          "options": {"Dry": "Dry", "Productive": "Productive"},
        },
        {
          "type": "single_select",
          "question": "Duration?",
          "options": {
            "<1 week": "<1 week",
            "1–3 weeks": "1–3 weeks",
            ">3 weeks": ">3 weeks",
          },
        },
      ],
    },

    "resp_sob_branch": {
      "type": "branch",
      "questions": [
        {
          "type": "single_select",
          "question": "Occurs during?",
          "options": {
            "Rest": "Rest",
            "Mild activity": "Mild activity",
            "Severe activity": "Severe activity",
          },
        },
      ],
    },

    "resp_wheeze_branch": {
      "type": "branch",
      "questions": [
        {"type": "text", "question": "Trigger?"},
      ],
    },

    "resp_tight_branch": {
      "type": "branch",
      "questions": [
        {
          "type": "single_select",
          "question": "Severity?",
          "options": {
            "Mild": "Mild",
            "Moderate": "Moderate",
            "Severe": "Severe",
          },
        },
      ],
    },

    /* ---------------- DIGESTIVE ---------------- */
    "digestive_section": {
      "type": "section",
      "question": "What digestive issue do you have?",
      "options": {
        "Abdominal pain": "gi_pain_branch",
        "Nausea/Vomiting": "gi_nv_branch",
        "Diarrhea": "gi_diarrhea_branch",
        "Constipation": "gi_constipation_branch",
        "Acidity": "gi_acidity_branch",
      },
    },

    "gi_pain_branch": {
      "type": "branch",
      "questions": [
        {
          "type": "single_select",
          "question": "Location?",
          "options": {"Upper": "Upper", "Lower": "Lower", "Diffuse": "Diffuse"},
        },
        {"type": "boolean", "question": "Related to food?"},
      ],
    },

    "gi_nv_branch": {
      "type": "branch",
      "questions": [
        {
          "type": "single_select",
          "question": "Frequency?",
          "options": {"Once": "Once", "Multiple times": "Multiple times"},
        },
      ],
    },

    "gi_diarrhea_branch": {
      "type": "branch",
      "questions": [
        {"type": "number", "question": "How many days?"},
      ],
    },

    "gi_constipation_branch": {
      "type": "branch",
      "questions": [
        {
          "type": "single_select",
          "question": "Duration?",
          "options": {"<1 week": "<1 week", ">1 week": ">1 week"},
        },
      ],
    },

    "gi_acidity_branch": {
      "type": "branch",
      "questions": [
        {"type": "boolean", "question": "Heartburn present?"},
      ],
    },

    /* ---------------- ORTHO ---------------- */
    "ortho_section": {
      "type": "section",
      "question": "What issue do you have?",
      "options": {
        "Joint pain": "joint_pain_branch",
        "Muscle pain": "muscle_pain_branch",
        "Back pain": "back_pain_branch",
        "Injury": "injury_branch",
      },
    },

    "joint_pain_branch": {
      "type": "branch",
      "questions": [
        {"type": "boolean", "question": "Swelling present?"},
      ],
    },

    "muscle_pain_branch": {
      "type": "branch",
      "questions": [
        {"type": "boolean", "question": "After overuse?"},
      ],
    },

    "back_pain_branch": {
      "type": "branch",
      "questions": [
        {"type": "boolean", "question": "Pain radiates?"},
      ],
    },

    "injury_branch": {
      "type": "branch",
      "questions": [
        {
          "type": "single_select",
          "question": "When occurred?",
          "options": {"Recent": "Recent", "Old": "Old"},
        },
      ],
    },

    /* ---------------- URO ---------------- */
    "uro_section": {
      "type": "section",
      "question": "What urinary/reproductive issue?",
      "options": {
        "Burning urination": "uro_burning_branch",
        "Frequency": "uro_frequency_branch",
        "Lower abdominal pain": "uro_pain_branch",
        "Discharge": "uro_discharge_branch",
      },
    },

    "uro_burning_branch": {
      "type": "branch",
      "questions": [
        {
          "type": "single_select",
          "question": "Duration?",
          "options": {"<3 days": "<3 days", ">3 days": ">3 days"},
        },
      ],
    },

    "uro_frequency_branch": {
      "type": "branch",
      "questions": [
        {"type": "boolean", "question": "Night frequency?"},
      ],
    },

    "uro_pain_branch": {
      "type": "branch",
      "questions": [
        {
          "type": "single_select",
          "question": "Severity?",
          "options": {
            "Mild": "Mild",
            "Moderate": "Moderate",
            "Severe": "Severe",
          },
        },
      ],
    },

    "uro_discharge_branch": {
      "type": "branch",
      "questions": [
        {"type": "text", "question": "Color?"},
      ],
    },

    /* ---------------- DERMA ---------------- */
    "derma_section": {
      "type": "section",
      "question": "What skin/hair/nail issue?",
      "options": {
        "Rash": "rash_branch",
        "Itching": "itching_branch",
        "Hair fall": "hairfall_branch",
        "Nail changes": "nail_branch",
      },
    },

    "rash_branch": {
      "type": "branch",
      "questions": [
        {"type": "boolean", "question": "Spreading?"},
      ],
    },

    "itching_branch": {
      "type": "branch",
      "questions": [
        {"type": "boolean", "question": "Worse at night?"},
      ],
    },

    "hairfall_branch": {
      "type": "branch",
      "questions": [
        {
          "type": "single_select",
          "question": "Duration?",
          "options": {"<1 month": "<1 month", ">1 month": ">1 month"},
        },
      ],
    },

    "nail_branch": {
      "type": "branch",
      "questions": [
        {"type": "boolean", "question": "Color change?"},
      ],
    },

    /* ---------------- GENERAL ---------------- */
    "general_section": {
      "type": "section",
      "question": "What are your main symptoms?",
      "options": {
        "Fever": "fever_branch",
        "Fatigue": "fatigue_branch",
        "Weakness": "weakness_branch",
        "Body ache": "body_ache_branch",
      },
    },

    "fever_branch": {
      "type": "branch",
      "questions": [
        {
          "type": "single_select",
          "question": "Duration?",
          "options": {"Hours": "Hours", "Days": "Days", "Weeks": "Weeks"},
        },
      ],
    },

    "fatigue_branch": {
      "type": "branch",
      "questions": [
        {
          "type": "single_select",
          "question": "Impact on daily life?",
          "options": {"Low": "Low", "Moderate": "Moderate", "High": "High"},
        },
      ],
    },

    "weakness_branch": {
      "type": "branch",
      "questions": [
        {
          "type": "single_select",
          "question": "Localized or generalized?",
          "options": {"Localized": "Localized", "Generalized": "Generalized"},
        },
      ],
    },

    "body_ache_branch": {
      "type": "branch",
      "questions": [
        {
          "type": "single_select",
          "question": "Severity?",
          "options": {
            "Mild": "Mild",
            "Moderate": "Moderate",
            "Severe": "Severe",
          },
        },
      ],
    },
  },
};

class MedicalQuestionnaire {
  final String appId;
  final String version;
  final String startSection;
  final Map<String, Section> sections;

  MedicalQuestionnaire({
    required this.appId,
    required this.version,
    required this.startSection,
    required this.sections,
  });

  factory MedicalQuestionnaire.fromJson(Map<String, dynamic> json) {
    return MedicalQuestionnaire(
      appId: json['appId'],
      version: json['version'],
      startSection: json['startSection'],
      sections: (json['sections'] as Map<String, dynamic>).map(
        (k, v) => MapEntry(k, Section.fromJson(v)),
      ),
    );
  }
}

enum InputType { singleSelect, boolean, number, text, section, branch }

class Section {
  InputType type;
  String? question;
  List<Section>? questions;
  Map<String, String>? options;
  String? answer;

  Section({
    required this.type,
    this.question,
    this.questions,
    this.options,
    this.answer,
  });

  factory Section.fromJson(Map<String, dynamic> json) {
    String snakeToCamel(String snake) {
      final parts = snake.split('_');
      return parts[0] +
          parts.skip(1).map((p) => p[0].toUpperCase() + p.substring(1)).join();
    }

    InputType parseType(String? type) {
      try {
        return InputType.values.byName(snakeToCamel(type!));
      } catch (_) {
        throw Exception('Unknown MedicalInputType: $type');
      }
    }

    return Section(
      type: parseType(json['type']),
      question: json['question'],
      questions: json['questions'] != null
          ? (json['questions'] as List).map((e) => Section.fromJson(e)).toList()
          : null,
      options: json['options'] != null && json['options'] is Map
          ? Map<String, String>.from(json['options'])
          : null,
    );
  }

  static Map<String, String?> getQuestionsAndAnswersMap(Section section) {
    final Map<String, String?> result = {};

    if (section.question != null) {
      result[section.question!] = section.answer;
    }

    return result;
  }

  @override
  String toString() {
    return 'Section{type: $type, question: $question, questions: $questions, options: $options, answer: $answer}';
  }
}

class SectionUtils {
  static Map<String, String> convertToMap(List<Section> sectionList) {
    Map<String, String> result = {};
    for (var item in sectionList) {
      if (item.question.notNullNotEmpty && item.answer.notNullNotEmpty) {
        result[item.question!] = item.answer!;
      }
    }
    return result;
  }
}
