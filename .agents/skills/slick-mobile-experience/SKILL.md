---
name: slick-mobile-experience
description: Guidelines and patterns for designing slick, simple, modern, and beautifully animated mobile experiences in Credify (Flutter).
---

# Slick Mobile Experience Skill (Credify Design System)

This skill provides design standards, animation patterns, typography rules, and component architectures for building premium fintech mobile experiences in Credify.

---

## 1. Core Design Philosophy

- **Simplicity First**: Clean layouts without clutter. Generous whitespace (`16-24px` margins, `12-16px` item spacing).
- **Subtle Elevation & Depth**: Avoid harsh solid borders or aggressive drop shadows. Use soft ambient shadows (`BoxShadow(color: Color(0x0A000000), blurRadius: 20, offset: Offset(0, 8))`) and translucent background fills.
- **Micro-Delight**: Interactive elements must acknowledge touch through subtle scaling, opacity shifts, or smooth color fades.
- **Cohesive Fluidity**: Every screen transition and state change should feel seamless and intentional.

---

## 2. Typography Guidelines

The app standardizes on Apple's **San Francisco** design language:
- **`SF-Pro`**: Used for body copy, labels, captions, and standard UI elements. High legibility at small sizes.
- **`SF-Pro-Rounded`**: Used for headlines, large numbers, currency figures, and card titles. Gives a modern, friendly fintech aesthetic.

### Hierarchy
- **Headline Display (32-36pt, Bold)**: Screen intros, hero banners (`SF-Pro-Rounded`).
- **Headline Medium (22-26pt, Bold / SemiBold)**: Section titles, account balance numbers (`SF-Pro-Rounded`).
- **Body Large (16-18pt, Regular / Medium)**: Key descriptions, input fields (`SF-Pro`).
- **Body Small / Caption (12-14pt, Regular)**: Secondary labels, metadata, timestamps (`SF-Pro`).

---

## 3. Animation System (`flutter_animate`)

Use declarative, lightweight animations for entrance and interaction:

```dart
// Standard Entrance (Card / Content)
widget.animate()
  .fadeIn(duration: 350.ms, curve: Curves.easeOutCubic)
  .slideY(begin: 0.1, end: 0, duration: 350.ms, curve: Curves.easeOutCubic);

// Staggered List Items
ListView.builder(
  itemBuilder: (context, index) {
    return itemWidget.animate(delay: (index * 60).ms)
      .fadeIn(duration: 300.ms)
      .slideX(begin: 0.05, end: 0, curve: Curves.easeOutQuad);
  },
);

// Pulse / Micro-accent
badge.animate(onPlay: (c) => c.repeat(reverse: true))
  .scaleXY(begin: 1.0, end: 1.04, duration: 1200.ms, curve: Curves.easeInOut);
```

### Motion Rules
1. **Duration**: 250ms – 400ms for UI transitions. Never exceed 500ms for functional navigation.
2. **Curves**: Always use `Curves.easeOutCubic` or `Curves.fastOutSlowIn`. Avoid `Curves.easeInExpo` or linear transitions for navigation.

---

## 4. Component Standards

### App Buttons
- Height: `52-56px` for primary CTAs.
- Shape: Fully rounded (`BorderRadius.circular(28)`) or modern rounded rectangle (`BorderRadius.circular(16)`).
- Gradients: Primary to dark gradient (`AppColors.primary` $\rightarrow$ `AppColors.gradientBtn`).
- Interactive feedback: InkWell or Scale gesture with loading indicator replacement when busy.

### Input Fields
- Filled background (`Colors.white` in light mode, `AppColors.cardDark` in dark mode).
- Subtle border: `BorderSide(color: AppColors.primary.withOpacity(0.12))` when focused.
- Clear error states with non-intrusive red hint text.

### Cards & Containers
- Border radius: `18-24px`.
- Padding: `16-20px`.
- Gradient headers: Linear gradient top-left to bottom-right with high-contrast text.

---

## 5. Screen Flow Guidelines

1. **Splash Screen**:
   - Clean, centered brand logo with scale & shimmer animation.
   - Brief 1.5 - 2s delay with automatic pushReplacement to Onboarding or Dashboard.
2. **Onboarding**:
   - 3-slide visual carousel with key value propositions.
   - Expanding pill page indicators.
   - Accessible "Skip" button and prominent "Get Started".
3. **Authentication**:
   - Progress bar / step counter (`Step X of Y`) on multi-step forms.
   - Real-time password validation indicators that flip to green ticks smoothly.
   - Focused OTP input boxes with automatic progression.
4. **Identity Verification**:
   - Always provide dual options: **Take Photo** (live camera capture) and **Upload Photo / Document** (from gallery or files).
   - Display a clear document preview thumbnail once attached, along with Replace and Check Quality actions.
5. **Dashboard**:
   - Floating or docked bottom navigation bar with active icon pills.
   - Privacy toggle to hide/show balances.
   - Responsive scroll views without artificial height hacks.

