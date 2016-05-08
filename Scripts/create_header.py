#!/usr/bin/python3
import sys
import os


def create_config(params=None):
    if params is None:
        return False
    try:
        informations = {"email": params[0], "name": params[1], "firstname": params[2]}
        print("Your infos {}".format(informations))
    except IndexError:
        print("Missing informations, expected 3 ")


if __name__ == '__main__':
    create_config(sys.argv[1:])