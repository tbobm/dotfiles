import sys
import os


def get_errors(element):
    return (element[1])


def pretty_tuple(l):
    for path, status in l:
        print("File {} is missing a header.".format(path))


def crawl_in_files(dir_to_crawl):
    res = []
    currpath = dir_to_crawl
    for file in os.listdir(currpath):
#        print(os.path.realpath(file))
        if file.endswith(".c"):
            res.append(has_header(dir_to_crawl + '/' + file))
        if os.path.isdir(file):
            pass
#            res = crawl_in_files(file)
    return (res)


def has_header(filename):
    first_lines = []
    with open(filename, 'r') as f:
        first_lines.append(f.readline())
        first_lines.append(f.readline())
    if first_lines[0].startswith("/*") and first_lines[1].startswith("**"):
        print("Not a single problem with {}".format(filename))
        return (os.path.abspath(filename), False)
    else:
        print_first_linesf(first_lines, filename)
        return (os.path.abspath(filename), True)


def print_first_linesf(f, fname):
    try:
        print("0:0: {}\n0:1 {}\n1:0: {}\n1:1: {}\n".format(f[0][0], f[0][1], f[1][0], f[1][1]))
    except IndexError:
        print("There was a problem formatting the file {}".format(fname))


if __name__ == "__main__":
    if (len(sys.argv) < 2):
        direct = os.getcwd() + '/.'
    else:
        print(sys.argv)
        direct = os.getcwd() + '/' + sys.argv[1]
    print(direct)
    res = crawl_in_files(direct)
    tot_false = len(filter(lambda x: x[1] == False, res))
    print(tot_false)
    pretty_tuple(filter(get_errors, res))
