# inclass15

A real-time inventory management app built with Flutter and Firebase Firestore.

## Features
- Create, read, update, delete inventory items (full CRUD)
- Real-time sync via Firestore StreamBuilder
- Form validation for all fields (name, quantity, price)
- Loading, empty, and error states handled in UI

## Enhanced Features

### 1. Search + Category Filter
Users can search items by name or category in real time using a text field.
Category chips let users filter the list to a single category instantly.
Both use the same Firestore stream; search applies a client-side filter.

### 2. Stock Status Indicator
Each item card automatically shows a colored badge:
- 🟢 In Stock (qty ≥ 5)
- 🟠 Low Stock (qty 1–4)
- 🔴 Out of Stock (qty = 0)
This gives warehouse staff instant visual feedback without opening each item.

## Setup
1. Clone this repo
2. Run 'flutter pub get'
3. Run 'flutterfire configure' with your Firebase project
4. Run 'flutter run'

## APK
See '/apk/app-release.apk' in this repo.
# inclass15
