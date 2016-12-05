#!/usr/bin/python3
import sys
import os


def get_errors(element):
    return (element[1])


def pretty_tuple(tup):
    for path, status in tup:
        print("File {} is missing a header.".format(path))


def crawl_in_files(dir_to_crawl, func_to_exec=None):
    if func_to_exec is None:
        func_to_exec = crawl_in_files
    res = []
    for file in os.listdir(dir_to_crawl):
        #        print(os.path.realpath(file))
        if file.endswith(".c"):
            res.append(has_header(dir_to_crawl + '/' + file))
        if os.path.isdir(file):
            pass
            res = func_to_exec(file)
    return (res)


def has_header(filename):
    first_lines = []
    with open(filename, 'r') as f:
        first_lines.append(f.readline())
        first_lines.append(f.readline())
    return is_header_ok(first_lines, filename)


def is_header_ok(content, fname):
    if content[0].startswith("/*") and content[1].startswith("**"):
        print("Not a single problem with {}".format(fname))
        return (os.path.abspath(fname), False)
    else:
        print_first_linesf(content, fname)
        return (os.path.abspath(fname), True)


def print_first_linesf(f, fname):
    try:
        print("Error in {}'s header !\nline 0: {}line 1: {}".format(
            fname, f[0], f[1])
        )
    except IndexError:
        print("There was a problem printing\
        the first lines of the file {}".format(fname))


def get_paths(path_list=None):
    if path_list is None:
        path_list = [os.getcwd() + '/.']
    return path_list


if __name__ == "__main__":
    if (len(sys.argv) < 2):
        direct = os.getcwd() + '/.'
    else:
        print(sys.argv)
        direct = os.getcwd() + '/' + sys.argv[1]
    print(direct)
    res = crawl_in_files(direct)
    tot_false = len(list(filter(lambda x: x[1] is False, res)))
    print(tot_false)
    pretty_tuple(filter(get_errors, res))
