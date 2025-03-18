#ifndef INC_2048_INPUTHANDLER_H
#define INC_2048_INPUTHANDLER_H

#include "GameBoard.h"

enum class InputType {
    UP,
    DOWN,
    LEFT,
    RIGHT,
    START_GAME,
    QUIT_GAME,
    UNDO,
    RESTART,
    INVALID
};

class InputHandler {
public:
    static InputType handleInput();
};

#endif //INC_2048_INPUTHANDLER_H
