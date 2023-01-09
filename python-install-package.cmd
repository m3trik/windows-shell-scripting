0<0# : ^
''' 
@echo off
echo batch code
python %~f0 %* 
exit /b 0

rem Example usage:
rem call install-python-package.cmd install_package

rem The first line will be boolean expression in python,
rem but a redirection to an empty label in batch. 
rem The rest of the batch code will be within multiline python comment.

'''
import sys

from setuptools import setup



def install_package():
	'''packages and installs a library.
	'''
	name = input("path to package: ")
	print ('name: '+name)
	#setup(
	#	name=name,
	#	packages=["."],
	#)

eval(sys.argv[1] + '()')
exit()