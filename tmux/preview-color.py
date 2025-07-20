#!/usr/bin/env python3

import sys
import os
from pprint import pprint


def hex_to_rgb(hex_color):
    hex_color = hex_color.lstrip('#')
    return tuple(int(hex_color[i:i+2], 16) for i in (0, 2, 4))

def color_block(hex_color):
    r, g, b = hex_to_rgb(hex_color)
    # Using ANSI escape codes for 24-bit color
    return f"\033[48;2;{r};{g};{b}m \033[0m"


def toarray(theme):
    themes = set()
    plugin_path = os.getenv('TMUX_PLUGIN_MANAGER_PATH', None)
    assert plugin_path is not None
    with open(f"{plugin_path}/catppuccin/tmux/themes/catppuccin_{theme}_tmux.conf", "r") as f:
        for line in f.readlines():
            if line.strip() == '':
                continue
            if line.startswith('#'):
                continue
            arr = line.strip().split(' ')[2::]
            assert len(arr) == 2, "len mismatch"
            name, hex = arr
            themes.add((name, hex.strip('"')))
    return sorted(list(themes))

def formatall(all_themes):
    names, tups = all_themes
    res=[" ".join(names)]
    assert len(set(len(t) for t in tups)) == 1
    for row in zip(*tups):
        blocks = "".join((color_block(hex) * 4 for _,hex in row))
        color_name = row[0][0]
        res.append(f"{blocks} {color_name}")
    return "\n".join(res)

def formatone(name):
    theme = toarray(name)
    longest=len(max(theme, key=lambda x: len(x[0]))[0])
    res=[name, "-"*20]
    for name, hex in theme:
        block = color_block(hex)*40
        aligned_block = f"{" ":<{longest}} {block}"
        res.append(aligned_block)
        res.append(f"{name:<{longest}} {block}")
        res.append(aligned_block)
    return "\n".join(res)

def main():
    frappe =    ("frappe", toarray("frappe"))
    latte =     ("latte", toarray("latte"))
    mocha =     ("mocha", toarray("mocha"))
    macchiato = ("macchiato", toarray("macchiato"))

    all_themes = tuple(zip(
        frappe,
        latte,
        mocha,
        macchiato
    ))

    if len(sys.argv) == 1:
        print(formatall(all_themes))
    elif len(sys.argv) == 2:
        print(formatone(sys.argv[1]))

if __name__ == '__main__':
    main()

