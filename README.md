# Redis Cluster GitHub Action

This [GitHub Action](https://github.com/features/actions) sets up Redis cluster with 3 master and 3 slave in a single container for your testing purpose.

The image used is from https://hub.docker.com/r/vishnunair/docker-redis-cluster

# Usage

See [action.yml](action.yml)

Basic:
```yaml
steps:
- uses: vishnudxb/redis-cluster@1.0.7
  with:
    master1-port: 5000
    master2-port: 5001
    master3-port: 5002
    slave1-port: 5003
    slave2-port: 5004
    slave3-port: 5005
```

Sample usage in github action job:

```yaml
jobs:
  setup-build-publish-deploy:
    name: Run tests
    runs-on: ubuntu-latest
    steps:
    - name: Checkout
      uses: actions/checkout@v2
      with:
        token: ${{ secrets.GITHUB_TOKEN }}
        submodules: true

    - name: Test redis cluster
      uses: vishnudxb/redis-cluster@1.0.7
      with:
        master1-port: 5000
        master2-port: 5001
        master3-port: 5002
        slave1-port: 5003
        slave2-port: 5004
        slave3-port: 5005

     # Running Test
    - name: Running Test
      run: |
         sudo apt-get install -y redis-tools
         docker ps -a
         redis-cli -h 127.0.0.1 -p 5000 ping
         redis-cli -h 127.0.0.1 -p 5000 cluster nodes
```

## You can see the Output something like below from the Github action log:

![](https://i.imgur.com/JtzVMNr.png)

# License

The scripts and documentation in this project are released under the [MIT License](LICENSE)
