
import 'package:flutter/material.dart';
import 'package:myportofolio_mobile/widgets/left_drawer.dart';

class EducationFormPage extends StatefulWidget {
	const EducationFormPage({super.key});

	@override
	State<EducationFormPage> createState() => _EducationFormPageState();
}

class _EducationFormPageState extends State<EducationFormPage> {
	final _formKey = GlobalKey<FormState>();
	String _educationName = "";
	String _description = "";
	String _educationLink = "";

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: const Center(
					child: Text('Add Education Form'),
				),
				backgroundColor: Colors.indigo,
				foregroundColor: Colors.white,
			),
			drawer: const LeftDrawer(),
			body: Form(
				key: _formKey,
				child: SingleChildScrollView(
					child: Column(
						crossAxisAlignment: CrossAxisAlignment.start,
						children: [
							// Project Name 
							Padding(
								padding: const EdgeInsets.all(8.0),
								child: TextFormField(
									decoration: InputDecoration(
										hintText: "Nama Pendidikan",
										labelText: "Nama Pendidikan",
										border: OutlineInputBorder(
											borderRadius: BorderRadius.circular(5.0),
										),
									),
									onChanged: (String? value) {
										setState(() {
											_educationName = value!;
										});
									},
									validator: (String? value) {
										if (value == null || value.trim().isEmpty) {
											return "Nama pendidikan tidak boleh kosong!";
										}
										return null;
									},
								),
							),

							// Description
							Padding(
								padding: const EdgeInsets.all(8.0),
								child: TextFormField(
									maxLines: 5,
									decoration: InputDecoration(
										hintText: "Deskripsi Pendidikan",
										labelText: "Deskripsi Pendidikan",
										border: OutlineInputBorder(
											borderRadius: BorderRadius.circular(5.0),
										),
									),
									onChanged: (String? value) {
										setState(() {
											_description = value!;
										});
									},
									validator: (String? value) {
										if (value == null || value.trim().isEmpty) {
											return "Deskripsi pendidikan tidak boleh kosong!";
										}
										return null;
									},
								),
							),

							// Project Link
							Padding(
								padding: const EdgeInsets.all(8.0),
								child: TextFormField(
									decoration: InputDecoration(
										hintText: "URL Informasi Pendidikan (opsional)",
										labelText: "Tautan Informasi Pendidikan",
										border: OutlineInputBorder(
											borderRadius: BorderRadius.circular(5.0),
										),
									),
									onChanged: (String? value) {
										setState(() {
											_educationLink = value!;
										});
									},
								),
							),

							// Tombol Simpan
							
							Align(
								alignment: Alignment.bottomCenter,
								child: Padding(
									padding: const EdgeInsets.all(8.0),
									child: ElevatedButton(
										style: ButtonStyle(
											backgroundColor:
												WidgetStateProperty.all(Colors.indigo),
										),
										onPressed: () {
											if (_formKey.currentState!.validate()) {
												showDialog(
													context: context,
													builder: (context) {
														return AlertDialog(
															title: const Text(
																'Pendidikan berhasil ditambahkan!',
															),
															content: SingleChildScrollView(
																child: Column(
																	crossAxisAlignment:
																		CrossAxisAlignment.start,
																	children: [
																		Text('Nama Proyek: $_educationName'),
																		Text('Deskripsi: $_description'),
																		Text('Tautan: $_educationLink'),
																	],
																),
															),
															actions: [
																TextButton(
																	child: const Text('OK'),
																	onPressed: () {
																		Navigator.pop(context);
																		_formKey.currentState!.reset();
																	},
																),
															],
														);
													},
												);
											}
										},
										child: const Text(
											"Save",
											style: TextStyle(color: Colors.white),
										),
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
