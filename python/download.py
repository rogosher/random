import sys
import argparse
import urllib.request
from urllib.parse import unquote
from urllib.error import HTTPError, URLError
import shutil

parser = argparse.ArgumentParser()
parser.add_argument('url', type=str, help='url to download from')
#parser.add_argument('output_location', type=str, help='where to download')

args = parser.parse_args()

def query_yes_no(question, default="yes"):
    """Ask a yes/no question via input() and return their answer.

    "question" is a string that is presented to the user.
    "default" is the presumed answer if the user just hits <Enter>.
        It must be "yes" (the default), "no" or None (meaning
        an answer is required of the user).

    The "answer" return value is True for "yes" or False for "no".
    """
    valid = {"yes": True, "y": True, "ye": True,
             "no": False, "n": False}
    if default is None:
        prompt = " [y/n] "
    elif default == "yes":
        prompt = " [Y/n] "
    elif default == "no":
        prompt = " [y/N] "
    else:
        raise ValueError("invalid default answer: '{}'".format(default))

    while True:
        sys.stdout.write(question + prompt)
        choice = input().lower()
        if default is not None and choice == '':
            return valid[default]
        elif choice in valid:
            return valid[choice]
        else:
            sys.stdout.write("Please respond with 'yes' or 'no' "
                             "(or 'y' or 'n').\n")
def get_filename(url):
    filename = url.rsplit('/', 1)

    while True:
        query = "Is filename,'{}' correct?".format(unquote(filename[1]))
        if not query_yes_no(query):
            filename[1] = input('Set file name: ')
        else:
            break

    return filename

def get_filters(file_name):
    print('Define filter')
    print(file_name)
    name_filter = input('')
    left_stop = name_filter.find('x')
    right_stop = name_filter.rfind('x')

    if left_stop is right_stop: right_stop+=1

    counter_start = 0
    counter_range = 3
    try:
        counter_start = int(input('Define start: '))
        counter_range = int(input('Define range: '))
    except ValueError:
        print("Enter a number.")

    return (left_stop, right_stop), counter_start, counter_range


def download_files(filters, url, _filename):
    lstop = filters[0][0]
    rstop = filters[0][1]
    for x in range(filters[1],filters[1]+filters[2]):
        filename = _filename[0:lstop:]+str(x)+_filename[rstop::]
        url_ = url+'/'+filename
        print(url_)
        download_file(url_, unquote(filename))

def download_file(url, file_name):
    try:
        with urllib.request.urlopen(url) as response, open(file_name, 'wb') as file_:
            shutil.copyfileobj(response, file_)
    except HTTPError as err:
        print(err)

url, filename = get_filename(args.url)
download_files(get_filters(filename), url, filename)
