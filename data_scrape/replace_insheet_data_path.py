#!/usr/bin/env python

"""Changes the insheet data file path to match the local data file path in an IPEDS insheet file"""

import os
import re
from replace_insheet_data_path_function import ipeds_replace_insheet_data_path

__author__ = "Matthew Naven"
__copyright__ = "Copyright 2016, Matthew Naven"
__email__ = "msnaven@ucdavis.edu"


ipeds_directory = os.path.join(os.path.dirname(os.path.abspath(__file__)), os.path.pardir)
do_files_directory = os.path.join(ipeds_directory, "do_files")

for directory_path, directory_names_list, file_names_list in os.walk(do_files_directory):
    directory_name = os.path.basename(directory_path)
    if re.fullmatch("[0-9]{4}", directory_name):
        for file_name in file_names_list:
            print("Checking if " + file_name + " is a do file")
            if file_name.endswith(".do"):
                print(file_name + " is a do file")
                print("Deleting original insheet file path in " + file_name)
                do_file_path = os.path.join(directory_path, file_name)
                ipeds_replace_insheet_data_path(do_file_path)
