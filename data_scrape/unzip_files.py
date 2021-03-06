#!/usr/bin/env python

"""Unzips all of the downloaded IPEDS files"""

import os
import re
import zipfile

__author__ = "Matthew Naven"
__copyright__ = "Copyright 2016, Matthew Naven"
__email__ = "msnaven@ucdavis.edu"


ipeds_directory = os.path.join(os.path.dirname(os.path.abspath(__file__)), os.path.pardir)

# Go through all the files and folders contained in the IPEDS directory
for directory_path, directory_names_list, file_names_list in os.walk(ipeds_directory):
    directory_name = os.path.basename(directory_path)
    if re.fullmatch("[0-9]{4}", directory_name):
        for file_name in file_names_list:
            print("Checking if " + file_name + " is a zip file")
            if file_name.endswith(".zip"):
                print(file_name + " is a zip file")
                zip_file_path = os.path.join(directory_path, file_name)
                with zipfile.ZipFile(zip_file_path, 'r') as zipped_file:
                    print("Unzipping " + file_name + " to " + directory_path)
                    zipped_file.extractall(directory_path)
