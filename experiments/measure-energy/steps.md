## Steps

1. set-up monitoring pods
```
kubectl apply -f pod-gpgnode12.yaml 
kubectl apply -f pod-gpgnode13.yaml 
kubectl apply -f pod-gpgnode14.yaml 
kubectl apply -f pod-gpgnode15.yaml 
kubectl apply -f pod-gpgnode16.yaml 
kubectl apply -f pod-gpgnode17.yaml 
kubectl apply -f pod-gpgnode18.yaml 
kubectl apply -f pod-gpgnode19.yaml 
```

2. copy measurement scripts to machines 
```
kubectl cp collect_energy_gpgnode12.sh kathleen-pod-gpgnode12:/private-data
kubectl cp collect_energy_gpgnode13.sh kathleen-pod-gpgnode13:/private-data
kubectl cp collect_energy_gpgnode14.sh kathleen-pod-gpgnode14:/private-data
kubectl cp collect_energy_gpgnode15.sh kathleen-pod-gpgnode15:/private-data
kubectl cp collect_energy_gpgnode16.sh kathleen-pod-gpgnode16:/private-data
kubectl cp collect_energy_gpgnode17.sh kathleen-pod-gpgnode17:/private-data
kubectl cp collect_energy_gpgnode18.sh kathleen-pod-gpgnode18:/private-data
kubectl cp collect_energy_gpgnode19.sh kathleen-pod-gpgnode19:/private-data
```

3. start script - measure energy
```
kubectl exec -it kathleen-pod-gpgnode12 -- /bin/bash
nohup /private-data/collect_energy_gpgnode12.sh /private-data/energy_log_gpgnode12.txt /private-data/energy_DRAM_log_gpgnode12.txt &
kubectl exec -it kathleen-pod-gpgnode13 -- /bin/bash
nohup /private-data/collect_energy_gpgnode13.sh /private-data/energy_log_gpgnode13.txt /private-data/energy_DRAM_log_gpgnode13.txt &
kubectl exec -it kathleen-pod-gpgnode14 -- /bin/bash
nohup /private-data/collect_energy_gpgnode14.sh /private-data/energy_log_gpgnode14.txt /private-data/energy_DRAM_log_gpgnode14.txt &
kubectl exec -it kathleen-pod-gpgnode15 -- /bin/bash
nohup /private-data/collect_energy_gpgnode15.sh /private-data/energy_log_gpgnode15.txt /private-data/energy_DRAM_log_gpgnode15.txt &
kubectl exec -it kathleen-pod-gpgnode16 -- /bin/bash 
nohup /private-data/collect_energy_gpgnode16.sh /private-data/energy_log_gpgnode16.txt /private-data/energy_DRAM_log_gpgnode16.txt &
kubectl exec -it kathleen-pod-gpgnode17 -- /bin/bash 
nohup /private-data/collect_energy_gpgnode17.sh /private-data/energy_log_gpgnode17.txt /private-data/energy_DRAM_log_gpgnode17.txt &
kubectl exec -it kathleen-pod-gpgnode18 -- /bin/bash
nohup /private-data/collect_energy_gpgnode18.sh /private-data/energy_log_gpgnode18.txt /private-data/energy_DRAM_log_gpgnode18.txt &
kubectl exec -it kathleen-pod-gpgnode19 -- /bin/bash
nohup /private-data/collect_energy_gpgnode19.sh /private-data/energy_log_gpgnode19.txt /private-data/energy_DRAM_log_gpgnode19.txt &
```

4. kill scripts
```
kubectl exec -it kathleen-pod-gpgnode12 -- /bin/bash
kubectl exec -it kathleen-pod-gpgnode13 -- /bin/bash
kubectl exec -it kathleen-pod-gpgnode14 -- /bin/bash
kubectl exec -it kathleen-pod-gpgnode15 -- /bin/bash
kubectl exec -it kathleen-pod-gpgnode16 -- /bin/bash 
kubectl exec -it kathleen-pod-gpgnode17 -- /bin/bash 
kubectl exec -it kathleen-pod-gpgnode18 -- /bin/bash
kubectl exec -it kathleen-pod-gpgnode19 -- /bin/bash
...
ps -elf
kill -9 <pid>
```

