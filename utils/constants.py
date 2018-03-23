import os, fnmatch

## constants
base_dir = os.getcwd()
seeds_dir = os.path.join(base_dir, 'seeds/')
logs_dir = os.path.join(base_dir, 'logs/')

if not os.path.exists(os.path.join(base_dir, 'js_engines')):
    raise NameError("please load this module from the base directory (or generalize this code)")
js_dir = os.path.join(base_dir, 'js_engines/bin')

# javascriptcore
javascriptcore = find('jsc', js_dir)
# chakra
chakra = find('ch', js_dir)
# spider monkey
spidermonkey = find('spidermonkey', js_dir)
# v8
v8 = find('v8', js_dir)

''' 
    This function looks for a file (file_name param) within a directory (path)
'''
def find(file_name, path):
    result = find_file_bypattern(file_name, path)
    return [] if result == [] else result[0]

def find_file_bypattern(pattern, path):
    result = []
    #pylint: disable=W0612
    for root, dirs, files in os.walk(path):
        for name in files:
            if fnmatch.fnmatch(name, pattern):
                result.append(os.path.join(root, name))
    return result