#!/bin/bash

echo "========================================"
echo "Switching to GREEN environment"
echo "========================================"

kubectl patch service blue-green-service -p '{"spec":{"selector":{"version":"green"}}}'

echo ""
echo "✅ Service selector updated to GREEN"
echo ""

sleep 5

echo "New endpoints (should be GREEN pods):"
kubectl get endpoints blue-green-service

echo ""
echo "Verifying GREEN deployment status:"
kubectl get pods -l version=green

echo ""
echo "========================================"
echo "Traffic is now routed to GREEN!"
echo "========================================"
