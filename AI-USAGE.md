# AI usage record

ChatGPT assisted with planning and scaffolding ScapeBuddy.

## 1. How I used AI

### 2026-09-26 - Adapt the project to the supplied template

- **Tool:** ChatGPT.
- **What I asked for:** Restructure ScapeBuddy around the supplied final-project
  template while keeping the app runnable and preserving earlier project choices.

  My first mistake of this project is 
- **What it gave back:** A DevicePreview app shell, an icon-free static home
  screen, personalized project documents, and a smaller web-focused structure.
- **What I kept, what I changed, and why:** The home cards keep their current
  placeholder copy because the student wrote it. The template's counter screen
  and unused feature stubs were removed. The student should review the code and
  docs and adjust them to match their understanding.
- **Commit:** Add the student's own commit link after committing this change.

Add one entry for each real AI-assisted work session. The course template asks
for at least six entries with commit links; complete those over time rather than
inventing work or links.

## 2. Where the AI got it wrong

### Home-card icons did not match the requested design

- **ENTRY #1:**
- **What it gave me:** An earlier draft of the home cards with leading icons.
- **What was wrong with it:** The student wanted no icons on Bestiary, Build
  Maker, or Milestone Notes.
- **What I did instead:** i removed the icons from the code and changed the placeholder text. and now current cards contain only their title and description.
- **Commit:** Add the student's own commit link after committing this change. (to be added)

### The template demo counter replaced the ScapeBuddy screen

- **What it gave me:** The template extraction restored its generic counter
  screen as the `main.dart` entry point.
- **What was wrong with it:** Running the template would no longer show the
  current ScapeBuddy home screen.
- **What I did instead:** Put the ScapeBuddy screen back in the template's
  `lib/main.dart` while retaining DevicePreview.
- **Commit:** Add the student's own commit link after committing this change.

## 3. Who wrote what

Fill this section in your own words as you work. Explain which parts you wrote,
which AI suggestions you kept, and how you understand the code. Do not claim
authorship of generated code you have not reviewed.

### Written by me

- **File:** `lib/main.dart`
- **Commit:** Add your real commit link. (to be added)
- **What it does and why it is built this way:** i started with adding placeholders that leads nowhere so that i can visualize where i want things to be and to start simple and slowly build my way up as my progress moves forward. i can then use the main as a stepping stone by increasing the amount of functionality and let the placeholders be interactable and when clicked, lead to its respective pages. when it was written initially with the help of ai i didnt like how it turned out so i took a look at the code and saw where it went wrong, so what i did was put the job into my own hands and wrote the code how i wanted it to look and mentioned above what i changed and why the page now looks the way it is.

### The AI-assisted part I understand best

- **File:** `lib/main.dart`.
- **Commit:** Add your real commit link. (to be added)
- **What it does and why we kept it:** The main file holds everything and is where the user is greeted and can see the screens that can be used to lead them to the functions of the app which can be seen by the texts and arrow icons which can be pressed.

