##install git wget curl vim bash-completion
sudo apt update
sudo apt install git wget curl vim bash-completion

##DL Ansible pip:
#curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
#python3 get-pip.py --user

##install Ansible by pip
#python3 -m pip install ansible --user

# OR use your Distributions ansible 
sudo apt install ansible-base

##modify /etc/hosts (edit hosts_to_add file in this directory first)
sudo cp -f /etc/hosts /etc/hosts.backup_k8
sudo sed -i '/#added\ automatically\ by\ k8\ setup\ script/d' /etc/hosts
sudo sh -c "cat hosts_to_add >> /etc/hosts"

# create SSH key (uncomment if no SSH key available)
# ssh-keygen -t rsa -b 4096 -N ''

# copy ssh keys to nodes 
# Master Nodes
#for host in k8-master-node-0{1..1}; do
#  ssh-copy-id root@$host
#done

# Worker Nodes
#for host in k8-worker-node-0{1..2}; do
#  ssh-copy-id root@$host
#done
