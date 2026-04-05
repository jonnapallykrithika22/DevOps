#!/bin/bash

echo "========================================"
echo "⚠️  ROLLING BACK to BLUE environment"
echo "========================================"

kubectl patch service blue-green-service -p '{"spec":{"selector":{"version":"blue"}}}'

echo ""
echo "✅ Service selector updated to BLUE"
echo ""

sleep 5

echo "New endpoints (should be BLUE pods):"
kubectl get endpoints blue-green-service

echo ""
echo "Verifying BLUE deployment status:"
kubectl get pods -l version=blue

echo ""
echo "========================================"
echo "Traffic is now routed to BLUE!"
echo "========================================"
