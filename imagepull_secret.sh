kubectl create secret generic regcred    --from-file=.dockerconfigjson=${XDG_RUNTIME_DIR}/containers/auth.json    --type=kubernetes.io/dockerconfigjson
