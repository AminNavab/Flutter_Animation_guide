# 🎬 Flutter Animation Guide

A practical and structured guide to learning **Animations in Flutter** — from the simplest concepts to more advanced animation techniques.

This repository is designed to help Flutter developers understand **how animations work**, not just how to use ready-made animated widgets.

---

## ✨ What is this repository?

**Flutter Animation Guide** is a collection of simple, focused, and practical examples for learning Flutter animations step by step.

The goal is to move from:

> **"I know how to animate a widget"**

to:

> **"I understand how Flutter animations work."**

Each example focuses on a specific concept so that you can learn the idea without getting lost in unnecessary complexity.

---

## 📚 What You'll Learn

The repository is divided into two main sections:

### 🟢 Implicit Animations

Learn Flutter's built-in animations that automatically handle the animation between old and new values.

Examples include:

- `AnimatedContainer`
- `AnimatedOpacity`
- `AnimatedAlign`
- `AnimatedPositioned`
- `AnimatedRotation`
- `AnimatedScale`
- `AnimatedSlide`
- `AnimatedSize`
- `AnimatedPadding`
- `AnimatedSwitcher`
- `AnimatedCrossFade`
- and more...

👉 [Explore Implicit Animations](lib/Animations/ImplicitAnimations/README.md)

---

### 🔵 Explicit Animations

Learn how to control animations manually using Flutter's animation system.

Topics include:

- `AnimationController`
- `Animation<T>`
- `Tween`
- `Curve`
- `CurvedAnimation`
- `AnimatedBuilder`
- `ListenableBuilder`
- `Transform`
- `Matrix4`
- Transition widgets
- Physics-based animations
- Staggered animations
- `Hero`
- Custom animations
- and more...

👉 [Explore Explicit Animations](lib/Animations/ExplicitAnimations/README.md)

---

## 🧠 Learning Approach

This repository follows a **concept-first** approach.

Instead of jumping directly into complex animations, the concepts are introduced progressively:

```text
Implicit Animations
        │
        ▼
Explicit Animations
        │
        ├── AnimationController
        │
        ├── Animation<T>
        │
        ├── Tween
        │
        ├── Curve
        │
        ├── AnimatedBuilder
        │
        ├── Transform & Matrix4
        │
        ├── Transitions
        │
        ├── Physics
        │
        ├── Staggered Animations
        │
        ├── Hero Animations
        │
        └── Advanced & Custom Animations