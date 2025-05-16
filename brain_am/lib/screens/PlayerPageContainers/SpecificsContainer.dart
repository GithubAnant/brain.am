import 'package:brain.am/screens/PlayerScreenMain.dart';
import 'package:brain.am/widgets/PlayerContainerBackgroundImage.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remixicon/remixicon.dart';

// This enum represents the neural effect levels
enum NeuralEffectLevel { high, medium, low }

class SpecificsContainer extends StatefulWidget {
  const SpecificsContainer({super.key});

  @override
  State<SpecificsContainer> createState() => _SpecificsContainerState();
}

class _SpecificsContainerState extends State<SpecificsContainer> {
  // Controllers that can be accessed from other files
  static final List<String> categories = [
    'Rain',
    'Rainforest',
    'Thunderstorm',
    'Ambient',
    'Vintage',
    'Coding',
    'Ocean',
    'Post-rock',
    'Lofi',
    'Electronic',
  ];

  // Selected categories
  final Set<String> _selectedCategories = {};

  // Neural effect level
  static NeuralEffectLevel _neuralEffectLevel = NeuralEffectLevel.medium;

  // Get currently selected categories (can be accessed from other files)
  static Set<String> getSelectedCategories(BuildContext context) {
    return (_specificsContainerKey.currentState?._selectedCategories) ?? {};
  }

  // Get current neural effect level (can be accessed from other files)
  static NeuralEffectLevel getNeuralEffectLevel() {
    return _neuralEffectLevel;
  }

  // Set neural effect level (can be called from other files)
  static void setNeuralEffectLevel(NeuralEffectLevel level) {
    if (_specificsContainerKey.currentState != null) {
      _specificsContainerKey.currentState!._updateNeuralLevel(level);
    }
  }

  // Global key to access state from static methods
  static final GlobalKey<_SpecificsContainerState> _specificsContainerKey =
      GlobalKey<_SpecificsContainerState>();

  void _toggleCategory(String category) {
    setState(() {
      if (_selectedCategories.contains(category)) {
        _selectedCategories.remove(category);
      } else {
        _selectedCategories.add(category);
      }
    });
  }

  // void _resetFilters() {
  //   setState(() {
  //     _selectedCategories.clear();
  //   });
  // }

  void _updateNeuralLevel(NeuralEffectLevel level) {
    setState(() {
      _neuralEffectLevel = level;
    });
  }

