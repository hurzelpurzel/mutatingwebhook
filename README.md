# mutatingwebhook

Webbhook, that is able to inject labels to pods.


Originated by "ThatDevOpsGuy"

## Installation
First install the gencerts helm chart, that will generate a self signed cert.
Afterwards install the mutatingwehook

## Current function
Injects a label if the label example-webhook-enabled: "true" existt

## Next steps:

- create a helm chart to install it : Ongoing
- make configureable: Intended to add annotations to pvcs dependent on storage class 
