# DB Server Startup Script

The purpose of this script is to start a mock DB server (`.\Bin\DBServer.exe`) with arguments taken from one of the configuration files in `.\Config`. 

The script is launched by starting `.\StartDatabase.ps1` with `-ConfigFileName` argument.

## Expected DBServer.exe output when started with TestDBConfig
```
** DB Server **

Server started with following arguments:
Database name:          TestDatabase
Connection string:      \Test\DBS\01
Database size:          50 Gb

Tables:
        Clients
        Orders
        Expenses
        Deliveries
```

## Example of DBServer.exe startup arguments
`.\DBServer.exe TestDatabase \Test\DBS\01 50 Clients Orders Expenses Deliveries`