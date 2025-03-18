#ifndef INC_2048_GAME_H
#define INC_2048_GAME_H

#include "GameBoard.h"
#include <stack>
#include <chrono>

class Game {
public:
    Game();
    void initGame();
    void updateGame(Direction direction);
    void undoLastMove();
    bool hasWon() const;
    bool hasLost() const;
    double getElapsedTime() const;
    int getScore() const;
    int getMoveCount() const;

    const GameBoard& getGameBoard() const;

private:
    GameBoard gameBoard;
    int score{};
    int moveCount{};
    std::stack<GameBoard> historyGameBoards;
    std::stack<int> historyscore;
    std::chrono::time_point<std::chrono::system_clock> startTime;

};


#endif //INC_2048_GAME_H
