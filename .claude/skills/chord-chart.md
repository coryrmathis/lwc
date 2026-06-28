# chord-chart

Generate a ChordPro chord chart from a plain-language description and output it ready to paste into the LWC app.

## Usage

```
/chord-chart <description>
```

**Examples:**
```
/chord-chart "Locker" is in C minor, 4/4. Verse: 4 bars of Cm, then Cm-Fm-G7-Cm. Chorus: Eb-Bb-Ab-G7 repeated twice, end on Cm.
/chord-chart "Porch Song" is in G, 3/4 waltz feel. Intro: G-C-G-D. Verse: G C G D, G C D D. Chorus: Em C G D.
/chord-chart Cover of "Jolene" by Dolly Parton. Original key Am. Verse: Am-C-G-Am. Chorus: Am-C-G-Am-Am.
```

## What to output

Output **only valid ChordPro**, no explanation before or after. The user will paste this directly into the chord chart textarea in the app.

Rules:
- Always start with `{title:}`, `{key:}`, `{time:}` directives
- Add `{tempo:}` if BPM is mentioned
- Use `{start_of_verse}` / `{end_of_verse}`, `{start_of_chorus}` / `{end_of_chorus}`, `{start_of_bridge}` / `{end_of_bridge}` for sections
- If lyrics are provided, put chords inline: `[Cm]Dark and [Fm]stormy`
- If no lyrics, use grid notation: `[Cm] / / / | [Fm] / / / | [G7] / / / | [Cm] / / /`
- Use `|:` for repeat start, `:|` for repeat end
- Use `%` to repeat the previous bar
- A blank line separates sections visually

## Example output

For input: *"Locker" is in C minor, 4/4. Verse: Cm Fm G7 Cm twice. Chorus: Eb Bb Ab G7, repeat, resolve to Cm.*

```
{title: Locker}
{key: Cm}
{time: 4/4}

{start_of_verse}
[Cm] / / / | [Fm] / / / | [G7] / / / | [Cm] / / /
[Cm] / / / | [Fm] / / / | [G7] / / / | [Cm] / / /
{end_of_verse}

{start_of_chorus}
|: [Eb] / / / | [Bb] / / / | [Ab] / / / | [G7] / / / :|
[Cm] / / / |
{end_of_chorus}
```
