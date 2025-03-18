
#ifndef INC_2048_GAMERENDER_H
#define INC_2048_GAMERENDER_H

#include "GameBoard.h"

class TerminalRender {
public:
    TerminalRender() = default;
    static void render(const GameBoard& gameBoard, int score, int moveCount);
    static void clearScreen();
    static void displayWelcomeMessage();
    static void displayWinMessage();
    static void displayLoseMessage();
    static void displayElapsedTime(double elapsedTime);

private:
    static void displayHelpMessage();
};

#endif //INC_2048_GAMERENDER_H
