#!/usr/bin/env python

import os
import os.path

def conv_filter(file_name):
    if file_name.find('.tex') >= 0:
        if file_name.find('_') >= 0:
            return True
    return False

def name_conv(curr_dir):
    files = os.listdir(curr_dir)
    for f in files:
        if f.find('.') == 0: 
            continue
        f = os.path.join(curr_dir, f)
        if os.path.isdir(f):
            name_conv(f)
        elif os.path.isfile(f) and conv_filter(f):
            new_name = f.replace('_', '-')
            os.rename(f, new_name)

name_conv('.')

