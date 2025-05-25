# brain.am

![brain.am home](home.png)  
![brain.am player](player.png)

**brain.am** is a Flutter app **inspired by Brain.fm** that delivers curated, science-backed soundscapes to boost focus, relaxation, and sleep. It is **not** a procedural music app — all audio tracks are carefully crafted, not algorithmically generated.

---

## Table of Contents
- [About](#about)  
- [Features](#features)  
- [Architecture](#architecture)  
- [Usage](#usage)  
- [Interactive Components](#interactive-components)  

---

## About

brain.am uses **GetX** for state management to provide a lightweight and reactive user experience. It delivers curated soundscapes scientifically designed for brainwave entrainment without procedural music generation.

---

## Features

- Curated soundscapes targeting Focus, Relaxation, and Sleep  
- Multi-layer sound mixing with volume sliders and mute toggles  
- Session timer with pause/resume functionality  
- Real-time progress visualization and session feedback  
- Dark mode support  
- Lightweight and performant with Flutter & GetX  

---

## Architecture

- **Flutter:** UI framework for cross-platform support  
- **GetX:** State management for reactive and clean code  
- **Audio playback:** Controlled via `just_audio` or similar packages  
- **Custom widgets:** Interactive sliders, buttons, and progress bars  
- **Local storage:** Shared preferences to save user settings and session history  

---

## Usage

1. Select a session goal: Focus, Relaxation, or Sleep  
2. Pick a curated soundscape from the list  
3. Adjust individual sound layers with sliders and mute toggles  
4. Set your session timer  
5. Press play and enjoy the optimized audio experience  
6. Monitor your session progress and feedback  

---

## Interactive Components

- **Volume Sliders:** Adjust volume for Rain, White Noise, Ambient layers  
- **Mute Toggles:** Enable or disable individual sound layers instantly  
- **Session Timer:** Tap to pause/resume or reset session  
- **Progress Bar:** Visual feedback on session progress and estimated brainwave entrainment impact  

