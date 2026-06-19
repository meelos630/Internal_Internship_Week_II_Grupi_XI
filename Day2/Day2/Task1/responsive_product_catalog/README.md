# Day 2 Task 1 - Responsive Product Catalog

This Flutter app completes **Internal Internship - Day 2 - Task 1**. It shows a responsive product catalog that works on narrow mobile screens and wider desktop/web screens.

## Assignment

- Build a product list/grid that looks good on small and large screens.
- Use a model class with at least 6 products.
- Show products with a card, price, category, and icon.
- Use `ListView` or `GridView` depending on screen size.
- Add a simple category filter or name search.

## What Is Implemented

1. `Product` model class with 8 products.
2. Responsive layout:
   - `ListView` on narrow screens.
   - `GridView` on wide screens.
3. Product cards with icon, name, category, stock status, and price.
4. Search field for filtering by product name or category.
5. Category filter chips.
6. Empty state when no products match the filters.

## Folder Structure

```text
lib/
  main.dart
  models/
    product.dart
  screens/
    product_catalog_screen.dart
```

## How To Run In FlutLab Or Replit

1. Create or open a Flutter project in FlutLab or Replit.
2. Upload/import this project ZIP, or copy this folder into the Flutter workspace.
3. Run `flutter pub get`.
4. Start the app with the run button or `flutter run`.

## Screenshots

Add screenshots here after running the app:

- Mobile list view.
- Desktop/web grid view.
- Search or category filter result.

## Demo Script

Use this flow for a short demo:

1. Open the app and show the product catalog.
2. Explain that products are stored in the `Product` model list.
3. Show the app on a narrow screen and point out the `ListView`.
4. Widen the preview and show the `GridView`.
5. Search for a product name, for example `watch`.
6. Select a category chip, for example `Electronics`.
7. Clear filters and show all products again.

## Acceptance Criteria Check

- The app has more than 6 products.
- Each product is displayed in a `Card`.
- Each card shows a price, category, and icon.
- The layout changes between `ListView` and `GridView`.
- Search and category filtering work with `setState`.
- The code uses clear names and is organized into model and screen files.

## Future Improvements

- Add product detail screen.
- Load product data from an API.
- Add favorite products.
- Add sorting by price.

