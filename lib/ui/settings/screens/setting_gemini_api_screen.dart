import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:leafy/logic/cubit/setting_gemini/setting_gemini_cubit.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingGeminiApiScreen extends StatefulWidget {
  const SettingGeminiApiScreen({super.key});

  @override
  State<SettingGeminiApiScreen> createState() => _SettingGeminiApiScreenState();
}

class _SettingGeminiApiScreenState extends State<SettingGeminiApiScreen> {
  final TextEditingController _controller = TextEditingController();
  bool _isObscure = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingGeminiCubit, SettingGeminiState>(
      listener: (context, state) {
        if (state.error != null) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Lỗi: ${state.error}')));
        }
        if (_controller.text.isEmpty && state.apiKey != null) {
          _controller.text = state.apiKey!;
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: const Text('Cấu hình Gemini API')),
          body: state.isLoading && state.availableModels.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : SettingsList(
                  sections: [
                    SettingsSection(
                      title: const Text('API Key'),
                      tiles: [
                        CustomSettingsTile(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Nhập Gemini API Key của bạn để sử dụng tính năng dịch AI.',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                const SizedBox(height: 10),
                                TextField(
                                  controller: _controller,
                                  obscureText: _isObscure,
                                  decoration: InputDecoration(
                                    border: const OutlineInputBorder(),
                                    labelText: 'Gemini API Key',
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        _isObscure
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _isObscure = !_isObscure;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 16),
                                SizedBox(
                                  width: double.infinity,
                                  child: FilledButton.icon(
                                    onPressed: () {
                                      context
                                          .read<SettingGeminiCubit>()
                                          .setApiKey(_controller.text.trim());
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                            'Đang lưu và tải danh sách model...',
                                          ),
                                        ),
                                      );
                                    },
                                    icon: const Icon(Icons.save),
                                    label: const Text('Lưu & Tải Models'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    if (state.availableModels.isNotEmpty)
                      SettingsSection(
                        title: const Text('Chọn Model'),
                        tiles: [
                          SettingsTile.navigation(
                            leading: const Icon(Icons.psychology),
                            title: const Text('Mô hình Gemini'),
                            value: Text(state.selectedModel ?? 'Chưa chọn'),
                            onPressed: (context) {
                              _showModelSelectionDialog(context, state);
                            },
                          ),
                        ],
                      ),
                    SettingsSection(
                      title: const Text('Hướng dẫn'),
                      tiles: [
                        SettingsTile.navigation(
                          leading: const Icon(Icons.help_outline),
                          title: const Text('Cách lấy API Key'),
                          description: const Text(
                            'Truy cập aistudio.google.com để tạo key miễn phí.',
                          ),
                          onPressed: (context) {
                            launchUrl(
                              Uri.parse(
                                'https://aistudio.google.com/app/apikey',
                              ),
                              mode: LaunchMode.externalApplication,
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
        );
      },
    );
  }

  void _showModelSelectionDialog(
    BuildContext context,
    SettingGeminiState state,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: const Text('Chọn Model'),
          children: state.availableModels.map((model) {
            return SimpleDialogOption(
              onPressed: () {
                context.read<SettingGeminiCubit>().selectModel(model);
                Navigator.pop(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(model),
                  if (model == state.selectedModel)
                    const Icon(Icons.check, color: Colors.green),
                ],
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
