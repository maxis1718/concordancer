# coding :utf-8

import re

def highlight(s): return "<span>"+s+"</span>"

def _ellipsis(string, length, reverse=False, mockup="..."):
    part = string[-1*length:] if reverse else string[0:length]
    if len(part) != len(string):
        # add mockup
        part = mockup + part if reverse else part + mockup
    return part

def _boundary_white_space(string, reverse=False):

    if len(string) == 0:
        return string

    if reverse and string[-1] == ' ':
        new = string[:-1] + '&nbsp;'
    elif not reverse and string[0] == ' ':
        new = '&nbsp;' + string[1:]
    else:
        new = string 
    return new



def naive_search(query, ellipsis=True, corpus_path='corpus/bnc.dev.txt'):
    if len(query.strip()) is 0:
        print 'nothing to search, exit'
        return []

    matches, raw = [], []
    for line in open(corpus_path).readlines():
        tokens = line.split(query)

        if len(tokens) == 1:
            # no match
            continue
        
        # collect raw data
        raw.append(line)

        # use &npsb; to present space
        first, last = _boundary_white_space(tokens[0], reverse=True), _boundary_white_space(''.join(tokens[1:]))
        
        # ellipsis the first and last part if enabled
        if ellipsis:
            first = _ellipsis(first, length=36, reverse=True, mockup="...")
            last = _ellipsis(last, length=36, reverse=False, mockup="...")
        
        matches.append( (first, highlight(query), last) )

    return matches

if __name__ == '__main__':
    matches = naive_search('however')
    print matches
