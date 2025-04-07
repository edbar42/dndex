# DnDex - A Text-Based Adventure in Elixir

DnDex is a simple text-based adventure game written in Elixir.

It serves as a practical application and personal exploration of the concepts presented in the book [*Learn Functional Programming With Elixir*](https://pragprog.com/titles/cdc-elixir/learn-functional-programming-with-elixir/) by Ulisses Almeida.

## Gameplay

In DnDex, you navigate through a series of interconnected rooms within a dungeon.

*   **Exploration:** You move from room to room by choosing directions.
*   **Objective:** Your goal is to find the **Exit Room** and escape.
*   **Survival:** Keep an eye on your health! If it drops to zero, your adventure ends.
*   **Search Rooms:** Some rooms appear empty but offer a chance to **search**. Be careful! You might find a life-saving **healing potion**, or you might trigger a nasty **trap** that damages you. The outcome is random.
*   **Combat Rooms:** Other rooms are guarded by hostile creatures. You'll enter **combat** and must defeat the enemy before they defeat you.

## Getting Started

To run DnDex, you need to have Elixir and Mix installed on your system. You can find installation instructions on the [official Elixir website](https://elixir-lang.org/install.html).

### Installation

1.  **Clone the repository:**

    ```bash
    git clone git@github.com:edbar42/dndex.git
    cd dndex
    ```

2.  **Install dependencies:**
    Mix handles package management in Elixir. Run the following command to fetch the necessary dependencies:

    ```bash
    mix deps.get
    ```

### Running the Game

This project includes a custom Mix task `start` to easily launch the game. Run the following command in your terminal from the project's root directory:

```bash
mix start
```

Have fun!