  @override
  Widget build(BuildContext context) {
    double containerWidth = MediaQuery.of(context).size.width * 0.66;
    double containerHeight = MediaQuery.of(context).size.height * 0.8;

    return Positioned(
      left: MediaQuery.of(context).size.width * 0.18,
      top: MediaQuery.of(context).size.height * 0.08,
      child: Stack(
        children: [
          // Background Image
          BackgroundImage(
            containerWidth: containerWidth,
            containerHeight: containerHeight,
          ),

          BlackTint(containerWidth: containerWidth, containerHeight: containerHeight),

          // Glassmorphic Container
          GlassmorphicContainer(
            width: containerWidth,
            height: containerHeight,
            borderRadius: 15,
            linearGradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                const Color.fromARGB(255, 255, 255, 255).withAlpha(20),
                const Color.fromARGB(255, 255, 255, 255).withAlpha(13),
              ],
            ),
            border: 0.3,
            blur: 0,
            borderGradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                const Color.fromARGB(255, 201, 201, 201),
                const Color.fromARGB(210, 194, 194, 194),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // CATEGORIES section
                  Text(
                    "CATEGORIES",
                    style: GoogleFonts.montserrat(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Category chips in a wrapped layout
                  Wrap(
                    spacing: 8,
                    runSpacing: 10,
                    children:
                        categories.map((category) {
                          return CategoryChip(
                            category: category,
                            isSelected: _selectedCategories.contains(category),
                            onTap: () => _toggleCategory(category),
                          );
                        }).toList(),
                  ),

                  const SizedBox(height: 40),

                  // NEURAL EFFECT LEVEL section
                  Text(
                    "NEURAL EFFECT",
                    style: GoogleFonts.montserrat(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Neural effect selection buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      NeuralEffectButton(
                        level: NeuralEffectLevel.low,
                        label: "low effect",
                        description:
                            "Use this effect level if you are generally sensitive to sounds",
                        isSelected: _neuralEffectLevel == NeuralEffectLevel.low,
                        onTap: () => _updateNeuralLevel(NeuralEffectLevel.low),
                      ),
                      NeuralEffectButton(
                        level: NeuralEffectLevel.medium,
                        label: "medium effect",
                        description:
                            "Our standard level of neural phase locking",
                        isSelected:
                            _neuralEffectLevel == NeuralEffectLevel.medium,
                        onTap:
                            () => _updateNeuralLevel(NeuralEffectLevel.medium),
                      ),
                      NeuralEffectButton(
                        level: NeuralEffectLevel.high,
                        label: "high effect",
                        description:
                            "Try the strongest level for extra stimulation",
                        isSelected:
                            _neuralEffectLevel == NeuralEffectLevel.high,
                        onTap: () => _updateNeuralLevel(NeuralEffectLevel.high),
                      ),
                    ],
                  ),

                  const SizedBox(height: 40),

                  // Total Uptime section
                  Text(
                    "TOTAL UPTIME",
                    style: GoogleFonts.montserrat(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 15),

                  // Fixed time display
                  Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(color: Colors.grey.withAlpha(77)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        "10:00",
                        style: GoogleFonts.lato(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),

                  const Spacer(),

                  // Action buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          // Handle cancel action
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                            side: const BorderSide(color: Colors.grey),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 15,
                          ),
                        ),
                        child: Text(
                          "cancel",
                          style: GoogleFonts.montserrat(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      ),

                      TextButton(
                        onPressed: () {
                          // Handle apply changes action
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.deepPurple,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 15,
                          ),
                        ),
                        child: Text(
                          "apply changes",
                          style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Reusable Category Chip Widget
class CategoryChip extends StatelessWidget {
  final String category;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryChip({
    super.key,
    required this.category,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        decoration: BoxDecoration(
          color:
              isSelected
                  ? const Color.fromARGB(255, 55, 46, 114)
                  : const Color.fromARGB(148, 55, 46, 114),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? Colors.deepPurple.shade300 : Colors.transparent,
            width: 1,
          ),
        ),
        child: Text(
          category,
          style: GoogleFonts.montserrat(
            color: isSelected ? Colors.white : Colors.grey,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}

// Neural Effect Button Widget
class NeuralEffectButton extends StatelessWidget {
  final NeuralEffectLevel level;
  final String label;
  final String description;
  final bool isSelected;
  final VoidCallback onTap;

  const NeuralEffectButton({
    super.key,
    required this.level,
    required this.label,
    required this.description,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.2,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color:
              isSelected
                  ? const Color.fromARGB(255, 55, 46, 114)
                  : const Color.fromARGB(60, 55, 46, 114),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: isSelected ? Colors.deepPurple.shade300 : Colors.transparent,
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon and label row
            Row(
              children: [
                Icon(
                  RemixIcons.menu_line,
                  color: isSelected ? Colors.white : Colors.grey,
                  size: 18,
                ),
                const SizedBox(width: 8),
                Text(
                  label,
                  style: GoogleFonts.montserrat(
                    color: isSelected ? Colors.white : Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            // Description text
            Text(
              description,
              style: GoogleFonts.lato(
                color: isSelected ? Colors.white70 : Colors.grey,
                fontSize: 12,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

// This class provides static access to the SpecificsContainer controllers
class SpecificsController {
  // Get currently selected categories
  static Set<String> getSelectedCategories(BuildContext context) {
    return _SpecificsContainerState.getSelectedCategories(context);
  }

  // Get current neural effect level
  static NeuralEffectLevel getNeuralEffectLevel() {
    return _SpecificsContainerState.getNeuralEffectLevel();
  }

  // Set neural effect level
  static void setNeuralEffectLevel(NeuralEffectLevel level) {
    _SpecificsContainerState.setNeuralEffectLevel(level);
  }
}
