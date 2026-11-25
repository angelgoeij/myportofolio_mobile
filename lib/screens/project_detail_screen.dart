import 'package:flutter/material.dart';
import 'package:myportofolio_mobile/models/project.dart';

class ProjectDetailScreen extends StatelessWidget {
  final Project project;

  const ProjectDetailScreen({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Project Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              project.title,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),

            const Text(
              'Description',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(project.description),

            const SizedBox(height: 16),

            const Text(
              'Tech Stack',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(project.techStack),

            const SizedBox(height: 16),

            const Text(
              'Project URL',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(project.projectUrl),
          ],
        ),
      ),
    );
  }
}
