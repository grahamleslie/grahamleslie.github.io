# Website Design & Layout Guide

This guide documents the aesthetic and architectural principles of the grahamleslie.github.io website.

## 1. Aesthetic: "Refined Grit"
The design language is inspired by the rugged beauty of **Tomales Bay, CA** and the heritage-modern aesthetic of **Scribe Winery** in Sonoma. It balances a raw, outdoor feel with professional, deliberate typography.

*   **Color Palette:** Derived from coastal California—fog, rusted iron, crushed shells, and eelgrass.
    *   **Oyster Soot (#1a1c1e):** Primary background. Deep, textured dark-mode base.
    *   **Crushed Shell (#e8e9e3):** Primary text. Off-white, soft on the eyes.
    *   **Iron Rust (#a69b8f):** Primary accent.
    *   **Nick's Cove Rust (#b76e4b):** "Oxidized Hardware" accent. Used for link hovers and technical log brackets.
    *   **Bay Green (#2d3b36):** Desaturated teal used for text selection background—mimics Tomales Bay silt.
    *   **Eel Grass (#3e4c48):** Border colors.
*   **Vibe:** Sophisticated but weathered. High-end typography (serifs) meets dark, industrial tones.

## 2. Typography
The site uses a heavy serif-driven stack to lean into the "Scribe" inspiration, prioritizing readability and a vintage-modern feel.

*   **Primary Fonts:** `Crimson Pro`, `Georgia`, `serif`.
*   **Body Content:** High line-height ($line-height-base: 1.6$) to ensure long-form technical posts are breathable. Picked Crimson Pro for a more "letterpress" feel—less playful than Fraunces, more serious and weathered.
*   **Headings:** Bold serifs with slight letter-spacing reduction for a compact, editorial look.

## 3. Layout & Structure
The site is built with Jekyll, utilizing a minimal and responsive grid system.

*   **The Home Page:** Designed as a high-impact intro. Features a "morphing" image effect—a deliberate nod to fluid systems and organic shapes.
*   **The Wrapper:** Post content is constrained to a readable maximum width of `700px`. This prevents line lengths from getting too long and losing the reader.
*   **Navigation:** Minimalist. Sticky header with text-shadowing to maintain legibility against varying backgrounds.

## 4. Components & Styling Rules
*   **Links:** 
    *   **Global:** Subtle opacity transitions. No underlines by default for UI elements (nav, titles).
    *   **Post Content:** Explicit `underline` styling to ensure referral links and technical documentation are discoverable.
*   **Images:** All images within the `.post-content` utilize an `8px` border radius and consistent margins to maintain the "refined" part of "refined grit."
*   **Code Blocks:** Uses an Apple-inspired mono stack (`SF Mono`, `Menlo`) with a subtle semi-transparent background to set technical blocks apart without clashing with the serif body text.

## 5. Directory Mapping
*   `_sass/variables.scss`: The source of truth for the Tomales Bay color palette.
*   `_sass/layout.scss`: Contains the grid systems and the "morphing image" logic.
*   `_posts/`: Markdown files following the `WRITING_GUIDE.md` principles.
