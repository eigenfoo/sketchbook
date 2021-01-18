""" Configurations for L-systems. """

from dataclasses import dataclass
from typing import Dict


@dataclass
class LSystem:
    # L-system parameters
    alphabet: set
    num_iterations: int
    start: str
    productions: Dict[str, str]

    # Plotting parameters
    angle: float
    length: float


koch1 = LSystem(
    alphabet=set("LrlfAB"),
    num_iterations=4,
    start="L",
    productions={"L": "flflflf", "f": "fflflflflflfrf"},
    angle=90,
    length=5,
)

koch2 = LSystem(
    alphabet=set("LrlfAB"),
    num_iterations=6,
    start="L",
    productions={"L": "flflflf", "f": "fflfrflflff"},
    angle=90,
    length=4,
)

sierpinski = LSystem(
    alphabet=set("LrlfAB"),
    num_iterations=8,
    start="L",
    productions={"L": "B", "A": "BrArB", "B": "AlBlA"},
    angle=60,
    length=2,
)

gosper = LSystem(
    alphabet=set("LrlfAB"),
    num_iterations=5,
    start="L",
    productions={"L": "A", "A": "ArBrrBlAllAAlBr", "B": "lArBBrrBrAllAlB"},
    angle=60,
    length=5,
)

dragon = LSystem(
    alphabet=set("LrlfAB"),
    num_iterations=20,
    start="L",
    productions={"L": "A", "A": "ArBr", "B": "lAlB"},
    angle=90,
    length=1,
)

simpletree = LSystem(
    alphabet=set("LrlfAB[]"),
    num_iterations=4,
    start="L",
    productions={"L": "f[rL]lL"},
    angle=30,
    length=20,
)

