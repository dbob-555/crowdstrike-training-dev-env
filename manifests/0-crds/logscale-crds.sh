!/bin/bash
export HUMIO_OPERATOR_VERSION=0.25.0
kubectl apply --server-side -f https://raw.githubusercontent.com/humio/humio-operator/humio-operator-${HUMIO_OPERATOR_VERSION}/config/crd/bases/core.humio.com_humioclusters.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/humio/humio-operator/humio-operator-${HUMIO_OPERATOR_VERSION}/config/crd/bases/core.humio.com_humioexternalclusters.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/humio/humio-operator/humio-operator-${HUMIO_OPERATOR_VERSION}/config/crd/bases/core.humio.com_humioingesttokens.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/humio/humio-operator/humio-operator-${HUMIO_OPERATOR_VERSION}/config/crd/bases/core.humio.com_humioparsers.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/humio/humio-operator/humio-operator-${HUMIO_OPERATOR_VERSION}/config/crd/bases/core.humio.com_humiorepositories.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/humio/humio-operator/humio-operator-${HUMIO_OPERATOR_VERSION}/config/crd/bases/core.humio.com_humioviews.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/humio/humio-operator/humio-operator-${HUMIO_OPERATOR_VERSION}/config/crd/bases/core.humio.com_humioalerts.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/humio/humio-operator/humio-operator-${HUMIO_OPERATOR_VERSION}/config/crd/bases/core.humio.com_humioaggregatealerts.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/humio/humio-operator/humio-operator-${HUMIO_OPERATOR_VERSION}/config/crd/bases/core.humio.com_humiofilteralerts.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/humio/humio-operator/humio-operator-${HUMIO_OPERATOR_VERSION}/config/crd/bases/core.humio.com_humioscheduledsearches.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/humio/humio-operator/humio-operator-${HUMIO_OPERATOR_VERSION}/config/crd/bases/core.humio.com_humioactions.yaml
kubectl apply --server-side -f https://raw.githubusercontent.com/humio/humio-operator/humio-operator-${HUMIO_OPERATOR_VERSION}/config/crd/bases/core.humio.com_humiobootstraptokens.yaml
