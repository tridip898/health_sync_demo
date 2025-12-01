final Map<String, dynamic> medicalData = {
  "MedicalAssistantApp": {
    "Start": {
      "BasicInfo": {
        "questions": [
          {"question": "What is your full name?"},
          {"question": "What is your age?"},
          {
            "question": "What is your gender?",
            "options": ["Male", "Female", "Other"],
          },
          {"question": "Where are you located?"},
          {
            "question": "How long have you had this problem?",
            "options": ["Hours", "Days", "Weeks", "Months"],
          },
        ],
      },
      "ChiefComplaint": {
        "question": "Which area are you having health issues with?",
        "options": {
          "Head/Brain/Mental": {
            "questions": [
              {
                "question": "What symptom do you have?",
                "options": [
                  "Headache",
                  "Dizziness",
                  "Memory loss",
                  "Sleep issue",
                  "Anxiety/Depression",
                  "Seizure",
                ],
              },
            ],
            "branches": {
              "Headache": {
                "questions": [
                  {
                    "question": "Location of pain?",
                    "options": ["Front", "Side", "Back", "Whole head"],
                  },
                  {
                    "question": "Onset?",
                    "options": ["Sudden", "Gradual"],
                  },
                  {
                    "question": "Duration?",
                    "options": ["Hours", "Days", "Weeks"],
                  },
                  {
                    "question": "Severity?",
                    "options": ["Mild", "Moderate", "Severe"],
                  },
                  {
                    "question": "Associated symptoms?",
                    "options": [
                      "Nausea",
                      "Vomiting",
                      "Vision problems",
                      "Light sensitivity",
                      "None",
                    ],
                  },
                  {
                    "question": "Triggers?",
                    "options": ["Stress", "Food", "Exercise", "Unknown"],
                  },
                ],
              },
              "Dizziness": {
                "questions": [
                  {
                    "question": "When does it occur?",
                    "options": ["Standing", "Sitting", "Moving", "Randomly"],
                  },
                  {
                    "question": "Duration of each episode?",
                    "options": ["<1 min", "1-10 min", ">10 min"],
                  },
                  {
                    "question": "Associated symptoms?",
                    "options": ["Fainting", "Nausea", "Vomiting", "None"],
                  },
                ],
              },
              "Memory loss": {
                "questions": [
                  {
                    "question": "Frequency?",
                    "options": ["Daily", "Weekly", "Occasionally"],
                  },
                  {
                    "question": "Mood changes?",
                    "options": ["Yes", "No"],
                  },
                ],
              },
              "Sleep issues": {
                "questions": [
                  {
                    "question": "Frequency?",
                    "options": ["Daily", "Weekly", "Occasionally"],
                  },
                  {
                    "question": "Sleep quality?",
                    "options": ["Good", "Poor", "Insomnia"],
                  },
                  {
                    "question": "Mood changes?",
                    "options": ["Yes", "No"],
                  },
                  {
                    "question": "Stress level?",
                    "options": ["Low", "Moderate", "High"],
                  },
                ],
              },
            },
            "DoctorSuggestion": ["Neurologist", "Psychiatrist"],
          },

          "Eye/Ear/Nose/Mouth/Throat": {
            "questions": [
              {
                "question": "Which area is affected?",
                "options": ["Eye", "Ear", "Nose", "Mouth", "Throat"],
              },
            ],
            "branches": {
              "Eye": {
                "questions": [
                  {
                    "question": "Redness?",
                    "options": ["Yes", "No"],
                  },
                  {
                    "question": "Pain level?",
                    "options": ["Mild", "Moderate", "Severe"],
                  },
                  {
                    "question": "Blurred vision?",
                    "options": ["Yes", "No"],
                  },
                  {
                    "question": "Discharge?",
                    "options": ["Yes", "No"],
                  },
                  {
                    "question": "Onset?",
                    "options": ["Sudden", "Gradual"],
                  },
                ],
              },
              "Ear": {
                "questions": [
                  {
                    "question": "Pain present?",
                    "options": ["Yes", "No"],
                  },
                  {
                    "question": "Discharge?",
                    "options": ["Yes", "No"],
                  },
                  {
                    "question": "Hearing loss?",
                    "options": ["Partial", "Complete", "None"],
                  },
                  {
                    "question": "Ringing in ears?",
                    "options": ["Yes", "No"],
                  },
                  {
                    "question": "Recent cold or swimming?",
                    "options": ["Yes", "No"],
                  },
                ],
              },
              "Nose": {
                "questions": [
                  {
                    "question": "Blocked?",
                    "options": ["Yes", "No"],
                  },
                  {
                    "question": "Runny?",
                    "options": ["Yes", "No"],
                  },
                  {
                    "question": "Sneezing?",
                    "options": ["Yes", "No"],
                  },
                  {
                    "question": "Bleeding?",
                    "options": ["Yes", "No"],
                  },
                  {
                    "question": "Duration?",
                    "options": ["<1 week", "1-4 weeks", ">4 weeks"],
                  },
                ],
              },
              "Mouth/Throat": {
                "questions": [
                  {
                    "question": "Pain?",
                    "options": ["Yes", "No"],
                  },
                  {
                    "question": "Ulcers present?",
                    "options": ["Yes", "No"],
                  },
                  {
                    "question": "Difficulty swallowing?",
                    "options": ["Yes", "No"],
                  },
                  {
                    "question": "Bad breath?",
                    "options": ["Yes", "No"],
                  },
                  {
                    "question": "Associated fever or cough?",
                    "options": ["Yes", "No"],
                  },
                ],
              },
            },
            "DoctorSuggestion": [
              "ENT Specialist",
              "Ophthalmologist",
              "Dentist",
            ],
          },

          "Chest/Heart": {
            "questions": [
              {
                "question": "What symptom do you have?",
                "options": [
                  "Chest pain",
                  "Palpitations",
                  "Shortness of breath",
                ],
              },
            ],
            "branches": {
              "Chest pain": {
                "questions": [
                  {
                    "question": "Onset?",
                    "options": ["Sudden", "Gradual"],
                  },
                  {
                    "question": "Nature?",
                    "options": ["Sharp", "Dull", "Pressure", "Burning"],
                  },
                  {
                    "question": "Radiates?",
                    "options": ["Arm", "Jaw", "Back", "None"],
                  },
                  {
                    "question": "Triggered by exertion?",
                    "options": ["Yes", "No"],
                  },
                  {
                    "question": "Associated sweating/nausea?",
                    "options": ["Yes", "No"],
                  },
                ],
              },
              "Palpitations": {
                "questions": [
                  {
                    "question": "Frequency?",
                    "options": ["Occasional", "Daily", "Continuous"],
                  },
                  {
                    "question": "Irregular heartbeat?",
                    "options": ["Yes", "No"],
                  },
                  {
                    "question": "Associated dizziness?",
                    "options": ["Yes", "No"],
                  },
                ],
              },
            },
            "DoctorSuggestion": ["Cardiologist"],
          },

          "Respiratory": {
            "questions": [
              {
                "question": "What symptom do you have?",
                "options": [
                  "Cough",
                  "Shortness of breath",
                  "Wheezing",
                  "Chest tightness",
                ],
              },
            ],
            "branches": {
              "Cough": {
                "questions": [
                  {
                    "question": "Type?",
                    "options": ["Dry", "Mucus", "Blood-stained"],
                  },
                  {
                    "question": "Duration?",
                    "options": ["<1 week", "1-4 weeks", ">4 weeks"],
                  },
                  {
                    "question": "Associated fever?",
                    "options": ["Yes", "No"],
                  },
                  {
                    "question": "Weight loss?",
                    "options": ["Yes", "No"],
                  },
                ],
              },
              "Shortness of breath": {
                "questions": [
                  {
                    "question": "Onset?",
                    "options": ["Sudden", "Gradual"],
                  },
                  {
                    "question": "Occurs during?",
                    "options": ["Exertion", "Rest", "Both"],
                  },
                  {
                    "question": "Nighttime attacks?",
                    "options": ["Yes", "No"],
                  },
                ],
              },
            },
            "DoctorSuggestion": ["Pulmonologist"],
          },

          "Digestive/Stomach": {
            "questions": [
              {
                "question": "What symptom do you have?",
                "options": [
                  "Abdominal pain",
                  "Nausea",
                  "Vomiting",
                  "Diarrhea",
                  "Constipation",
                  "Bloating",
                ],
              },
            ],
            "branches": {
              "Abdominal pain": {
                "questions": [
                  {
                    "question": "Location?",
                    "options": [
                      "Upper",
                      "Lower",
                      "Left",
                      "Right",
                      "Whole abdomen",
                    ],
                  },
                  {
                    "question": "Relation to food?",
                    "options": ["Before eating", "After eating", "No relation"],
                  },
                  {
                    "question": "Duration?",
                    "options": ["Hours", "Days", "Weeks"],
                  },
                  {
                    "question": "Associated symptoms?",
                    "options": ["Vomiting", "Fever", "Bloating", "None"],
                  },
                ],
              },
              "Diarrhea/Constipation": {
                "questions": [
                  {
                    "question": "Frequency?",
                    "options": ["Daily", "Weekly", "Occasionally"],
                  },
                  {
                    "question": "Blood/mucus in stool?",
                    "options": ["Yes", "No"],
                  },
                  {
                    "question": "Abdominal cramps?",
                    "options": ["Yes", "No"],
                  },
                ],
              },
            },
            "DoctorSuggestion": ["Gastroenterologist"],
          },

          "Bone/Joint/Muscle": {
            "questions": [
              {
                "question": "What symptom do you have?",
                "options": [
                  "Joint pain",
                  "Muscle pain",
                  "Bone pain",
                  "Swelling",
                ],
              },
            ],
            "branches": {
              "Joint pain": {
                "questions": [
                  {
                    "question": "Which joint?",
                    "options": ["Knee", "Shoulder", "Wrist", "Other"],
                  },
                  {
                    "question": "Duration?",
                    "options": ["Days", "Weeks", "Months"],
                  },
                  {
                    "question": "Swelling or redness?",
                    "options": ["Yes", "No"],
                  },
                  {
                    "question": "Morning stiffness?",
                    "options": ["Yes", "No"],
                  },
                ],
              },
              "Muscle pain": {
                "questions": [
                  {
                    "question": "Localized or generalized?",
                    "options": ["Localized", "Generalized"],
                  },
                  {
                    "question": "After exercise?",
                    "options": ["Yes", "No"],
                  },
                ],
              },
            },
            "DoctorSuggestion": ["Orthopedist", "Rheumatologist"],
          },

          "Urinary/Reproductive": {
            "questions": [
              {
                "question": "What type of issue?",
                "options": [
                  "Urinary",
                  "Female reproductive",
                  "Male reproductive",
                ],
              },
            ],
            "branches": {
              "Urinary": {
                "questions": [
                  {
                    "question": "Pain during urination?",
                    "options": ["Yes", "No"],
                  },
                  {
                    "question": "Frequency?",
                    "options": ["Normal", "Frequent", "Urgent"],
                  },
                  {
                    "question": "Blood in urine?",
                    "options": ["Yes", "No"],
                  },
                  {
                    "question": "Fever or back pain?",
                    "options": ["Yes", "No"],
                  },
                ],
              },
              "Female reproductive": {
                "questions": [
                  {
                    "question": "Irregular periods?",
                    "options": ["Yes", "No"],
                  },
                  {
                    "question": "Painful periods?",
                    "options": ["Yes", "No"],
                  },
                  {
                    "question": "Vaginal discharge?",
                    "options": ["Yes", "No"],
                  },
                  {
                    "question": "Pregnancy concern?",
                    "options": ["Yes", "No"],
                  },
                ],
              },
              "Male reproductive": {
                "questions": [
                  {
                    "question": "Discharge?",
                    "options": ["Yes", "No"],
                  },
                  {
                    "question": "Erectile issue?",
                    "options": ["Yes", "No"],
                  },
                  {
                    "question": "Testicular pain?",
                    "options": ["Yes", "No"],
                  },
                ],
              },
            },
            "DoctorSuggestion": ["Urologist", "Gynecologist", "Andrologist"],
          },

          "Skin/Hair/Nails": {
            "questions": [
              {
                "question": "What is your main concern?",
                "options": ["Rash/Itching", "Hair loss", "Nail changes"],
              },
            ],
            "branches": {
              "Rash/Itching": {
                "questions": [
                  {
                    "question": "Duration?",
                    "options": ["<1 week", "1-4 weeks", ">4 weeks"],
                  },
                  {
                    "question": "Spreading?",
                    "options": ["Yes", "No"],
                  },
                  {
                    "question": "Associated allergy or infection?",
                    "options": ["Yes", "No"],
                  },
                ],
              },
              "Hair loss": {
                "questions": [
                  {
                    "question": "Type?",
                    "options": ["Patchy", "Diffuse"],
                  },
                  {
                    "question": "Recent stress or illness?",
                    "options": ["Yes", "No"],
                  },
                ],
              },
              "Nail changes": {
                "questions": [
                  {
                    "question": "Color/shape/brittleness changes?",
                    "options": ["Yes", "No"],
                  },
                  {
                    "question": "Associated skin problem?",
                    "options": ["Yes", "No"],
                  },
                ],
              },
            },
            "DoctorSuggestion": ["Dermatologist"],
          },

          "General (Fever, Fatigue, etc..)": {
            "questions": [
              {
                "question": "What are your main symptoms?",
                "options": ["Fever", "Fatigue", "Weakness", "Body ache"],
              },
            ],
            "branches": {
              "Fever": {
                "questions": [
                  {
                    "question": "Onset?",
                    "options": ["Sudden", "Gradual"],
                  },
                  {
                    "question": "Duration?",
                    "options": ["Hours", "Days", "Weeks"],
                  },
                  {
                    "question": "Associated symptoms?",
                    "options": ["Chills", "Sweating", "Rash", "Cough", "None"],
                  },
                ],
              },
              "Fatigue": {
                "questions": [
                  {
                    "question": "Duration?",
                    "options": ["Days", "Weeks", "Months"],
                  },
                  {
                    "question": "Impact on daily life?",
                    "options": ["Low", "Moderate", "High"],
                  },
                  {
                    "question": "Associated sleep/mood issues?",
                    "options": ["Yes", "No"],
                  },
                ],
              },
              "Weakness": {
                "questions": [
                  {
                    "question": "Localized or generalized?",
                    "options": ["Localized", "Generalized"],
                  },
                  {
                    "question": "Associated numbness/pain?",
                    "options": ["Yes", "No"],
                  },
                ],
              },
              "Body ache": {
                "questions": [
                  {
                    "question": "Location?",
                    "options": ["Whole body", "Specific area"],
                  },
                  {
                    "question": "Severity?",
                    "options": ["Mild", "Moderate", "Severe"],
                  },
                  {
                    "question": "Relation to activity?",
                    "options": ["Yes", "No"],
                  },
                ],
              },
            },
            "DoctorSuggestion": ["General Physician"],
          },
        },
      },
    },
    "SummaryAndFollowUp": {
      "steps": [
        "Summarize patient's symptoms",
        "Ask if other body parts are affected (Yes/No)",
        "Generate probable condition summary",
        "Recommend doctor specialty",
        "Assign urgency level: Emergency / Visit Soon / Online Consult",
        "Ask to book appointment: Yes/No",
        "Preferred mode: Online / In-person",
        "Show nearest or online doctor options",
      ],
    },
  },
};
