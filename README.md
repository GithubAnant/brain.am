# <h1 align="center">🧠 brain.am</h1>

![brain.am home](home.png)  
![brain.am player](player.png)

---

## What is brain.am?

- brain.am is a Flutter app inspired by Brain.fm — delivering curated soundscapes (not procedural music) that help your brain focus, relax, or sleep better.

---

## 🎧 Features
- Handpicked soundscapes for **Focus**, **Relaxation**, **Sleep** and more  
- Session timer with pause/resume  
- Lightweight & snappy with Flutter + GetX
- Deployed as a Mac App and Web App
---
## 🧠 How brain.am Works

**State Management with GetX**
- GetX controllers handle app state and business logic with clean separation between UI and data layers. This eliminates boilerplate code while ensuring smooth performance.

**Audio Playback Engine**
- Built on Flutter's just_audio package for reliable cross-platform streaming. A centralized controller manages playback, volume, and track transitions.

**Independent Session Timers**
- Timer system runs separately from audio playback, allowing flexible session control. User preferences and session data persist locally using shared preferences.

**Reactive UI Updates**
- GetX observers automatically refresh UI components when data changes. Timer updates and playback controls reflect instantly without manual refresh calls.

**Cross-Platform Deployment**
- The codebase maintains platform-specific optimizations for both web and desktop deployments. Web builds utilize Flutter's HTML renderer for optimal browser compatibility, while the Mac app leverages native system integrations for better performance and user experience.

---
## 🕹️ Session Setup

<details>
<summary>🎯 Choose your Goal</summary>

<br>

- [x] Focus  
- [ ] Relax  
- [ ] Sleep  
- [x] Study  
- [ ] Deep Work  

</details>

<details>
<summary>🌿 Select Soundscape</summary>

<br>

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
<summary>⏱️ Pomodoro Settings</summary>

<br>

<table>
  <thead>
    <tr>
      <th>Interval</th>
      <th>Duration (minutes)</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>🧠 Work Time</td>
      <td>50</td>
    </tr>
    <tr>
      <td>☕ Rest Time</td>
      <td>10</td>
    </tr>
  </tbody>
</table>

</details>
