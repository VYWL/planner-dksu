# Media Extraction

## Purpose

Use this reference for media-first surfaces where the core object is a video, audio file, live stream, or channel rather than a standard article page.

## Consult When

- The source is a video or audio URL.
- The request is about media metadata, transcripts, or channel inventory.
- The visible page matters less than the media object itself.
- A normal article extraction branch would lose the important fields.

## Trigger Surfaces

- video URL
- audio or podcast episode
- livestream page
- channel or playlist request
- media platform profile

## What This Reference Adds

- A dedicated branch for media objects.
- A reminder that media surfaces often require metadata-first reasoning.
- A way to separate article logic from media logic in researcher routing.

## Planning-only Adaptation Rules

- Preserve media handling as branch knowledge, not as a required toolchain.
- Treat transcripts, captions, titles, uploader identity, and duration as the core planning signals.
- Avoid turning media-specific tactics into plugin runtime obligations.

## Trust Notes

- Media metadata can be high value even when full transcript access is unavailable.
- Channel- or playlist-level lists may still support planning even without playback-level detail.
- Pair with `metadata.md` when the page also exposes structured signals.

## Routing Summary

1. Detect whether the target is a media object rather than a normal page.
2. If yes, take the media branch early.
3. Use media metadata and optional text layers as planning evidence, then return to normal synthesis.
