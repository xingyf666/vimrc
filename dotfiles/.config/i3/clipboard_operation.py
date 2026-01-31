#!/usr/bin/env python3
import sys
import subprocess
from pynput.keyboard import Key, Controller

TERMINAL_CLASSES = [
    "Xfce4-terminal",
    "kitty",
    "org.wezfurlong.wezterm",
    "Alacritty",
]

def is_terminal_window():
    try:
        result = subprocess.run(
            ["xdotool", "getwindowfocus", "getwindowclassname"],
            capture_output=True,
            text=True
        )
        window_class = result.stdout.strip()
        return window_class in TERMINAL_CLASSES
    except Exception:
        return False

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: clipboard_operation.py [copy|cut|paste]")
        sys.exit(1)

    operation = sys.argv[1].lower()
    keyboard = Controller()
    use_terminal_keys = is_terminal_window()

    if operation == "copy":
        keyboard.release(Key.cmd_l)
        if use_terminal_keys:
            with keyboard.pressed(Key.ctrl, Key.shift):
                keyboard.tap('c')
        else:
            with keyboard.pressed(Key.ctrl):
                keyboard.tap(Key.insert)
        keyboard.pressed(Key.cmd_l)
    elif operation == "cut":
        keyboard.release(Key.cmd_l)
        with keyboard.pressed(Key.shift):
            keyboard.tap(Key.delete)
        keyboard.pressed(Key.cmd_l)
    elif operation == "paste":
        keyboard.release(Key.cmd_l)
        if use_terminal_keys:
            with keyboard.pressed(Key.ctrl, Key.shift):
                keyboard.tap('v')
        else:
            with keyboard.pressed(Key.shift):
                keyboard.tap(Key.insert)
        keyboard.pressed(Key.cmd_l)
    else:
        print("Unknown operation:", operation)
        sys.exit(1)