5. retrieve data
```
mkdir run-data
cd run-data
kubectl cp kathleen-pod-gpgnode12:private-data/energy_log_gpgnode12.txt energy_log_gpgnode12.txt
kubectl cp kathleen-pod-gpgnode13:private-data/energy_log_gpgnode13.txt energy_log_gpgnode13.txt
kubectl cp kathleen-pod-gpgnode14:private-data/energy_log_gpgnode14.txt energy_log_gpgnode14.txt
kubectl cp kathleen-pod-gpgnode15:private-data/energy_log_gpgnode15.txt energy_log_gpgnode15.txt
kubectl cp kathleen-pod-gpgnode16:private-data/energy_log_gpgnode16.txt energy_log_gpgnode16.txt
kubectl cp kathleen-pod-gpgnode17:private-data/energy_log_gpgnode17.txt energy_log_gpgnode17.txt
kubectl cp kathleen-pod-gpgnode18:private-data/energy_log_gpgnode18.txt energy_log_gpgnode18.txt
kubectl cp kathleen-pod-gpgnode19:private-data/energy_log_gpgnode19.txt energy_log_gpgnode19.txt
kubectl cp kathleen-pod-gpgnode12:private-data/energy_DRAM_log_gpgnode12.txt energy_DRAM_log_gpgnode12.txt
kubectl cp kathleen-pod-gpgnode13:private-data/energy_DRAM_log_gpgnode13.txt energy_DRAM_log_gpgnode13.txt
kubectl cp kathleen-pod-gpgnode14:private-data/energy_DRAM_log_gpgnode14.txt energy_DRAM_log_gpgnode14.txt
kubectl cp kathleen-pod-gpgnode15:private-data/energy_DRAM_log_gpgnode15.txt energy_DRAM_log_gpgnode15.txt
kubectl cp kathleen-pod-gpgnode16:private-data/energy_DRAM_log_gpgnode16.txt energy_DRAM_log_gpgnode16.txt
kubectl cp kathleen-pod-gpgnode17:private-data/energy_DRAM_log_gpgnode17.txt energy_DRAM_log_gpgnode17.txt
kubectl cp kathleen-pod-gpgnode18:private-data/energy_DRAM_log_gpgnode18.txt energy_DRAM_log_gpgnode18.txt
kubectl cp kathleen-pod-gpgnode19:private-data/energy_DRAM_log_gpgnode19.txt energy_DRAM_log_gpgnode19.txt
mv run-data wf-iteration
```

6. delete pods, pvc, pv
```
kubectl delete pod kathleen-pod-gpgnode12
kubectl delete pvc kathleen-energy-pvc-gpgnode12
kubectl delete pv kathleen-energy-pvc-gpgnode12

kubectl delete pod kathleen-pod-gpgnode13
kubectl delete pvc kathleen-energy-pvc-gpgnode13
kubectl delete pv kathleen-energy-pvc-gpgnode13

kubectl delete pod kathleen-pod-gpgnode14
kubectl delete pvc kathleen-energy-pvc-gpgnode14
kubectl delete pv kathleen-energy-pvc-gpgnode14

kubectl delete pod kathleen-pod-gpgnode15
kubectl delete pvc kathleen-energy-pvc-gpgnode15
kubectl delete pv kathleen-energy-pvc-gpgnode15

kubectl delete pod kathleen-pod-gpgnode16
kubectl delete pvc kathleen-energy-pvc-gpgnode16
kubectl delete pv kathleen-energy-pvc-gpgnode16

kubectl delete pod kathleen-pod-gpgnode17
kubectl delete pvc kathleen-energy-pvc-gpgnode17
kubectl delete pv kathleen-energy-pvc-gpgnode17

kubectl delete pod kathleen-pod-gpgnode18
kubectl delete pvc kathleen-energy-pvc-gpgnode18
kubectl delete pv kathleen-energy-pvc-gpgnode18

kubectl delete pod kathleen-pod-gpgnode19
kubectl delete pvc kathleen-energy-pvc-gpgnode19
kubectl delete pv kathleen-energy-pvc-gpgnode19
```
