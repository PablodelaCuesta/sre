# Scheduling in Kubernetes


## Attach label to the node

````bash
# Get labels nodes
kubectl get nodes --show-labels

# Taints and names
kubectl describe node <node-name> | grep -i taint
kubectl describe node <node-name> | grep -i name=

# Set a label to a specific node
kubectl label nodes <node-name> <label-key>=<label-value>:<effect>

# Full list of labels of the given node
kubectl describe node <node-name>
````

## Add a nodeSelector field to your pod configuration

````yaml
apiVersion: v1
kind: Pod
metadata:
  name: nginx
  labels:
    env: test
spec:
  containers:
  - name: nginx
    image: nginx
  nodeSelector:
    <label-key>:<label-value>
````

### Verify

````bash
# Verify that pod is deploy in that node
kubectl get pods -o wide
````