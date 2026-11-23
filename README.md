# myportofolio_mobile

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)
- [Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Flutter learning resources](https://docs.flutter.dev/reference/learning-resources)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

### Assignment 7
Progress Report

-- 11 November, 2026 
I continued working on my myportofolio_mobile Flutter project from Tutorial 08. I started by separating the main page widget into a new file called menu.dart inside the lib/ directory, keeping main.dart as the application's entry point. I also changed MyHomePage from a StatefulWidget into a StatelessWidget because the main menu does not need to manage its own changing state.

I then updated the portfolio owner's information by creating three InfoCard widgets to display my actual NPM, full name, and PBP class. After that, I created three action buttons using ItemCard, including View Portfolio, Add Item, and Logout. Each button has a different background color, icon, and text to make them easier to recognize.

I also added SnackBar messages that appear when users press the buttons. Each message matches the selected button, such as "You pressed the View Portfolio button!". Finally, I checked the project using flutter analyze and made sure the changes were included in the same public GitHub repository used for Tutorial 08, separate from the Django repository.

-- 13 November, 2026
Reflective Questions

1. A widget tree is the structure that shows how widgets are arranged in a Flutter application. Widgets have parent-child relationships, where a parent widget can contain other widgets as its children. For example, a Scaffold can contain an AppBar and a Column, while the Column can contain several Text and Card widgets.

2. Some of the main widgets used in my project are:

        - MaterialApp: Sets up the main application.
        - Scaffold: Provides the basic page layout.
        - AppBar: Displays the top application bar.
        - Text: Displays text on the screen.
        - Column: Arranges widgets vertically.
        - Row: Arranges widgets horizontally.
        - Card: Displays information inside a card.
        - Container: Controls size, background color, and decoration.
        - Icon: Displays icons for the action buttons.
        - InkWell: Makes the cards respond to user taps.
        - Padding: Adds space around widgets.
        - ScaffoldMessenger and SnackBar: Display messages when users press the buttons.
        - InfoCard: A custom widget used to display the owner's NPM, name, and class.
        - ItemCard: A custom widget used to display the portfolio action buttons.

3. MaterialApp is used to provide the basic structure and Material Design features of a Flutter application. It manages things such as themes, navigation, and the home screen. It is commonly used as the root widget because it provides the main configuration needed by the application.

4. StatelessWidget is used for widgets that do not need to manage changing internal data. Its appearance depends on the information provided when it is built. StatefulWidget is used when a widget needs to update its appearance based on changes in its state, such as a counter or a form. In my project, I used StatelessWidget for MyHomePage because the main menu displays information and action buttons without managing its own changing state.

5. BuildContext represents the location of a widget in the widget tree. It allows a widget to access information from its surrounding widgets. Inside the build method, it can be used to access themes, screen information, and other features. For example, ScaffoldMessenger.of(context) is used to display a SnackBar when an action button is pressed.

6. Hot reload allows developers to apply code changes quickly without restarting the entire application. It also preserves the current application state, making it useful when changing widget layouts, colors, or text. Hot restart restarts the application and resets its state. It is useful when changes involve initialization logic or global variables that hot reload cannot properly update. A full restart is needed when changes involve native Android or iOS code because these changes require rebuilding the application.

7. AI Disclosure: I used ChatGPT as a supporting tool during this assignment, mainly to understand Flutter concepts, review my code, and troubleshoot problems when I encountered difficulties. My prompting strategy was to provide specific questions, relevant code snippets, and descriptions of the problems I was facing. Instead of asking AI to complete the entire assignment, I focused on smaller tasks so I could understand the explanations and apply the solutions to my existing code.

Some of the specific areas where I used AI assistance include:
    - Understanding the differences between StatelessWidget and StatefulWidget and deciding why StatelessWidget was suitable for MyHomePage.
    - Understanding how widget trees and parent-child relationships work in Flutter.
    - Learning how BuildContext is used, especially when displaying SnackBar messages through ScaffoldMessenger.
    - Understanding how hot reload, hot restart, and full restart differ.
    - Reviewing my widget structure and understanding the purposes of widgets such as Scaffold, Column, Card, InkWell, InfoCard, and ItemCard.


However, I also noticed some limitations when using AI. Some explanations were too general and did not always match the exact implementation of my project. AI could also suggest solutions that were more complicated than necessary or introduce widgets that I did not actually use.

To handle these limitations, I checked the suggestions against my existing code and the assignment requirements. I also referred to the previous tutorials to make sure the implementation followed the expected structure. For testing, I ran flutter analyze to check for code issues and manually reviewed the application to make sure the information cards, action buttons, colors, and SnackBar messages worked as expected.

Overall, I treated AI as a learning and debugging assistant rather than relying on it to write the entire project. I still reviewed the suggestions, made the necessary adjustments, and checked the final results myself.

AI Prompting Log: https://chatgpt.com/share/6af73bbb-1114-83ec-8197-b82a2bd5e118

### Assignment 8
1. 
    - Navigator.push() digunakan untuk membuka halaman baru di atas halaman saat ini. Halaman sebelumnya tetap tersimpan sehingga pengguna dapat kembali menggunakan tombol Back.
    - Navigator.pushReplacement() digunakan untuk membuka halaman baru sekaligus menggantikan halaman sebelumnya, sehingga halaman lama tidak dapat dikembalikan menggunakan tombol Back.
    - Navigator.pop() digunakan untuk menutup halaman yang sedang dibuka dan kembali ke halaman sebelumnya.

Untuk membuka formulir dari kartu aksi, metode yang digunakan adalah Navigator.push(), karena pengguna dapat membuka formulir dan kembali ke halaman utama setelah selesai. Opsi Home pada Drawer menggunakan Navigator.pushReplacement() atau navigasi menuju halaman utama untuk mengarahkan pengguna kembali ke Home tanpa menumpuk halaman baru di atas halaman sebelumnya.


2. Scaffold berfungsi sebagai kerangka utama halaman yang mengatur struktur seperti AppBar, Drawer, dan bagian konten.
    - AppBar: Menampilkan judul halaman dan tombol navigasi.
    - Drawer: Menyediakan menu navigasi untuk berpindah ke halaman lain.
    - Scaffold: Menjaga susunan komponen halaman agar konsisten.
Contohnya, warna utama portofolio dapat digunakan pada AppBar di halaman Home dan halaman Formulir. Dengan begitu, kedua halaman memiliki tampilan yang seragam dan mencerminkan identitas visual portofolio.


3. Tata letak formulir dipilih agar setiap input tersusun secara vertikal dan mudah dibaca oleh pengguna. Susunan ini juga memudahkan pengguna mengisi formulir secara berurutan. Beberapa widget yang membantu mengatur tata letak adalah:
    - SizedBox: Memberikan jarak antarinput agar formulir tidak terlihat terlalu padat.
    - Padding: Memberikan ruang di sekitar konten agar tidak terlalu dekat dengan tepi layar.
    - SingleChildScrollView: Memungkinkan pengguna menggulir formulir ke atas dan bawah ketika seluruh komponen tidak muat   di layar, misalnya saat keyboard muncul.
Dengan kombinasi tersebut, formulir tetap nyaman digunakan pada berbagai ukuran layar.

4. Ketiga komponen tersebut digunakan untuk memastikan data yang dimasukkan pengguna sudah sesuai sebelum disimpan.
    - GlobalKey<FormState>: Digunakan untuk mengakses dan mengelola kondisi formulir, termasuk menjalankan proses validasi.
    - validator: Berisi aturan untuk memeriksa apakah input pengguna valid atau tidak.
    - validate(): Menjalankan seluruh fungsi validator pada formulir. Jika semua input valid, hasilnya true. Jika ada input yang tidak valid, hasilnya false dan pesan kesalahan akan ditampilkan.

Contohnya, jika kolom email harus diisi dengan format email yang benar, input abc123 akan ditolak karena tidak memiliki format alamat email yang valid. Memilih jenis input atau papan ketik seperti TextInputType.emailAddress saja belum cukup untuk memastikan data valid. Pengaturan tersebut hanya membantu menampilkan papan ketik yang sesuai, tetapi tidak benar-benar memeriksa isi yang dimasukkan pengguna. Oleh karena itu, tetap diperlukan validator untuk memeriksa data sebelum disimpan.

5. AI Disclosure: I used ChatGPT as a supporting tool during this assignment, mainly to understand Flutter navigation, implement the additional form page, review my code, and troubleshoot problems when I encountered difficulties. My prompting strategy was to provide specific questions, relevant code snippets, and descriptions of the expected behavior or problems I was facing. Instead of asking AI to complete the entire assignment, I focused on smaller tasks so I could understand the explanations and apply the solutions to my existing code.

Some of the specific areas where I used AI assistance include:
    - Understanding the differences between Navigator.push(), Navigator.pushReplacement(), and Navigator.pop(), and deciding which method was appropriate for opening the additional form page.
    - Understanding how Scaffold, AppBar, and Drawer work together to maintain a consistent page structure and navigation experience.
    - Learning how to implement navigation from the homepage action card and add a new option to the existing Drawer.
    - Understanding the purpose of StatefulWidget, Form, and GlobalKey<FormState> when creating a form page.
    - Learning how TextFormField, validator, and FormState.validate() work together to validate user input before submission.
    - Understanding how to display submitted information using AlertDialog and showDialog().
    - Learning how SingleChildScrollView, Padding, and SizedBox help organize form layouts, especially when screen space is limited or the keyboard is displayed.
    - Reviewing my implementation and identifying potential improvements in navigation, form validation, and code organization.

However, I also noticed some limitations when using AI. Some explanations were too general and did not always match the exact structure or implementation of my project. AI could also suggest alternative navigation methods or validation approaches that were not necessarily suitable for the assignment requirements. Additionally, suggested code sometimes required adjustments to work correctly with my existing widgets and project structure.

To handle these limitations, I checked the suggestions against my existing code and the assignment requirements. I also referred to the previous tutorials to make sure the implementation followed the expected Flutter structure. Rather than accepting every suggestion directly, I reviewed the code, adjusted the implementation where necessary, and manually tested the navigation flow, form validation, and dialog behavior. I also used flutter analyze to identify potential code issues and reviewed the application to ensure that the form could be accessed through both the homepage action card and the Drawer.

Overall, I treated AI as a learning and debugging assistant rather than relying on it to write the entire project. I still reviewed the suggestions, made the necessary adjustments, and checked the final results myself to ensure that I understood the implementation and that it fulfilled the assignment requirements.

AI Prompting Log: https://chatgpt.com/share/6b039a9e-8504-83ec-9dcc-c3a7644c8123
