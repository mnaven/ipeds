import os
from replace_insheet_file_path_function import replace_ipeds_insheet_file_path

__author__ = 'Naven'


directory = "/Users/Naven/Documents/Research/data/ipeds/raw_data"
for directory_path, directory_names_list, file_names_list in os.walk(directory):
    for file_name in file_names_list:
        print("Checking if " + file_name + " ends in .do")
        if file_name.endswith(".do"):
            print(file_name + " ends in .do")
            print("Replacing the insheet file path in " + file_name)
            file_path = os.path.join(directory_path, file_name)
            replace_ipeds_insheet_file_path(file_path)
