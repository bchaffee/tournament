Swiss Pairings Program version 1.0 10/11/2015

Name: Brandon Chaffee
Number: (415)720-4705
Email: Brandon Chaffee

General Usage Notes
---------------------------------------------------
-This program is used to implement a swiss pairings match system. The program consists of three files (two Python files and one SQL file). Tournament.sql implements the database and all necessary views and tables for the swiss pairing system. Tournament.py is consists of all function necessary to initialize players, appropriate matches. Tournament_test.py tests the efficacy of Tournament.py and Tournament.sql schema.

Running the Program
---------------------------------------------------
-To run the Swiss Pairings Program please do the following:
1. Install Vagrant 1.1.4
2. Install VirtualMachine or similar application
3. Open a new terminal shell
4. Within the terminal shell, run the command: vagrant Up
--This command powers up the virtual machine
5. Once Vagrant has finished installing, run the command: vagrant ssh
--This command logs into the virtual machine
6. Once logged into the virtual machine, navigate to the tournament folder
--This can be done by running the prompt: cd vagrant/tournament
7. Once in the linked tournament folder, launch the psql command line interface with the command: psql
8. Once in the psql command line interface, the schema can be set up in two manors:
--Import the tournament.sql file directly through the prompt: \i tournament.sql
--Manually create the schema by copying and pasting all the content from tournament.sql file into the psql command line interface
9. Vagrant and virtual machine are now established, and the Swiss Pairings schema has been created. You are now ready to run tournament_test.py and the subsequent tournament.py files. You can also create matches and add players as you see fit.
--The tournament_test.py can be run by quitting from the psql command line interface (command: \q) and running the command: python tournament_test.py

Required Software
---------------------------------------------------
-Python 2.x
-Texteditor
-Postgresql
-Vagrant
-VirtualMachine

