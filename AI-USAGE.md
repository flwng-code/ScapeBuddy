# AI usage record

ChatGPT assisted with planning and scaffolding ScapeBuddy.

## 1. How I used AI

### ENTRY #1 2026-09-26 - Adapt the project to the supplied template 

- **Tool:** ChatGPT.
- **What I asked for:** Restructure ScapeBuddy around the supplied final-project
  template while keeping the app runnable and preserving earlier project choices.
- **What it gave back:** A DevicePreview app shell, an icon-free static home
  screen, personalized project documents, and a smaller web-focused structure.
- **What I kept, what I changed, and why:** The home cards keep their current
  placeholder copy because the student wrote it. The template's counter screen
  and unused feature stubs were removed. The student should review the code and
  docs and adjust them to match their understanding.
- **Commit:** https://github.com/flwng-code/ScapeBuddy/commit/0a19cf1c468d3306e45b154ca03ec139f9ec9b2b

### ENTRY #2 2026-09-27 - Adapt the project to the supplied template 

- **Tool:** ChatGPT.
- **What I asked for:** Help in fixing issues with flutter run command not working
- **What it gave back:**
it fixed the launch issue and explained in detail what went wrong and what was fixed
- **What I kept, what I changed, and why:**
i kept the code that was unaffected by the issue and created main() in order for the app to launch properly.
- **Commit:** https://github.com/flwng-code/ScapeBuddy/commit/33b1ba85d8395973da2a03aa0170de85f4993638

### ENTRY #3 -  

- **Tool:** ChatGPT.
- **What I asked for:** To check for any syntax Errors or typo errors in any of the documents that contains crucial information 
- **What it gave back:**
it gave back a report of the code and it came with a negative for errors in syntax or typos in the code 
- **What I kept, what I changed, and why:**
the whole code was not changed as it was only checking for errors.
- **Commit:** No project code change came from this session.

### 4. Date not recorded - Add images to the home page cards

- **Tool:** ChatGPT.
- **What I asked for:** Use the three images I supplied for the Bestiary, Build
  Maker, and Milestone Notes cards, and make each card open its matching page.
- **What it gave back:** Help placing the images in the assets folder and
  changes to display them on tappable home cards with navigation to each
  feature.
- **What I kept, what I changed, and why:** The card names, descriptions, and
  image files came from my project choices. I used AI help for wiring the
  images and navigation, and I should review those paths and routes so I can
  explain them myself.
- **Commit:** https://github.com/flwng-code/ScapeBuddy/commit/3845c8cd0b4e5103684f7684b3a08f9dc9d43863

### 5. Date not recorded - Understand the Git push and rebase error

- **Tool:** ChatGPT.
- **What I asked for:** Explain why GitHub rejected my push and what the
  rebase conflict message meant.
- **What it gave back:** An explanation that the remote branch had commits my
  local branch did not have, plus steps for resolving conflicts and continuing
  or cancelling a rebase.
- **What I kept, what I changed, and why:** This was troubleshooting advice,
  not generated project code. I handled the Git commands and conflict in my
  own terminal. I did not use the advice as proof that a conflict was resolved
  until I checked the result.
- **Commit:** No project code change came from this session.

### 6. 2026-10-04 - Draft the Bestiary from the boss information document

- **Tool:** ChatGPT.
- **What I asked for:** Use the supplied boss document to make a boss list with
  32 x 32 icons, tappable entries, and a guide page for each boss with an image
  area below its name.
- **What it gave back:** An initial boss data model, seven guide entries, a
  `ListView.builder`, detail-page layout, and placeholder list icons and boss
  image areas.
- **What I kept, what I changed, and why:** I used the code as a starting
  point and kept my existing app work separate. The guide text should be
  checked against the PDF, and I need to check that any boss images I add use
  filenames that match the paths in the data. The generated icons are
  placeholders; my final images and any code I wrote myself should stay
  credited to me.
- **Commit:** https://github.com/flwng-code/ScapeBuddy/commit/3845c8cd0b4e5103684f7684b3a08f9dc9d43863

Add one entry for each real AI-assisted work session. The course template asks
for at least six entries with commit links; complete those over time rather than
inventing work or links.

