ls -1 | awk  -vpath=$PWD/ '{print path$1}' > absolute_path_current_directory_files.txt

#---with a certain extension then use below
#find `pwd` -name .htaccess 