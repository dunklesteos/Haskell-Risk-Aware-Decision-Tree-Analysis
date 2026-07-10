# Dynamic Risk Tree Visualizer & Analyzer

An interactive application for building, visualizing, and evaluating **Risk Trees** using a **Pure Haskell** computation engine and an **HTML5 Canvas**-based graphical interface.

The project combines functional programming with an intuitive visualization tool, allowing users to create decision trees, assign costs, and analyze risk using recursive mathematical models.

---

## Features

- Interactive Risk Tree editor
- HTML5 Canvas visualization
- Zooming and panning support
- Dynamic node creation and branching
- Custom cost assignment
- Pure Haskell recursive evaluation engine
- Responsive English user interface

---

## Technologies

- Haskell (GHC)
- HTML5
- CSS3
- JavaScript
- HTML5 Canvas

---

## Project Structure

```
.
├── index.html      # Interactive graphical interface
├── Main.hs         # Haskell risk evaluation engine
├── style.css
├── script.js
└── README.md
```

### Frontend

The browser interface allows users to:

- Create decision trees interactively
- Add Decision, Chance, and Leaf nodes
- Enter custom costs
- Navigate the tree using zoom and pan
- Visualize complex tree structures in real time

### Backend

The Haskell implementation performs all mathematical computations using recursive functions.

Main algorithms include:

- `riskcost`
- `risktreeheight`
- `nodetype`

The computation engine is implemented entirely in Pure Haskell without external libraries.

---

## Mathematical Model

### Leaf Node

```
Cost = x
```

where `x` is the assigned leaf cost.

### Decision Node

The engine selects the branch with the minimum risk.

```
Cost = min(left, right)
```

### Chance Node

The expected cost is adjusted according to the user's risk aversion parameter (λ).

```
Cost = Mean + λ × Variance
```

A higher λ increases the penalty for uncertain outcomes.

---

## Running the Project

### Frontend

Simply open `index.html` in your web browser.

Or use the live demo via GitHub Pages:

> **https://YOUR_GITHUB_PAGES_LINK**

---

### Haskell Engine

Compile using GHC:

```bash
ghc --make Main.hs -o RiskEngine
```

Run:

**Windows**

```bash
RiskEngine.exe
```

**Linux / macOS**

```bash
./RiskEngine
```

---

## Example Scenario

### The Umbrella Decision

Suppose you must decide whether to take an umbrella before leaving home.

**Option A — Take the umbrella**

- Rain → Cost = 3
- Sunny → Cost = 3

This option has very low uncertainty.

---

**Option B — Leave the umbrella**

- Rain → Cost = 15
- Sunny → Cost = 0

This option has a much larger variance.

---

The program evaluates both alternatives.

- With **low λ**, only the average cost matters, making the second option more attractive.
- With **high λ**, uncertainty is heavily penalized, causing the first option to become the preferred decision.

This demonstrates how different levels of risk aversion influence optimal decision-making.

---

## Educational Purpose

This project was developed to demonstrate:

- Functional Programming in Haskell
- Recursive tree algorithms
- Decision theory
- Risk analysis
- Interactive data visualization

---

## License

This project was developed for educational purposes.
