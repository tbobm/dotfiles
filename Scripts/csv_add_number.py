#!/usr/bin/env python

__author__ = theo_massard


def get_csv_content(csv_source="dump_prod.csv"):
    with open(csv_source, 'r') as f:
        content = f.readlines()
    return content


def add_line_number(content):
    res = list()
    priv_id = 0
    for line in content:
        res.append(str(priv_id) + ',' + line)
        priv_id = priv_id + 1
    return res


def create_new_csv(fname="result.csv"):
    with open(fname, 'w') as f:
        for line in res:
            f.write(res[len(res) - priv_id])
            priv_id -= 1


def main():
    content = get_csv_content()
    numbered_content = add_line_number(content)
    create_new_csv(numbered_content)

if __name__ == '__main__':
    main()
