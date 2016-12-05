vector-utils
============

vector-utils is a collection of scripts for managing large numbers of similar machines over an ssh connection. It includes the following:

* scatter - copy a list of files to every machine.
* gather - copy a list of files from every machine. Local copies will be suffixed with "`,$REMOTE_HOST`".
* vector - pass a string of shell commands to every machine. The string can include shell metacharacters.

It has one configuration file, either `/etc/vector.conf` or `/usr/local/etc/vector.conf`, depending on whether it was installed from a package or a tarball. This currently has one parameter, a list of hostnames that the tools should operate on. It is recommended not to include the local machine in this list.

`vector` itself can be thought of as a lightweight, command-line alternative to clusterssh - but clusterssh does not include a scatter-gather function.

[vector-utils.tar](https://andrewg.com/software/vector-utils.tar)

Examples
--------

/etc/vector.conf:
```
if [[ -z $MACHINES ]];
  MACHINES=myhost1 myhost2 otherhost1.otherdomain
fi
```

It is recommended to use the -z construction, so that the list of machines can be overridden on the command line.

```
$ scatter file1 file2
$ gather file1 file2 
# local directory now contains: file1,host1 file2,host1 file1,host2 file2,host2 ...
$ vector "apt-get update && apt-get upgrade"
$ MACHINES="othermachine.example.com" vector hostname
```

