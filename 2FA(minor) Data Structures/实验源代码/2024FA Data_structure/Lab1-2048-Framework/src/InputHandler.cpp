#include "../include/InputHandler.h"
#include <conio.h> // For _getch()

InputType InputHandler::handleInput() {
    while (true) {
        int input = _getch();

        // Filter out unwanted characters like new line or space
        if (input == '\n' || input == '\r' || input == ' ') {
            continue; // Skip unwanted characters
        }

        // Cast input to unsigned char and convert to uppercase
        input = static_cast<unsigned char>(toupper(input));

        switch (input) {
            case 'W':
                return InputType::UP;
            case 'S':
                return InputType::DOWN;
            case 'A':
                return InputType::LEFT;
            case 'D':
                return InputType::RIGHT;
            case 'E':
                return InputType::START_GAME;
            case 'Q':
                return InputType::QUIT_GAME;
            case 'U':
                return InputType::UNDO;
            case 'R':
                return InputType::RESTART;
            default:
                return InputType::INVALID;
        }
    }
}
