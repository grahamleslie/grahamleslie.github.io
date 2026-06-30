---
layout: post
title: "The Logbook: Engineering the Perfect PSI"
date: 2026-06-29
categories: [Engineering, Mechanics]
tags: [BMW M235i, Yokohama AD09, Sonoma Raceway, Laguna Seca]
---

In software, we have Prometheus. On the track, you have a logbook. Without it, you aren't "testing"—you're just driving.

Most amateur drivers obsess over horsepower. The professionals obsess over their contact patch. If you're running a car like the M235i with only -2 degrees of camber, your tire pressure isn't just about grip; it's about insurance. One bad heat cycle on a set of Yokohama AD09s can scrub your shoulders into oblivion if you aren't disciplined.

Here is what actual track-side observability looks like.

### The Standard Library: Yokohama AD09 Specs
These aren't suggestions; they are the boundary conditions for the system.

**Autocross (The Sprint)**
*   **Cold Ideal:** 33 Front / 31 Rear (Start high to protect shoulders on Run 1)
*   **Hot Ideal:** 37-39 Front / 35-36 Rear
*   **Abort Zone:** 41 PSI or 165°F

**Track Day (The Marathon)**
*   **Cold Ideal:** 30 Front / 28 Rear
*   **Hot Ideal:** 36-37 Front / 34-35 Rear
*   **Abort Zone:** <34 PSI (rollover risk) or >41 PSI (greasy)
*   **Temp Limit:** 170°F

### The Logic of Shoulder Protection
If you’re running limited camber (-2°), the tire wants to roll. We prevent this with two sets of rules:
1.  **The Chalk Test:** If the scrub passes the triangle, add 2 PSI immediately.
2.  **Thermal Throttling:** If you hit 170°F, **do not bleed air**. You’ve reached the limit of the rubber's structural integrity for this session. Pit, cool down, and re-evaluate your lines.

---

### Raw Data: A Tale of Two Tracks

#### Laguna Seca (12/01/24) - The 170°F Problem
*   **Session 4 Analysis:** Started at 27/28 Cold. Hit the target 34-36 PSI Hot after a full session. **Success? No.**
*   **The Bottleneck:** Temps hit 170°F. The operating window for these tires is 125-150°F.
*   **The Fix:** "Need to pit earlier, avoid scrubbing, alternate hot/cool laps." This is the mechanical equivalent of managing CPU throttling.

#### Sonoma Raceway (09/20/25) - Chasing the Delta
*   **Session 1:** 28/30 Cold -> 32/34 Hot (+4/+4). Ambient 60°.
*   **Session 3:** Ambient rose to 70°. 37/37 Hot. Had to bleed -2/-2 to stay in the window.
*   **Takeaway:** Next time, start 29/31. Give the sidewalls more initial stiffness to combat the Sonoma transitions.

### The Pragmatic Maker’s View
This logbook is a record of failure modes and mitigations. It’s how you know that the Right-Hand Side (RHS) consistently runs 2° hotter at Laguna Seca. It's how you know when to stop "tuning" and start driving differently.

If you don't have a scratch pad full of messy PSI deltas and thermal warnings, you isn't building a skill set—you're just burning gas.

**Simple, but Significant.**

