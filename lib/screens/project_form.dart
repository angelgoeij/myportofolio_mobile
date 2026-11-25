import 'package:flutter/material.dart';
import 'package:myportofolio_mobile/models/project.dart';
import 'package:myportofolio_mobile/services/api_client.dart';
import 'package:myportofolio_mobile/services/auth_state.dart';
import 'package:myportofolio_mobile/utils/auth_utils.dart';
import 'package:myportofolio_mobile/widgets/left_drawer.dart';
import 'package:provider/provider.dart';

class ProjectFormPage extends StatefulWidget {
  const ProjectFormPage({super.key});

  @override
  State<ProjectFormPage> createState() => _ProjectFormPageState();
}

class _ProjectFormPageState extends State<ProjectFormPage> {
  final _formKey = GlobalKey<FormState>();

  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _techStackController = TextEditingController();
  final _projectUrlController = TextEditingController();
  final _projectImageUrlController = TextEditingController();

  bool _isSubmitting = false;

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _techStackController.dispose();
    _projectUrlController.dispose();
    _projectImageUrlController.dispose();
    super.dispose();
  }

  // Validate required text fields.
  String? _validateRequired(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName cannot be empty!';
    }
    return null;
  }

  // Validate URL format.
  String? _validateUrl(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Project URL cannot be empty!';
    }

    final uri = Uri.tryParse(value.trim());

    if (uri == null ||
        !uri.hasScheme ||
        !['http', 'https'].contains(uri.scheme) ||
        uri.host.isEmpty) {
      return 'Please enter a valid URL!';
    }

    return null;
  }

  // Validate optional image URL.
  String? _validateOptionalUrl(String? value) {
    if (value == null || value.trim().isEmpty) {
      return null;
    }

    final uri = Uri.tryParse(value.trim());

    if (uri == null ||
        !uri.hasScheme ||
        !['http', 'https'].contains(uri.scheme) ||
        uri.host.isEmpty) {
      return 'Please enter a valid image URL!';
    }

    return null;
  }

  Future<void> _submit() async {
    // 1. Validate all form fields.
    if (!_formKey.currentState!.validate()) return;

    // 2. Check authentication.
    final loggedIn = await ensureLoggedIn(context);

    if (!loggedIn || !mounted) return;

    // 3. Retrieve authentication token.
    final token = context.read<AuthState>().token;

    if (token == null) return;

    setState(() {
      _isSubmitting = true;
    });

    try {
      // 4. Create Project object from form input.
      final newProject = Project(
        title: _titleController.text.trim(),
        description: _descriptionController.text.trim(),
        techStack: _techStackController.text.trim(),
        projectUrl: _projectUrlController.text.trim(),
        projectImageUrl: _projectImageUrlController.text.trim(),
      );

      // 5. Send project data to Django API.
      await context.read<ApiClient>().createProject(newProject, token: token);

      if (!mounted) return;

      // 6. Show confirmation dialog.
      await showDialog<void>(
        context: context,
        builder: (dialogContext) {
          return AlertDialog(
            title: const Text('Project Successfully Added!'),
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Title: ${newProject.title}'),
                  Text('Description: ${newProject.description}'),
                  Text('Tech Stack: ${newProject.techStack}'),
                  Text('Project URL: ${newProject.projectUrl}'),
                  Text(
                    'Project Image URL: ${newProject.projectImageUrl.isEmpty ? "Not provided" : newProject.projectImageUrl}',
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(dialogContext);
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );

      if (!mounted) return;

      // Return to previous screen after successful submission.
      Navigator.pop(context, true);
    } on ApiException catch (e) {
      if (!mounted) return;

      if (e.statusCode == 401) {
        // Token is invalid or expired.
        await context.read<AuthState>().logout();

        if (!mounted) return;

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Your session has expired. Please log in again.'),
          ),
        );

        // Ask the user to log in again.
        await ensureLoggedIn(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Failed to add project. Status code: ${e.statusCode}',
            ),
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isSubmitting = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Add Project Form')),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _titleController,
                  decoration: InputDecoration(
                    hintText: 'Project Title',
                    labelText: 'Title',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  validator: (value) => _validateRequired(value, 'Title'),
                ),
              ),

              // Description
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _descriptionController,
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: 'Project Description',
                    labelText: 'Description',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  validator: (value) => _validateRequired(value, 'Description'),
                ),
              ),

              // Tech Stack
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _techStackController,
                  decoration: InputDecoration(
                    hintText: 'Example: Flutter, Django, Figma',
                    labelText: 'Tech Stack',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  validator: (value) => _validateRequired(value, 'Tech Stack'),
                ),
              ),

              // Project URL
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _projectUrlController,
                  decoration: InputDecoration(
                    hintText: 'https://example.com',
                    labelText: 'Project URL',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  keyboardType: TextInputType.url,
                  validator: _validateUrl,
                ),
              ),

              // Project Image URL (Optional)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: _projectImageUrlController,
                  decoration: InputDecoration(
                    hintText: 'https://example.com/image.png',
                    labelText: 'Project Image URL (Optional)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  keyboardType: TextInputType.url,
                  validator: _validateOptionalUrl,
                ),
              ),

              // Submit Button
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.indigo),
                      foregroundColor: WidgetStateProperty.all(Colors.white),
                    ),
                    onPressed: _isSubmitting ? null : _submit,
                    child: _isSubmitting
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : const Text('Save'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
