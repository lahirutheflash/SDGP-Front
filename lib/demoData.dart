import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:url_launcher/url_launcher.dart';

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
    "name" : "Acne",
    "image" : "images/1.png",
    "des" : "Acne Acne Acne Acne Acne Acne Acne Acne",
  },
  {
    "name" : "Acne 1",
    "image" : "images/5.png",
    "des" : "Acne1 Acne1 Acne1 Acne1 Acne1 Acne1 Acne1 Acne1",
  },
  {
    "name" : "Acne 2",
    "image" : "images/10.png",
    "des" : "Acne2 Acne2 Acne2 Acne2 Acne2 Acne2 Acne2 Acne2",
  },
];
List<Map<String,dynamic>> demoSupportGroup=[
  {
    "name" : "Seborrheic Keratoses",
    "image" : "images/1.png",
    "url" : "https://www.google.com",
    "des" : "Support - Seborrheic Keratoses and other Benign Tumors",
  },
  {
    "name" : "Eczema",
    "image" : "images/1.png",
    "url" : "https://www.google.com",
    "des" : "Support - Eczema",
  },
  {
    "name" : "Psoriasis",
    "image" : "images/1.png",
    "url" : "https://www.google.com",
    "des" : "Support - Psoriasis, Lichen Planus and related diseases",
  },
  {
    "name" : "Actinic Keratosis",
    "image" : "images/1.png",
    "url" : "https://www.google.com",
    "des" : "Support - Actinic Keratosis Basal Cell Carcinoma and other Malignant Lesion",
  },
  {
    "name" : "Acne and Rosacea",
    "image" : "images/1.png",
    "url" : "https://www.google.com",
    "des" : "Acne and Rosacea Support",
  },

];