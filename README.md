# mutatingwebhook

Webbhook, that is able to inject labels to pods.


Original sourcecode by "ThatDevOpsGuy"

## Installation
First install the gencerts helm chart, that will generate a self signed cert.
Afterwards install the mtwehook chart.


## Current function
Injects a label if the label example-webhook-enabled: "true" existt

## Next steps:

- make configureable: Intended to add annotations to pvcs dependent on storage class 
