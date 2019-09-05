docker build -t gandeveloper/multi-client:latest -t gandeveloper/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t gandeveloper/multi-server:latest -t gandeveloper/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t gandeveloper/multi-worker:latest -t gandeveloper/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push gandeveloper/multi-client:latest
docker push gandeveloper/multi-server:latest
docker push gandeveloper/multi-worker:latest
docker push gandeveloper/multi-client:$SHA
docker push gandeveloper/multi-server:$SHA
docker push gandeveloper/multi-worker:$SHA
kubectl apply -f k8s
kubectl set image deployments/server-deployment server=gandeveloper/multi-server:$SHA
kubectl set image deployments/client-deployment client=gandeveloper/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=gandeveloper/multi-worker:$SHA







