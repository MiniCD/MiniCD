# MiniCD
The simplest k8s CI/CD system you'll ever find.

1. [Get a cluster](./docs/create-cluster.md).
2. Install MiniCD: `kubectl apply -f https://raw.githubusercontent.com/MiniCD/MiniCD/master/minicd.yaml`.
3. Configure MiniCD (see below): `kubectl create configmap [options]`
3. [Setup the WebHook](docs/setup-webhook.md) in a git provider of your choice: GitHub/GitLab/etc.
4. Profit! 🍺

## Configuration
MiniCD works with many different repositories. For example:

- **the minimal setup** needs just a Dockerfile. MiniCD will configure a k8s deployment and service for you.
- **Helm configuration**. If your repository contains a Helm configuration we'll install your app using Helm.
- ... or, feel free to contribute to MiniCD and add more integrations!

### Configuration
Simply configure your repository with MiniCD to allow it to get your code:

```bash
kubectl create configmap my-simple-repository \
  --namespace=minicd \
	--from-literal=git.url=git://github.com:myrepository.git \
	--from-file=git.rsa.pem=~/.ssh/rsa.pem
```
