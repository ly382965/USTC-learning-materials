#include "../include/Game.h"

Game::Game() = default;

void Game::initGame() {
    gameBoard.reset();
    score = 0;
    moveCount = 0;
    historyGameBoards = std::stack<GameBoard>();
    historyscore = std::stack<int>();
    startTime = std::chrono::system_clock::now();
    historyGameBoards.push(gameBoard);  // Save initial state
}

void Game::updateGame(Direction direction) {
    // Save current state to history
    // TODO 1
    historyGameBoards.push(gameBoard);
    // Get move score and update score
    // TODO 2
    score+=gameBoard.move(direction);
    historyscore.push(score);
    // update move count
    // TODO 3
    moveCount++;

}

void Game::undoLastMove() {
    if (historyGameBoards.size() > 1 && historyscore.size() > 1) {
        // Remove current state
        // TODO 1
        historyGameBoards.pop();
        historyscore.pop();
        // Restore previous state
        // TODO 2
        gameBoard=historyGameBoards.top();
        score=historyscore.top();
        moveCount--;
    } else {
        gameBoard.reset();
    }
}

bool Game::hasWon() const {
    return gameBoard.hasWinningTile();
}

bool Game::hasLost() const {
    return gameBoard.isGameOver();
}

double Game::getElapsedTime() const {
    auto endTime = std::chrono::system_clock::now();
    std::chrono::duration<double> elapsedSeconds = endTime - startTime;
    return elapsedSeconds.count();
}

int Game::getScore() const {
    return score;
}

int Game::getMoveCount() const {
    return moveCount;
}

const GameBoard& Game::getGameBoard() const {
    return gameBoard;
}