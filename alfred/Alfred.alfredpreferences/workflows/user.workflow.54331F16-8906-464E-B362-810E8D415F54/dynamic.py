#!/usr/bin/python3
#
# Copyright (c) 2021 Dean Jackson <deanishe@deanishe.net>
# MIT Licence. See http://opensource.org/licenses/MIT
#
# Created on 2021-05-05
#

""""""

import os
import plistlib
import sys


# UID of the File Filter we want to adjust
UID = '73A0F42B-9974-4C33-B467-F6E10D6ED8AE'


def log(s, *args, **kwargs):
    """Log to STDERR."""
    if args:
        s = s % args
    elif kwargs:
        s = s % kwargs

    print(s, file=sys.stderr)


def pretty_path(p):
    """Replace $HOME with ~."""
    h = os.getenv('HOME')
    if not p.startswith(h):
        return p

    return '~' + p[len(h):]


def main():
    """Run script."""
    dirpath = pretty_path(sys.argv[1])
    log('\U0001F37A')
    log('setting path: %s', dirpath)
    with open('info.plist', 'rb') as fp:
        info = plistlib.load(fp)

    for d in info['objects']:
        if d['uid'] == UID:
            if d['config']['scopes'] == [dirpath]:
                log('unchanged')
                return

            title = f'Search \u201C{dirpath}\u201D \u2026'
            d['config']['scopes'] = [dirpath]
            d['config']['title'] = title
            log('set scope: %s', dirpath)
            log('set title: %s', title)
            break
    else:
        raise ValueError(f'File Filter {UID} not found')

    with open('info.plist', 'wb') as fp:
        plistlib.dump(info, fp)

    print(f'Set scope to \u201C{dirpath}\u201D', end='')


if __name__ == '__main__':
    main()
