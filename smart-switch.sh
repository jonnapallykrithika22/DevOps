#!/bin/bash

TARGET_VERSION=$1

if [ -z "$TARGET_VERSION" ]; then
    echo "Usage: ./smart-switch.sh [blue|green]"
    exit 1
fi

echo "========================================"
echo "Switching to $TARGET_VERSION environment"
echo "========================================"

# Check if target deployment is healthy
READY_PODS=$(kubectl get deployment ${TARGET_VERSION}-deployment -o jsonpath='{.status.readyReplicas}')
DESIRED_PODS=$(kubectl get deployment ${TARGET_VERSION}-deployment -o jsonpath='{.spec.replicas}')

if [ "$READY_PODS" != "$DESIRED_PODS" ]; then
    echo "❌ ERROR: $TARGET_VERSION deployment is not healthy"
    echo "   Ready: $READY_PODS / Desired: $DESIRED_PODS"
    exit 1
fi

echo "✅ $TARGET_VERSION deployment is healthy ($READY_PODS/$DESIRED_PODS pods ready)"

# Perform the switch
kubectl patch service blue-green-service -p "{\"spec\":{\"selector\":{\"version\":\"$TARGET_VERSION\"}}}"

echo ""
echo "⏳ Waiting for endpoints to update..."
sleep 3

# Verify switch
CURRENT_VERSION=$(kubectl get service blue-green-service -o jsonpath='{.spec.selector.version}')

if [ "$CURRENT_VERSION" == "$TARGET_VERSION" ]; then
    echo "✅ Successfully switched to $TARGET_VERSION"
    echo ""
    kubectl get endpoints blue-green-service
else
    echo "❌ Switch failed! Current version: $CURRENT_VERSION"
    exit 1
fi

echo ""
echo "========================================"
echo "Traffic is now routed to $TARGET_VERSION!"
echo "========================================"
