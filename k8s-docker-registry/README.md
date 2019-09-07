Installation:

```bash
kubectl apply -f builder.yaml -f registry.yaml
```

Manually push image to registry to then test using `kubectl apply -f dummy.yaml`:

```bash
kubectl exec -it [dind-pod] sh -c "\
  docker pull alpine; \
  docker tag alpine image-registry:443/alpine; \
  docker push image-registry:443/alpine";
kubectl apply -f dummy.yaml; # use that new image
```

This will upload alpine to the k8s based registry, the certificates of which
are available in k8s pods **and** nodes. Remaining issue is that the node can
not find the image-registry:443 repository or the localhost:31443 repository:
apparently localhost is not routed to Service NodePort, unfortunately.

Workaround might be to make the repository 'publically' accessible (secured
with TLS client cert?), and regard it as 'external' from the perspective of
the nodes.
