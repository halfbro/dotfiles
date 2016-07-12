#!/bin/python
import curses
from os import wait
from subprocess import Popen

class power_option:
    command = None
    next_opt = None
    prev_opt = None
    x_pos = 0
    name = ""

    def __init__(self, x, n, c):
        self.command = c
        self.name = n
        self.x_pos = x

def main(stdscr):
    stdscr.clear()
    curses.curs_set(0)
    curses.init_pair(1, curses.COLOR_YELLOW, curses.COLOR_BLACK);
    curses.nonl()

    logout = power_option(8, "Logout", ["i3-msg", "exit"])
    lock = power_option(16, "Lock", ["dm-tool","lock"])
    restart = power_option(22, "Reboot", ["reboot"])
    shutdown = power_option(30, "Shutdown", ["shutdown", "now"])

    logout.next_opt = lock
    lock.next_opt = restart
    restart.next_opt = shutdown
    shutdown.next_opt = logout

    logout.prev_opt = shutdown
    lock.prev_opt = logout
    restart.prev_opt = lock
    shutdown.prev_opt = restart 

    selection = lock

    left_keys = {curses.KEY_LEFT, ord('h')}
    right_keys = {curses.KEY_RIGHT, ord('l')}
    return_keys = {ord(' '), 13}
    exit_keys = {ord('q')}

    while True:
        title_str = selection.name
        title_x = (stdscr.getmaxyx()[1] - len(title_str)) // 2

        stdscr.move(1,0)
        stdscr.clrtoeol()

        bolded = curses.color_pair(1) | curses.A_BOLD
        stdscr.addstr(1, title_x, title_str, bolded)

        stdscr.addstr(5, logout.x_pos, logout.name, curses.color_pair(1))
        stdscr.addstr(5, lock.x_pos, lock.name, curses.color_pair(1))
        stdscr.addstr(5, restart.x_pos, restart.name, curses.color_pair(1))
        stdscr.addstr(5, shutdown.x_pos, shutdown.name, curses.color_pair(1))
        stdscr.addstr(5, selection.x_pos, selection.name, bolded)

        stdscr.refresh()
        char = stdscr.getch()
        if char in left_keys:
            selection = selection.prev_opt
        elif char in right_keys:
            selection = selection.next_opt
        elif char in return_keys: 
            Popen(selection.command)
            wait()
            return
        elif char in exit_keys:
            return


curses.wrapper(main)
