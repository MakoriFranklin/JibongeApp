import 'package:flutter/material.dart';
import 'package:foma/widgets/answers_box.dart';
import 'package:foma/utils/colors.dart';
import 'package:foma/widgets/features.dart';
import 'package:foma/services/geminiAI.dart';
import 'package:foma/widgets/textField.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class ChatBotPage extends StatefulWidget {
  const ChatBotPage({super.key});

  @override
  State<ChatBotPage> createState() => _ChatBotPageState();
}

class _ChatBotPageState extends State<ChatBotPage> {
  final speechToText = SpeechToText();
  String lastWords = '';
  final OpenAI openAIService = OpenAI();
  final _promptFormKey = GlobalKey<FormState>();
  final TextEditingController promptController = TextEditingController();
  String generatedResult = '';

  @override
  void initState() {
    super.initState();
    initSpeechToText();
  }

  Future<void> initSpeechToText() async {
    await speechToText.initialize();
    setState(() {});
  }

  Future<void> startListening() async {
    await speechToText.listen(onResult: onSpeechResult);
    setState(() {});
  }

  Future<void> stopListening() async {
    await speechToText.stop();
    setState(() {});
  }

  void onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      lastWords = result.recognizedWords;
    });
  }

  @override
  void dispose() {
    super.dispose();
    speechToText.stop();
    promptController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBarColor,
        title: const Text(
          "Jibonge AI",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (await speechToText.hasPermission && speechToText.isNotListening) {
            await startListening();
          } else if (speechToText.isListening) {
            await openAIService.isArtPromptAPI(lastWords);
            print('lastWords: $lastWords');
            await stopListening();
          } else {
            initSpeechToText();
          }
        },
        child: const Icon(Icons.mic),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Center(
                      child: CircleAvatar(
                        foregroundColor: Colors.pink,
                        radius: 50,
                        child: Image.asset(
                          'assets/images/bot.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    AnswersBox(generatedResult: generatedResult),
                    const SizedBox(
                      height: 10,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Features',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Column(
                      children: [
                        Features(
                          featureColor: AppColors.firstSuggestionBoxColor,
                          featureTitle: 'Insant Answers',
                          featureDesc: 'Get answers to any question in seconds',
                        ),
                        Features(
                          featureColor: AppColors.thirdSuggestionBoxColor,
                          featureTitle: 'Voice Assistance',
                          featureDesc:
                              'Use your voice to get answers to any question in seconds!',
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              border: Border(top: BorderSide(color: Colors.grey)),
              color: AppColors.appBackgroundColor,
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: promptController,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: 'Type your question...',
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                  ),
                ),
                IconButton(
                  style: const ButtonStyle(
                      iconColor: WidgetStatePropertyAll(Colors.white)),
                  icon: const Icon(Icons.send),
                  onPressed: () async {
                    generatedResult =
                        await openAIService.gemini(promptController.text);
                    setState(() {
                      promptController.clear();
                    });
                    print(generatedResult);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
