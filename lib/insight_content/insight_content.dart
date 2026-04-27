import 'package:flutter/material.dart';
import 'styles.dart';
import 'remedy_step_widget.dart';

class InsightContent extends StatelessWidget {
  final String classification;

  const InsightContent({
    Key? key,
    required this.classification,
    required String label,
  }) : super(key: key);

  Widget _buildInsightContent(String classPrediction) {
    switch (classPrediction) {
      case "Diarrhea":
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: AppStyles.mediumSpacing),
            const Text(
              "DESCRIPTION",
              style: AppStyles.titleStyle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppStyles.smallSpacing),
            RichText(
              textAlign: TextAlign.justify,
              text: const TextSpan(
                style: AppStyles.bodyStyle,
                children: [
                  TextSpan(
                    text: '• ',
                    style: AppStyles.bulletStyle,
                  ),
                  TextSpan(
                    text:
                        "Liquid, soft pile with no form, stinky, and voluminous. If your pup's poop is liquid or shapeless, it may indicate dietary issues.",
                    style: TextStyle(fontFamily: 'Inter2'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppStyles.largeSpacing),
            const Text(
              "REMEDIES",
              style: AppStyles.titleStyle,
              textAlign: TextAlign.center,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: AppStyles.mediumSpacing),
                const Center(
                  child: Text(
                    'HERBAL REMEDIES',
                    style: AppStyles.subtitleStyle,
                  ),
                ),
                const SizedBox(height: AppStyles.mediumSpacing),
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      'assets/images/Plain Pumpkin.jpg',
                      width: 250,
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: AppStyles.smallSpacing),
                RichText(
                  textAlign: TextAlign.justify,
                  text: const TextSpan(
                    style: AppStyles.bodyStyle,
                    children: [
                      TextSpan(
                        text: '• ',
                        style: AppStyles.bulletStyle,
                      ),
                      TextSpan(
                        text:
                            "Plain Pumpkin is a nutritional powerhouse that serves as a low-calorie treat (80 calories per cup) and helps with both constipation and diarrhea.",
                        style: TextStyle(fontFamily: 'Inter2'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppStyles.largeSpacing),
                const Center(
                  child: Text(
                    'HOW TO USE PUMPKIN',
                    style: AppStyles.subtitleStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                const Column(
                  children: [
                    RemedyStepWidget(
                      stepTitle: '1. Choose the Right Pumpkin',
                      stepDescription:
                          "Use 100% pure pumpkin. Avoid added sugars and spices.",
                      icon: Icons.local_offer,
                    ),
                    RemedyStepWidget(
                      stepTitle: '2. Determine the Correct Amount',
                      stepDescription:
                          "Give based on size: Small: 1-2 tsp, Medium: 1-3 tbsp, Large: 2-5 tbsp.",
                      icon: Icons.scale,
                    ),
                    RemedyStepWidget(
                      stepTitle: '3. Prepare Canned Pumpkin',
                      stepDescription:
                          "Open can, measure amount, and store leftovers in the fridge.",
                      icon: Icons.recommend,
                    ),
                    RemedyStepWidget(
                      stepTitle: '4. Prepare Fresh Pumpkin',
                      stepDescription:
                          "Wash, cut, boil, mash, and store for up to 4 days.",
                      icon: Icons.fastfood,
                    ),
                    RemedyStepWidget(
                      stepTitle: '5. Serve the Pumpkin',
                      stepDescription:
                          "Ensure it's cool, mix with food, and watch for reactions.",
                      icon: Icons.food_bank,
                    ),
                  ],
                ),
                const SizedBox(height: AppStyles.largeSpacing),
                const Center(
                  child: Text(
                    'OVER THE COUNTER REMEDIES',
                    style: AppStyles.subtitleStyle,
                  ),
                ),
                const SizedBox(height: AppStyles.mediumSpacing),
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      'assets/images/Loperamide.jpg',
                      width: 250,
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: AppStyles.smallSpacing),
                RichText(
                  textAlign: TextAlign.justify,
                  text: const TextSpan(
                    style: AppStyles.bodyStyle,
                    children: [
                      TextSpan(
                        text: '• ',
                        style: AppStyles.bulletStyle,
                      ),
                      TextSpan(
                        text:
                            "Loperamide (Imodium) is an over-the-counter medication that reduces intestinal motility, helping to control diarrhea.",
                        style: TextStyle(fontFamily: 'Inter2'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppStyles.largeSpacing),
                const Center(
                  child: Text(
                    'HOW TO USE LOPERAMIDE',
                    style: AppStyles.subtitleStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                const Column(
                  children: [
                    RemedyStepWidget(
                      stepTitle: '1. Determine Dosage',
                      stepDescription:
                          "Administer 1 mg of loperamide for every 10 pounds of your dog’s weight.",
                      icon: Icons.local_offer,
                    ),
                    RemedyStepWidget(
                      stepTitle: '2. Administer the Medication',
                      stepDescription:
                          "Give the medication directly or mix it with food for easier ingestion.",
                      icon: Icons.medication,
                    ),
                    RemedyStepWidget(
                      stepTitle: '3. Monitor Your Dog',
                      stepDescription:
                          "Keep an eye on your dog for any signs of constipation or lethargy.",
                      icon: Icons.visibility,
                    ),
                    RemedyStepWidget(
                      stepTitle: '4. Evaluate After 24 Hours',
                      stepDescription:
                          "If diarrhea continues for more than 24 hours, consider seeking further veterinary advice.",
                      icon: Icons.access_time,
                    ),
                  ],
                ),
                const SizedBox(height: AppStyles.largeSpacing),
                const Center(
                  child: Text(
                    'REFERENCES',
                    style: AppStyles.subtitleStyle,
                  ),
                ),
                const SizedBox(height: AppStyles.smallSpacing),
                RichText(
                  textAlign: TextAlign.justify,
                  text: const TextSpan(
                    style: AppStyles.bodyStyle,
                    children: [
                      TextSpan(
                        text: '• ',
                        style: AppStyles.bulletStyle,
                      ),
                      TextSpan(
                        text:
                            "The Farmer’s Dog. (2024, May 21). Dog diarrhea treatment: Home remedies for diarrhea and upset stomach. https://www.thefarmersdog.com/digest/what-to-give-dogs-for-diarrhea/",
                        style: TextStyle(fontFamily: 'Inter2'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppStyles.smallSpacing),
                RichText(
                  textAlign: TextAlign.justify,
                  text: const TextSpan(
                    style: AppStyles.bodyStyle,
                    children: [
                      TextSpan(
                        text: '• ',
                        style: AppStyles.bulletStyle,
                      ),
                      TextSpan(
                        text:
                            "Johnstone, G. (2024, March 5). Imodium (Loperamide) for dogs: uses, side effects, and alternatives. American Kennel Club. https://www.akc.org/expert-advice/health/imodium-for-dogs/",
                        style: TextStyle(fontFamily: 'Inter2'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        );

      case "Lack of Water":
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: AppStyles.mediumSpacing),
            const Text(
              "DESCRIPTION",
              style: AppStyles.titleStyle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppStyles.smallSpacing),
            RichText(
              textAlign: TextAlign.justify,
              text: const TextSpan(
                style: AppStyles.bodyStyle,
                children: [
                  TextSpan(
                    text: '• ',
                    style: AppStyles.bulletStyle,
                  ),
                  TextSpan(
                    text:
                        "Hard pellets, Lumpy sausage, Dry and crumbly, Usually signals constipation caused by dehydration, Fiber deficiency, or other issues.",
                    style: TextStyle(fontFamily: 'Inter2'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppStyles.largeSpacing),
            const Text(
              "REMEDIES",
              style: AppStyles.titleStyle,
              textAlign: TextAlign.center,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: AppStyles.mediumSpacing),
                const Center(
                  child: Text(
                    'HERBAL REMEDIES',
                    style: AppStyles.subtitleStyle,
                  ),
                ),
                const SizedBox(height: AppStyles.mediumSpacing),
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      'assets/images/Olive Oil.png',
                      width: 250,
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: AppStyles.smallSpacing),
                RichText(
                  textAlign: TextAlign.justify,
                  text: const TextSpan(
                    style: AppStyles.bodyStyle,
                    children: [
                      TextSpan(
                        text: '• ',
                        style: AppStyles.bulletStyle,
                      ),
                      TextSpan(
                        text:
                            "Olive Oil is a healthy fat that can aid in hydration and digestion for dogs. It contains beneficial monounsaturated fats and antioxidants, making it a nutritious addition to their diet.",
                        style: TextStyle(fontFamily: 'Inter2'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppStyles.largeSpacing),
                const Center(
                  child: Text(
                    'HOW TO USE OLIVE OIL',
                    style: AppStyles.subtitleStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                const Column(
                  children: [
                    RemedyStepWidget(
                      stepTitle: '1. Determine Amount',
                      stepDescription:
                          "Start with a small amount based on your dog’s size; generally, 1 teaspoon for small dogs and up to 1 tablespoon for larger dogs.",
                      icon: Icons.assignment,
                    ),
                    RemedyStepWidget(
                      stepTitle: '2. Mix with Food',
                      stepDescription: "Add the olive oil to your dog's food.",
                      icon: Icons.kitchen,
                    ),
                    RemedyStepWidget(
                      stepTitle: '3. Increase Gradually',
                      stepDescription:
                          "If necessary, you can gradually increase the amount until you notice an improvement.",
                      icon: Icons.trending_up,
                    ),
                    RemedyStepWidget(
                      stepTitle: '4. Monitor',
                      stepDescription:
                          "Watch for any signs of diarrhea, as too much can cause digestive upset.",
                      icon: Icons.visibility,
                    ),
                  ],
                ),
                const SizedBox(height: AppStyles.largeSpacing),
                const Center(
                  child: Text(
                    'OVER THE COUNTER REMEDIES',
                    style: AppStyles.subtitleStyle,
                  ),
                ),
                const SizedBox(height: AppStyles.mediumSpacing),
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      'assets/images/Probiotics.png',
                      width: 250,
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: AppStyles.smallSpacing),
                RichText(
                  textAlign: TextAlign.justify,
                  text: const TextSpan(
                    style: AppStyles.bodyStyle,
                    children: [
                      TextSpan(
                        text: '• ',
                        style: AppStyles.bulletStyle,
                      ),
                      TextSpan(
                        text:
                            "Probiotics are beneficial live microorganisms that promote digestive health in dogs by restoring the natural balance of gut bacteria. They help improve digestion, support the immune system, reduce diarrhea, and enhance nutrient absorption.",
                        style: TextStyle(fontFamily: 'Inter2'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppStyles.largeSpacing),
                const Center(
                  child: Text(
                    'HOW TO USE PROBIOTICS',
                    style: AppStyles.subtitleStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                const Column(
                  children: [
                    RemedyStepWidget(
                      stepTitle: '1. Choose the Right Probiotic',
                      stepDescription:
                          "Select a product formulated specifically for dogs, containing beneficial strains like Lactobacillus and Bifidobacterium.",
                      icon: Icons.shopping_cart,
                    ),
                    RemedyStepWidget(
                      stepTitle: '2. Follow Dosage Instructions',
                      stepDescription:
                          "Refer to the packaging for dosage recommendations based on your dog’s weight and health.",
                      icon: Icons.receipt_long,
                    ),
                    RemedyStepWidget(
                      stepTitle: '3. Administering Probiotics',
                      stepDescription:
                          "Probiotics can be administered by mixing powdered forms with food, giving treat-based probiotics, or opening capsules to mix with food or giving them whole.",
                      icon: Icons.medical_services,
                    ),
                    RemedyStepWidget(
                      stepTitle: '4. Monitor Your Dog',
                      stepDescription:
                          "Observe for any changes in digestion or behavior after starting probiotics.",
                      icon: Icons.monitor_heart,
                    ),
                    RemedyStepWidget(
                      stepTitle: '5. Consult Your Veterinarian',
                      stepDescription:
                          "Always check with your vet before introducing new supplements, especially if your dog has health issues.",
                      icon: Icons.local_hospital,
                    ),
                  ],
                ),
                const SizedBox(height: AppStyles.largeSpacing),
                const Center(
                  child: Text(
                    'REFERENCES',
                    style: AppStyles.subtitleStyle,
                  ),
                ),
                const SizedBox(height: AppStyles.smallSpacing),
                RichText(
                  textAlign: TextAlign.justify,
                  text: const TextSpan(
                    style: AppStyles.bodyStyle,
                    children: [
                      TextSpan(
                        text: '• ',
                        style: AppStyles.bulletStyle,
                      ),
                      TextSpan(
                        text:
                            "Johnson, A. (2024, March 19). 10 home Remedies for dog constipation - Wedgewood Pharmacy. Veterinary Pharmacy for Compounded Pet Medications. Retrieved October 13, 2024, from https://www.wedgewood.com/blog/10-home-remedies-for-dog-constipation/",
                        style: TextStyle(fontFamily: 'Inter2'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        );

      case "Normal":
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: AppStyles.mediumSpacing),
            const Text(
              "DESCRIPTION",
              style: AppStyles.titleStyle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppStyles.smallSpacing),
            RichText(
              textAlign: TextAlign.justify,
              text: const TextSpan(
                style: AppStyles.bodyStyle,
                children: [
                  TextSpan(
                    text: '• ',
                    style: AppStyles.bulletStyle,
                  ),
                  TextSpan(
                    text:
                        "Firm, sausage-shaped poops with a smooth texture and slight segmentation are ideal. These easy-to-scoop, less-stinky poops indicate a healthy diet and proper nutrient absorption in dogs.",
                    style: TextStyle(fontFamily: 'Inter2'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppStyles.largeSpacing),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: AppStyles.mediumSpacing),
                const Center(
                  child: Text(
                    'SUGGESTIONS',
                    style: AppStyles.titleStyle,
                  ),
                ),
                const Column(
                  children: [
                    RemedyStepWidget(
                      stepTitle: '1. Balanced Diet',
                      stepDescription:
                          "Maintain a consistent, high-quality diet to keep your dog's digestive system stable and healthy.",
                      icon: Icons.food_bank,
                    ),
                    RemedyStepWidget(
                      stepTitle: '2. Regular Exercise',
                      stepDescription:
                          "Ensure your dog gets daily physical activity to promote good digestion and reduce stress.",
                      icon: Icons.directions_run,
                    ),
                    RemedyStepWidget(
                      stepTitle: '3. Low-Stress Environment',
                      stepDescription:
                          "Keep your dog's environment calm to prevent stool-related issues.",
                      icon: Icons.self_improvement,
                    ),
                    RemedyStepWidget(
                      stepTitle: '4. Monitor with the "Four Cs"',
                      stepDescription:
                          "Color, consistency, content, and coating are key indicators of health. Any significant changes lasting more than 24-48 hours may require veterinary attention.",
                      icon: Icons.fact_check,
                    ),
                  ],
                ),
                const SizedBox(height: AppStyles.largeSpacing),
                const Center(
                  child: Text(
                    'REFERENCES',
                    style: AppStyles.subtitleStyle,
                  ),
                ),
                const SizedBox(height: AppStyles.smallSpacing),
                RichText(
                  textAlign: TextAlign.justify,
                  text: const TextSpan(
                    style: AppStyles.bodyStyle,
                    children: [
                      TextSpan(
                        text: '• ',
                        style: AppStyles.bulletStyle,
                      ),
                      TextSpan(
                        text:
                            "Ltd, W. (2021, August 1). Healthy dog poop chart. Beco. https://www.becopets.com/blogs/news/healthy-dog-poo-chart?srsltid=AfmBOoqZbcbGGl31A0Jktx50zUlKePWPYFleBE9oLLJidlG1nTvG9aSS",
                        style: TextStyle(fontFamily: 'Inter2'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        );

      case "Not a Feces":
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: AppStyles.mediumSpacing),
            const Text(
              "DESCRIPTION",
              style: AppStyles.titleStyle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppStyles.smallSpacing),
            RichText(
              textAlign: TextAlign.justify,
              text: const TextSpan(
                style: AppStyles.bodyStyle,
                children: [
                  TextSpan(
                    text: '• ',
                    style: AppStyles.bulletStyle,
                  ),
                  TextSpan(
                    text:
                        "Please make sure that the image you captured or upload clearly shows a dog's feces for accurate analysis.",
                    style: TextStyle(fontFamily: 'Inter2'),
                  ),
                ],
              ),
            ),
          ],
        );

      case "Soft Poop":
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: AppStyles.mediumSpacing),
            const Text(
              "DESCRIPTION",
              style: AppStyles.titleStyle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppStyles.smallSpacing),
            RichText(
              textAlign: TextAlign.justify,
              text: const TextSpan(
                style: AppStyles.bodyStyle,
                children: [
                  TextSpan(
                    text: '• ',
                    style: AppStyles.bulletStyle,
                  ),
                  TextSpan(
                    text:
                        "Soft, smelly poops that lose form often result from a processed, starchy diet or lack of fiber, leading to poor digestion and bacterial fermentation.",
                    style: TextStyle(fontFamily: 'Inter2'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppStyles.largeSpacing),
            const Text(
              "REMEDIES",
              style: AppStyles.titleStyle,
              textAlign: TextAlign.center,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: AppStyles.mediumSpacing),
                const Center(
                  child: Text(
                    'HERBAL REMEDIES',
                    style: AppStyles.subtitleStyle,
                  ),
                ),
                const SizedBox(height: AppStyles.mediumSpacing),
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      'assets/images/Psyllium Husk.jpg',
                      width: 250,
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: AppStyles.smallSpacing),
                RichText(
                  textAlign: TextAlign.justify,
                  text: const TextSpan(
                    style: AppStyles.bodyStyle,
                    children: [
                      TextSpan(
                        text: '• ',
                        style: AppStyles.bulletStyle,
                      ),
                      TextSpan(
                        text:
                            "Psyllium husk is a natural, soluble fiber derived from the seeds of the Plantago ovata plant. It helps regulate digestion by absorbing excess liquid and bulking up stool, making it effective for both diarrhea and constipation in dogs.",
                        style: TextStyle(fontFamily: 'Inter2'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppStyles.largeSpacing),
                const Center(
                  child: Text(
                    'HOW TO USE PSYLLIUM HUSK',
                    style: AppStyles.subtitleStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                const Column(
                  children: [
                    RemedyStepWidget(
                      stepTitle: '1. Determine the Right Amount',
                      stepDescription:
                          "Use 1/4 teaspoon for small dogs and up to 1 teaspoon for larger dogs.",
                      icon: Icons.balance,
                    ),
                    RemedyStepWidget(
                      stepTitle: '2. Mix with Food',
                      stepDescription:
                          "Add psyllium husk to wet or moistened food for easier digestion.",
                      icon: Icons.blender,
                    ),
                    RemedyStepWidget(
                      stepTitle: '3. Monitor Your Dog',
                      stepDescription:
                          "Keep an eye on stool consistency and digestion after using it.",
                      icon: Icons.monitor_heart,
                    ),
                    RemedyStepWidget(
                      stepTitle: '4. Gradually Adjust',
                      stepDescription:
                          "Adjust the amount as needed based on your dog’s response, ensuring they drink enough water",
                      icon: Icons.tune,
                    ),
                    RemedyStepWidget(
                      stepTitle: '5. Consult a Veterinarian',
                      stepDescription:
                          "Seek vet advice if using regularly, especially for dogs with health conditions.",
                      icon: Icons.medical_information,
                    ),
                  ],
                ),
                const SizedBox(height: AppStyles.largeSpacing),
                const Center(
                  child: Text(
                    'OVER THE COUNTER REMEDIES',
                    style: AppStyles.subtitleStyle,
                  ),
                ),
                const SizedBox(height: AppStyles.mediumSpacing),
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      'assets/images/Probiotics.png',
                      width: 250,
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: AppStyles.smallSpacing),
                RichText(
                  textAlign: TextAlign.justify,
                  text: const TextSpan(
                    style: AppStyles.bodyStyle,
                    children: [
                      TextSpan(
                        text: '• ',
                        style: AppStyles.bulletStyle,
                      ),
                      TextSpan(
                        text:
                            "Probiotics are beneficial live microorganisms that promote digestive health in dogs by restoring the natural balance of gut bacteria. They help improve digestion, support the immune system, reduce diarrhea, and enhance nutrient absorption.",
                        style: TextStyle(fontFamily: 'Inter2'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppStyles.largeSpacing),
                const Center(
                  child: Text(
                    'HOW TO USE PROBIOTICS',
                    style: AppStyles.subtitleStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                const Column(
                  children: [
                    RemedyStepWidget(
                      stepTitle: '1. Choose Wisely',
                      stepDescription:
                          "Select a probiotic with a variety of strains (at least 10) or species-appropriate strains.",
                      icon: Icons.check_circle,
                    ),
                    RemedyStepWidget(
                      stepTitle: '2. Follow Dosage Instructions',
                      stepDescription:
                          "Administer the recommended amount based on your dog’s weight and the product’s guidelines.",
                      icon: Icons.medication,
                    ),
                    RemedyStepWidget(
                      stepTitle: '3. Monitor Your Dog',
                      stepDescription:
                          "Observe for any improvements in digestion or stool consistency.",
                      icon: Icons.analytics,
                    ),
                    RemedyStepWidget(
                      stepTitle: '4. Adjust as Needed:',
                      stepDescription:
                          "If no improvement is seen, consider discontinuing or switching to a different probiotic.",
                      icon: Icons.settings,
                    ),
                    RemedyStepWidget(
                      stepTitle: '5. Short-Term Use',
                      stepDescription:
                          "Do not continue giving probiotics long-term once your dog has recovered.",
                      icon: Icons.timer,
                    ),
                  ],
                ),
                const SizedBox(height: AppStyles.largeSpacing),
                const Center(
                  child: Text(
                    'REFERENCES',
                    style: AppStyles.subtitleStyle,
                  ),
                ),
                const SizedBox(height: AppStyles.smallSpacing),
                RichText(
                  textAlign: TextAlign.justify,
                  text: const TextSpan(
                    style: AppStyles.bodyStyle,
                    children: [
                      TextSpan(
                        text: '• ',
                        style: AppStyles.bulletStyle,
                      ),
                      TextSpan(
                        text:
                            "Chong, S. (2023, July 25). Soft dog poop remedies. Vanillapup. https://vanillapup.com/blogs/tips-and-guides/soft-dog-poop-remedies?srsltid=AfmBOoqbucRaPOmcMTJ1hpw6XxUxRMfzFo9M9pMV0ePJk7n-QcqSD4Oa",
                        style: TextStyle(fontFamily: 'Inter2'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        );

      default:
        return const SizedBox(); // Return an empty widget if no match is found
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: _buildInsightContent(classification),
    );
  }
}
