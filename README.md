# Southsea Cinema

Southsea Cinema is a Flutter Android app for browsing movies, selecting tickets, managing a basket, saving bookings, and maintaining a customer profile.

## Platform

The app runs on Android only because completed bookings are stored locally using SQLite. Use an Android emulator or physical Android device. Browser and desktop execution are not supported.

## Implemented Features

### Home

- Loads movie information from `assets/data/movies.json`.
- Displays each film's poster, title, age rating, description, screening time, and **BOOK NOW** button.
- Uses `assets/images/` for the movie posters.
- Shows a loading indicator while movies are loaded and an error message if loading fails.

### Movie Listing

- Shows the film title and age rating, cinema room, screening time, and ticket price.
- Allows ticket quantities from `0` to `5`.
- Prompts the user to select at least one ticket when the quantity is `0`.
- Adds a positive ticket quantity to the basket and confirms the addition.

### Basket and Checkout

- Displays basket line items and line totals.
- Calculates the combined basket total.
- Allows individual basket items to be removed.
- Saves completed bookings to SQLite.
- Clears the basket after successful checkout.
- Displays checkout success or failure messages.
- Displays previously saved bookings.

Basket contents are held in memory and are not restored after the app closes.

### Settings

- Stores a full name, delivery address, email address, and newsletter preference.
- Includes a light/dark theme switch.
- The existing **Save Settings** button saves the profile values and selected theme with `SharedPreferencesAsync`.
- The selected theme is restored when the app starts.
- Dark mode is the default theme.

### Navigation

The app includes a navigation drawer and named routes for:

- `/` — Home
- `/basket` — Basket
- `/settings` — Settings

Movie listings open from the home screen using the booking button.

## Data and Storage

- Movie data: `assets/data/movies.json`
- Movie images: `assets/images/`
- Profile and theme preferences: `SharedPreferencesAsync`
- Completed bookings: SQLite
- Basket: in-memory repository

## Technologies

- Flutter
- Dart
- SQLite through `sqflite`
- `SharedPreferencesAsync`

## Project Structure

```text
lib/
├── constants.dart
├── main.dart
├── database/
├── models/
├── repositories/
├── views/
│   ├── home_view.dart
│   ├── movie_listing.dart
│   ├── basket_view.dart
│   └── settings_view.dart
└── widgets/
assets/
├── data/movies.json
└── images/
test/
```

## Prerequisites

Install:

- Flutter with the Android toolchain
- Android Studio or another configured Android development environment
- An Android emulator or physical Android device
- Git

## Setup

Clone the repository, open the project directory, and run:

```bash
flutter pub get
```

Start an Android emulator or connect a physical Android device.

## Running the App

Running the app requires a connected Android emulator or physical Android device:

```bash
flutter run
```

## Automated Tests

Automated tests do not require an emulator. Run the test suite with:

```bash
flutter test
```

The tests cover app startup and themes, home and booking navigation, Settings persistence, basket operations, SQLite bookings, models, repositories, and widgets.

## Static Analysis

Run static analysis with:

```bash
dart analyze
```

## Screenshots

Place screenshots in a `screenshots/` directory and update the paths below.

### Home Screen

```markdown
![Southsea Cinema home screen](screenshots/home.png)
```

### Movie Listing Image

```markdown
![Movie listing](screenshots/movie-listing.png)
```

### Basket

```markdown
![Basket](screenshots/basket.png)
```

### Settings Image

```markdown
![Settings](screenshots/settings.png)
```

### Light and Dark Themes

```markdown
![Light theme](screenshots/light-theme.png)
```

```markdown
![Dark theme](screenshots/dark-theme.png)
```
