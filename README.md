Full Stack Nanodegree Project 2
===============================

To run:
- clone this repository to your machine
- start up vagrant using `vagrant up`
- connect to the vagrant vm using `vagrant ssh`
- go to the tournament directory using `cd /vagrant/tournament`
- open PostgreSQL shell using `psql`
- create database tournament using `create database tournament`
- connect to the tournament database using `\connect tournament`
- create tables and views using `\i tournament.sql`
- exit psql with `ctrl+d`
- run tests using `python tournament_test.py`

Once the above steps are done, the following output should be shown:
```
vagrant@vagrant-ubuntu-trusty-32:/vagrant/tournament$ python tournament_test.py 
1. Old matches can be deleted.
2. Player records can be deleted.
3. After deleting, countPlayers() returns zero.
4. After registering a player, countPlayers() returns 1.
5. Players can be registered and deleted.
6. Newly registered players appear in the standings with no matches.
7. After a match, players have updated standings.
8. After one match, players with one win are paired.
Success!  All tests pass!
```
