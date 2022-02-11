import 'package:flutter/material.dart';

class BottomController extends StatelessWidget {
  bool isLoginScreen;
  Function() onNext;
  Function() onSkip;
  Function() onSign;

  BottomController({
    required this.isLoginScreen,
    required this.onNext,
    required this.onSkip,
    required this.onSign,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AnimatedOpacity(
            duration: const Duration(milliseconds: 250),
            opacity: isLoginScreen ? 0 : 1,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              height: isLoginScreen ? 0 : 60,
              width: isLoginScreen ? 0 : 100,
              child: TextButton(
                onPressed: () => onSkip(),
                child: const Text(
                  'SKIP',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ),
          AnimatedOpacity(
            duration: const Duration(milliseconds: 250),
            opacity: isLoginScreen ? 1 : 0,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              height: !isLoginScreen ? 0 : 60,
              width: !isLoginScreen ? 0 : 200,
              child: FloatingActionButton.extended(
                onPressed: () => onSign(),
                label: const Text('GET STARTED'),
                backgroundColor: Colors.blue[900],
              ),
            ),
          ),
          AnimatedOpacity(
            duration: const Duration(milliseconds: 250),
            opacity: isLoginScreen ? 0 : 1,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              height: isLoginScreen ? 0 : 60,
              width: isLoginScreen ? 0 : 100,
              child: TextButton(
                onPressed: () => onNext(),
                child: Text(
                  'Next',
                  style: TextStyle(
                    color: Colors.blue[900],
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
