# Flutter Micro Animation Assignment

## Animation Approach
My approach centered on creating tactile micro-interactions, utilizing a custom `ScaleTransition` for the satisfying 'pop' effect on chips (Also waterdroplet like effect on click and hold) and an `AnimatedSwitcher` with a subtle horizontal slide for smooth numeric updates. To ensure a seamless entry, I coordinated `AnimatedSlide` and `AnimatedOpacity` so the suggestion chips appear naturally with the keyboard, while a custom `BlinkingCursor` provides essential visual feedback.

## Project Structure
* **`lib/screen`**: Main screen logic handling keyboard states and scroll physics.
* **`lib/widgets`**: Modularized components (`AmountDisplay`, `SuggestionChips`, `BlinkingCursor`) with isolated animation controllers.
* **`lib/constants`**: centralized styling and animation durations.