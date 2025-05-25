# <h1 align="center">🧠 brain.am</h1>
![brain.am home](home.png)  
![brain.am player](player.png)
---
## 🚀 What is brain.am?
brain.am is a **Flutter app inspired by Brain.fm** — delivering *curated* soundscapes (not procedural music) that help your brain focus, relax, or sleep better. It's minimal, powerful, and uses **GetX** for smooth state management.
---
## 🎧 Features
- Handpicked soundscapes for **Focus**, **Relaxation**, **Sleep** and more  
- Session timer with pause/resume  
- Lightweight & snappy with Flutter + GetX
- Deployed as a Mac App and Web App
---
## 🧠 How brain.am Works

**State Management Architecture**
The app leverages GetX's reactive programming paradigm to manage application state efficiently. GetX controllers handle the business logic while maintaining clean separation between UI and data layers. This ensures smooth performance and eliminates boilerplate code typically associated with other state management solutions.

**Audio Playback System**
Audio functionality is built around Flutter's `just_audio` package, which provides reliable cross-platform audio streaming. The app maintains a centralized audio controller that manages playback state, volume controls, and seamless transitions between tracks. Audio files are either streamed from remote URLs or loaded from local assets depending on the deployment configuration.

**Session Management**
The timer system operates independently of the audio playback, allowing users to run timed sessions while maintaining full control over their soundscape. Session data including duration, selected goals, and preferred soundscapes are persisted locally using Flutter's shared preferences, ensuring user settings survive app restarts.

**UI Responsiveness**
The interface utilizes GetX's reactive observers to automatically update UI components when underlying data changes. This creates a fluid user experience where timer updates, playback controls, and session state changes are reflected instantly across all relevant UI elements without manual refresh calls.

**Cross-Platform Deployment**
The codebase maintains platform-specific optimizations for both web and desktop deployments. Web builds utilize Flutter's HTML renderer for optimal browser compatibility, while the Mac app leverages native system integrations for better performance and user experience.

---
## 🕹️ Session Setup
<details>
<summary>Choose your Goal</summary>
- [x] Focus  
- [ ] Relax 
- [ ] Sleep  
- [x] Study 
- [ ] Deep Work 
</details>
<details>
<summary>Select Soundscape</summary>
- [ ] Ocean Waves  
- [x] Rainforest   
- [ ] White Noise  
- [x] Soft Piano
- [x] Post Rock
- [ ] Thunderstorm
- [x] Melancholy
- [ ] Ambience
</details>
<details>
<summary>Pomodoro Settings</summary>
| Setting      | Value (minutes) |
|--------------|-----------------|
| Work Time    | `50`          |
| Rest Time    | `10`          |
</details>
