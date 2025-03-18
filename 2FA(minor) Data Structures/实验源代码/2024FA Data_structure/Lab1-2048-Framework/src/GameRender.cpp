#include "../include/GameRender.h"
#include <iostream>
#include <iomanip>


void TerminalRender::render(const GameBoard &gameBoard, int score, int moveCount) {
    // clearScreen();
    const auto &board = gameBoard.getBoard();

    // Render score and move count
    std::cout << "+----------------------+\n";
    std::cout << "| Score: " << std::setw(10) << score << "    |\n";
    std::cout << "| Moves: " << std::setw(10) << moveCount << "    |\n";
    std::cout << "+----------------------+\n";

    // Render game board
    std::cout << "\n";
    for (int row = 3; row >= 0; --row) {
        std::cout << "+------+------+------+------+\n";
        for (int col = 0; col < 4; ++col) {
            std::cout << "| " << std::setw(4);
            if (board[row][col] != 0) {
                std::cout << board[row][col];
            } else {
                std::cout << " ";
            }
            std::cout << " ";
        }
        std::cout << "|\n";
    }
    std::cout << "+------+------+------+------+\n";

    // Render help message
    std::cout << "\n";
    displayHelpMessage();
}

void TerminalRender::clearScreen() {
#ifdef _WIN32
    system("cls");
#else
    system("clear");
#endif
}

void TerminalRender::displayWelcomeMessage() {
    std::cout << "Welcome to 2048! Press 'E' to start game. Good luck!\n";
}

void TerminalRender::displayHelpMessage() {
    std::cout << "Available Controls:\n";
    std::cout << "W => Up\n";
    std::cout << "S => Down\n";
    std::cout << "A => Left\n";
    std::cout << "D => Right\n";
    std::cout << "R => Restart game\n";
    std::cout << "U => Undo last move\n";
}

void TerminalRender::displayWinMessage() {
    std::cout << "Congratulations! You've reached 2048! You win!\n";
}

void TerminalRender::displayLoseMessage() {
    std::cout << "Game over! No more moves available.\n";
}

void TerminalRender::displayElapsedTime(double elapsedTime) {
    std::cout << "Elapsed time: " << elapsedTime << " seconds\n";
}
