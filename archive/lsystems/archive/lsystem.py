""" L-systems. """

import re
import turtle
from typing import Dict, Callable
import configs


config = configs.simpletree


__positions_stack = []
INSTRUCTIONS: Dict[str, Callable] = {
    "L": lambda: None,
    "f": lambda: turtle.forward(config.length),
    "A": lambda: turtle.forward(config.length),
    "B": lambda: turtle.forward(config.length),
    "r": lambda: turtle.setheading(turtle.heading() + config.angle),
    "l": lambda: turtle.setheading(turtle.heading() - config.angle),
    "[": lambda: __positions_stack.append((turtle.position(), turtle.heading())),
    "]": lambda: foo(),
}


def foo():
    pos, head = __positions_stack.pop()
    turtle.penup()
    turtle.setposition(pos)
    turtle.setheading(head)
    turtle.pendown()


def validate_lsystem(start: str, productions: str, alphabet: set):
    assert len(start) == 1
    assert all([len(key) == 1 for key in productions.keys()])
    if alphabet is not None:
        assert start in alphabet
        assert all([key in alphabet for key in productions.keys()])
        assert all([set(value).issubset(alphabet) for value in productions.values()])


def get_s(start, productions, num_iterations):
    find_regex = "|".join(productions.keys())
    s = start
    for _ in range(num_iterations):
        indices = list(reversed([m.start() for m in re.finditer(find_regex, s)]))
        for index in indices:
            s = s[:index] + productions[s[index]] + s[index + 1 :]
    return s


def draw(s, instructions):
    turtle.reset()
    turtle.hideturtle()
    turtle.speed("fastest")
    for char in s:
        instructions[char]()
    turtle.done()


if __name__ == "__main__":
    validate_lsystem(config.start, config.productions, config.alphabet)
    s = get_s(config.start, config.productions, config.num_iterations)
    draw(s, INSTRUCTIONS)
