## Installing the Client Tools

---

In this lab you will install the command line utilities required to complete this tutorial: [cfssl](https://github.com/cloudflare/cfssl), [cfssljson](https://github.com/cloudflare/cfssl), and [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl).

---

### Install CFSSL

The `cfssl` and `cfssljson` command line utilities will be used to provision a [PKI Infrastructure](https://en.wikipedia.org/wiki/Public_key_infrastructure) and generate TLS certificates.

+++

Download and install `cfssl` and `cfssljson` from the [cfssl repository](https://pkg.cfssl.org):

+++

### For Linux 

```
curl -o cfssl https://pkg.cfssl.org/R1.2/cfssl_linux-amd64
curl -o cfssljson https://pkg.cfssl.org/R1.2/cfssljson_linux-amd64
```

+++

```
chmod +x cfssl cfssljson

sudo mv cfssl cfssljson /usr/local/bin/
```

---

### Verification

Verify `cfssl` version 1.2.0 or higher is installed:

```
cfssl version
```

+++

output

```
Version: 1.2.0
Revision: dev
Runtime: go1.6
```

+++

The cfssljson command line utility does not provide a way to print its version.

---

### Install kubectl

The `kubectl` command line utility is used to interact with the Kubernetes API Server. Download and install `kubectl` from the official release binaries:

+++

### Linux 

```
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl

chmod +x kubectl

sudo mv kubectl /usr/local/bin/
```

+++

### Verification

Verify `kubectl` version 1.8.0 or higher is installed:

```
kubectl version --client
```

+++

output

```
Client Version: version.Info{Major:"1", Minor:"8", GitVersion:"v1.8.0", GitCommit:"6e937839ac04a38cac63e6a7a306c5d035fe7b0a", GitTreeState:"clean", BuildDate:"2017-09-28T22:57:57Z", GoVersion:"go1.8.3", Compiler:"gc", Platform:"darwin/amd64"}
```

