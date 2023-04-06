import 'package:flutter/material.dart';
//import 'package:url_launcher/url_launcher.dart';

List<String> demoBigImages = [
  "images/1.png",
  "images/2.png",
  "images/3.png",
  "images/4.png",
  "images/5.png",
  "images/6.png",
  "images/7.png",
  "images/8.png",
  "images/9.png",
  "images/10.png",
];
List<Map<String,dynamic>> demoMediumCardData =[
  {
    "name" : "Seborrheic Keratoses",
    "image" : "images/11.png",
    "des" : "Seborrheic keratoses are benign skin growths that can occur on the face and other parts of the body. They are commonly seen"
        " in older individuals and are characterized by raised, thickened patches or plaques with a waxy, scaly, or rough texture."
        ,
  },
  {
    "name" : "Psoriasis",
    "image" : "images/13.png",
    "des" : "Psoriasis is a chronic autoimmune skin condition that causes red, scaly patches on the skin, including the face."
        " It can be itchy, painful, and affect a person's appearance and self-esteem. The cause is not fully understood, "
        "but genetics and the environment play a role.",
  },
  {
    "name" : "Acne and Rosacea",
    "image" : "images/15.png",
    "des" : "Acne is a common skin condition that occurs when hair follicles become clogged with oil, dead skin cells, and bacteria. "
        "It typically appears as pimples,blackheads, whiteheads, or cysts on the face, although it can also affect other parts of the body. ",
  },
  {
    "name" : "Eczema",
    "image" : "images/12.png",
    "des" : "Eczema, also known as atopic dermatitis, is a chronic inflammatory skin condition that can affect"
        " the face and other parts of the body. It is characterized by red, itchy, and inflamed skin that may be accompanied "
        "by dryness",
  },
  {
    "name" : "Actinic Keratosis",
    "image" : "images/14.png",
    "des" : "Actinic keratosis, also known as solar keratosis, is a common skin condition that affects the face and other "
        "sun-exposed areas of the body. It is characterized by rough, scaly patches or lesions on the skin that are typically"
        " pink, red, or brown in color.",
  },
];
List<Map<String,dynamic>> demoSuggestionData =[
  {
    "class" : "0 Acne and Rosacea",
    "name" : "Acne and Rosacea",
    "image" : "images/15.png",
    "des" : "Acne is a common skin condition that occurs when hair follicles become clogged with oil, dead skin cells, and bacteria. "
        "It typically appears as pimples,blackheads, whiteheads, or cysts on the face, although it can also affect other parts of the body. Acne can be mild,"
        " moderate, or severe, and can have various causes including hormonal imbalances, genetics, diet, and lifestyle factors."
        " Acne can be physically and emotionally distressing, and it can impact one's self-esteem and confidence. Treatment options "
        "for acne include over-the-counter creams, prescription medications, lifestyle changes, and skincare routines tailored to the individual's skin type.",
  },{
    "class" : "4 Eczema",
    "name" : "Eczema",
    "image" : "images/12.png",
    "des" : "Eczema, also known as atopic dermatitis, is a chronic inflammatory skin condition that can affect"
        " the face and other parts of the body. It is characterized by red, itchy, and inflamed skin that may be accompanied "
        "by dryness, scaling, and oozing in severe cases.",
  },
  {
    "class" : "3 Seborrheic Keratoses",
    "name" : "Seborrheic Keratoses",
    "image" : "images/11.png",
    "des" : "Seborrheic keratoses are benign skin growths that can occur on the face and other parts of the body. They are commonly seen"
        " in older individuals and are characterized by raised, thickened patches or plaques with a waxy, scaly, or rough texture."
      ,
  },
  {
    "class" : "2 Psoriasis",
    "name" : "Psoriasis",
    "image" : "images/13.png",
    "des" : "Psoriasis is a chronic autoimmune skin condition that can affect the face and other parts of the body. "
        "It is characterized by the rapid overproduction of skin cells, leading to the formation of thick, red, scaly "
        "patches on the skin",
  },
  {
    "class" : "1 Actinic Keratosis",
    "name" : "Actinic Keratosis",
    "image" : "images/14.png",
    "des" : "Actinic keratosis, also known as solar keratosis, is a common skin condition that affects the face and other "
        "sun-exposed areas of the body. It is characterized by rough, scaly patches or lesions on the skin that are typically"
        " pink, red, or brown in color",
  },
  ];
List<Map<String,dynamic>> demoSupportGroup=[
  {
    "name" : "Seborrheic Keratoses",
    "image" : "images/11.png",
    "url" : 'https://www.facebook.com/groups/250497720653842/?_rdc=1&_rdr',
    "des" : "Support - Seborrheic Keratoses and other Benign Tumors",
  },
  {
    "name" : "Eczema",
    "image" : "images/12.png",
    "url" : 'https://www.facebook.com/groups/609380977381268/?_rdc=1&_rdr',
    "des" : "Support - Eczema",
  },
  {
    "name" : "Psoriasis",
    "image" : "images/13.png",
    "url" : 'https://www.facebook.com/groups/920043829098382/?_rdc=1&_rdr',
    "des" : "Support - Psoriasis, Lichen Planus and related diseases",
  },
  {
    "name" : "Actinic Keratosis",
    "image" : "images/14.png",
    "url" : 'https://www.facebook.com/groups/1185956848774605/?_rdc=1&_rdr',
    "des" : "Support - Actinic Keratosis Basal Cell Carcinoma and other Malignant Lesion",
  },
  {
    "name" : "Acne and Rosacea",
    "image" : "images/15.png",
    "url" : 'https://www.facebook.com/groups/936333070905504/?_rdc=1&_rdr',
    "des" : "Acne and Rosacea Support",
  },

];