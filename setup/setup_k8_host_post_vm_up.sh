# create SSH key (uncomment if no SSH key available)
ssh-keygen -t rsa -b 4096 -N ''

# copy ssh keys to nodes 
# Master Nodes
for host in k8-master-node-0{1..1}; do
  ssh-copy-id root@$host
done

# Worker Nodes
for host in k8-worker-node-0{1..2}; do
  ssh-copy-id root@$host
done

#set hostnames 
# Master Nodes
for host in k8-master-node-0{1..1}.k8-cluster-test.com; do
  ssh root@$host "hostnamectl set-hostname $host"
done

# Worker Nodes
 for host in k8-worker-node-0{1..2}.k8-cluster-test.com; do
  ssh root@$host "hostnamectl set-hostname $host"
 # ssh root@$host 'hostnamectl set-hostname '"$host"''
done
