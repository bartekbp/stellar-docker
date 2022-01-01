## Stellar docker - fast database restoration tool in a container
The project aims to simplify using [stellar](https://github.com/fastmonkeys/stellar), 
amazing tool accelerating database restoration. 

The original project doesn't seem be be maintained anymore, so this projects packages it using docker.
You don't need to worry about incompatible python version dependencies or an interpreter.

### How to use it 

1. Create a directory to keep `stellar.yaml` file
2. Run docker image `bartoszpolnik/stellar:latest` with read-write volumen mounted to **/data** 
directory inside the container e.g.:
```
docker run -it -v $folderWithStellarYaml:/data bartoszpolnik/stellar:latest init
```
It will prompt `stellar` to create a new configuration. If your database is hosted on `localhost`, 
replace hostname with `host.docker.internal`. This will make docker correctly resolve the ip to your host.  
4. After the `stellar.yaml` is created, you can execute commands by passing them to the container as follows: 
```
docker run -it -v $yourVolumen:/data --sysctl net.ipv4.tcp_keepalive_time=60 bartoszpolnik/stellar:latest $yourCommand$
```

It's important to remember about setting `net.ipv4.tcp_keepalive_time`, otherwise 
connection between running in a container `stellar` and database 
may be dropped due to inactivity when performing a snapshot.  

### Limitations

Image contains only driver for postgresql. Contibutions to add mysql appreciated!

### Special thanks to
- [@fastmonkeys](https://github.com/fastmonkeys/stellar) for creating stellar