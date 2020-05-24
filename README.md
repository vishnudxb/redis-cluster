# Redis Cluster GitHub Action

This [GitHub Action](https://github.com/features/actions) sets up Redis cluster with 3 master and 3 slave in a single container for your testing purpose.

The image used is from https://github.com/vishnudxb/docker-redis-cluster

# Usage

See [action.yml](action.yml)

Basic:
```yaml
steps:
- uses: vishnudxb/redis-cluster@1.0.5
  with:
    master1-port: 5000
    master2-port: 5001
    master3-port: 5002
    slave1-port: 5003
    slave2-port: 5004
    slave3-port: 5005
```

# License

The scripts and documentation in this project are released under the [MIT License](LICENSE)
