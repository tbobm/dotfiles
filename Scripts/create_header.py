#!/usr/bin/python3
import sys
import os


def create_config(params=None):
    if params is None:
        return False
    try:
        informations = {
            "email": params[0],
            "name": params[1],
            "firstname": params[2]
        }
        print("Your infos {}".format(informations))
        return informations
    except IndexError:
        print("Missing informations, expected 3 ")
        return False


if __name__ == '__main__':
    infos = create_config(sys.argv[1:])
    config_path = os.path.expanduser('~') + "/.myheaderconfig.json"
    print(config_path)
    infos = False
    if infos is not False:
        config_path = os.expanduser('~')+'1'