## 2. Where the AI got it wrong

## ENTRY #1 2026-09-26 Home-card icons did not match the requested design

- **What it gave me:** An earlier draft of the home cards with leading icons.
- **What was wrong with it:** The student wanted no icons on Bestiary, Build
  Maker, or Milestone Notes.
- **What I did instead:** i removed the icons from the code and changed the placeholder text. and now current cards contain only their title and description.
- **Commit:** Add the student's own commit link after committing this change. (to be added)

### ENTRY #2 2026-09-26 The template demo counter replaced the ScapeBuddy screen

- **What it gave me:** The template extraction restored its generic counter
  screen as the `main.dart` entry point.
- **What was wrong with it:** Running the template would no longer show the
  current ScapeBuddy home screen.
- **What I did instead:** Put the ScapeBuddy screen back in the template's
  `lib/main.dart` while retaining DevicePreview.
- **Commit:** Add the student's own commit link after committing this change.

### ENTRY #3 2026-09-26 The template demo counter replaced the ScapeBuddy screen

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

- **File:** `main.dart`
- **Commit:** https://github.com/flwng-code/ScapeBuddy/commit/3845c8cd0b4e5103684f7684b3a08f9dc9d43863
- **What it does and why it is built this way:** i started with adding placeholders that leads nowhere so that i can visualize where i want things to be and to start simple and slowly build my way up as my progress moves forward. i can then use the main as a stepping stone by increasing the amount of functionality and let the placeholders be interactable and when clicked, lead to its respective pages. when it was written initially with the help of ai i didnt like how it turned out so i took a look at the code and saw where it went wrong, so what i did was put the job into my own hands and wrote the code how i wanted it to look and mentioned above what i changed and why the page now looks the way it is.

- **File:** `boss_guides.dart`
- **Commit:** https://github.com/flwng-code/ScapeBuddy/commit/3845c8cd0b4e5103684f7684b3a08f9dc9d43863
- **What it does and why it is built this way:** the code contained in this section which i created contains everything that will be used for the boss_guide file. it contains every detail need such as; the name, description, icon, attacks, fight mechanics, strategy, and a quick guide. all the monsters here were personally fought by me ingame so i curated the information and the code all by my own. with exceptions being the images and icons coming from google.

- **File:** `boss_guide.dart`
- **Commit:** https://github.com/flwng-code/ScapeBuddy/commit/3845c8cd0b4e5103684f7684b3a08f9dc9d43863
- **What it does and why it is built this way:** This code is used to organize and store all the information needed for a boss detail page in the app. The BossGuide class holds the main information about a boss, such as its name, description, icon, hero image, and different guide sections. The BossGuideSection class is used to separate the guide into organized parts, where the information can be shown as normal paragraphs, bullet points, or numbered steps depending on what is needed. The BossGuideListStyle enum makes it easy to tell the app how each section should be displayed. It is built this way so the boss information stays organized and consistent, while also making it easier to add or change bosses without having to create a completely different layout for each one.

- **File:** `boss_detail_screen.dart`
- **Commit:** (https://github.com/flwng-code/ScapeBuddy/commit/3845c8cd0b4e5103684f7684b3a08f9dc9d43863)
- **What it does and why it is built this way:**
- This Flutter code creates a boss detail page. BossDetailScreen takes a BossGuide and displays the boss’s name, image, description, and other guide sections in a scrollable layout. _BossImageSlot handles the boss image and shows a placeholder if the image cannot be loaded. _GuideSection displays each section and its items, while _GuideItem controls whether each item appears as plain text, a numbered list, or a bulleted list. Overall, the main screen puts everything together, while the smaller widgets handle specific parts of the UI. It’s built that way mainly to keep the code organized and easier to maintain.

### The AI-assisted part I understand best

- **File:** `boss_guide.dart`.
- **Commit:** https://github.com/flwng-code/ScapeBuddy/commit/3845c8cd0b4e5103684f7684b3a08f9dc9d43863
- **What it does and why we kept it:**
It stores and organizes the boss information, including descriptions, images, and guide sections. I kept it in the program to make the boss data easier to manage and display consistently in the Bestiary.

