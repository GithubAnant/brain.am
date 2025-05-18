import 'package:brain.am/screens/PlayerScreenMain.dart';
import 'package:brain.am/widgets/CategoryChip.dart';
import 'package:brain.am/widgets/NeuralEffectButton.dart';
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

  // ignore: unused_element
  void _resetFilters() {
    setState(() {
      _selectedCategories.clear();
    });
  }

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
          BlackTint(
            containerWidth: containerWidth,
            containerHeight: containerHeight,
          ),

          BackgroundImage(
            containerWidth: containerWidth,
            containerHeight: containerHeight,
          ),


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
            child: SingleChildScrollView(
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
              
                    SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              
                    // Action buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CancelButton(),
              
                        const SizedBox(width: 10),

                        ApplyChangesButton(),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}












class ApplyChangesButton extends StatelessWidget {
  const ApplyChangesButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        // Handle apply changes action
      },
      style: TextButton.styleFrom(
        backgroundColor: Colors.deepPurple,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        padding:  EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width*0.021,
          vertical: MediaQuery.of(context).size.width*0.011,
        ),
      ),
      child: Text(
        "apply changes",
        style: GoogleFonts.montserrat(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: MediaQuery.of(context).size.width*0.011,
        ),
      ),
    );
  }
}

class CancelButton extends StatelessWidget {
  const CancelButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        
      },
      style: TextButton.styleFrom(
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
          side: const BorderSide(color: Colors.grey),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width*0.021,
          vertical: MediaQuery.of(context).size.width*0.011,
        ),
      ),
      child: Text(
        "cancel",
        style: GoogleFonts.montserrat(
          color: Colors.grey,
          fontWeight: FontWeight.w500,
          fontSize: MediaQuery.of(context).size.width*0.011,
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
